#!/bin/bash
#Author: Narendra
#Version: 1.0
COLUMNS=$(tput cols)
get_date_time(){
 echo $(date '+%d-%m-%Y %r')
}
prRed(){
  echo -e "\033[91m$1 \033[00m"
}
prGreen(){
  echo -e "\033[92m$1 \033[00m"
}
prYellow(){
  echo -e "\033[93m$1 \033[00m"
}
prPurple(){
  echo -e "\033[95m$1 \033[00m"
}
prCyan(){
  echo -e "\033[96m$1 \033[00m"
}
prHeader(){
 for each in $(seq 1 $COLUMNS)
 do
   echo -n $1
 done

}
prtxtCentre(){
 title=$1
 printf "%*s\n" $(((${#title}+$COLUMNS)/2)) "$title"
}
download_git_versions_info(){
 GIT_VERS_URL="https://mirrors.edge.kernel.org/pub/software/scm/git/"
 GIT_VERS_FILE="git_vers_info.html"
 if [ -e "${GIT_VERS_FILE}" ]
 then
    prYellow "$(get_date_time) Found old ${GIT_VERS_FILE}.Deleting this old file and downloading new content.Please wait..."
    rm -rf ${GIT_VERS_FILE}
 else
    prGreen "$(get_date_time) Downloading git vers info. Please wait..."
 fi
 which wget 1>/dev/null 2>&1
 if [ $? -ne 0 ]
 then
   prRed "$(get_date_time) Sorry unable to download , wget command is not installed on this host. Please install it and retry"
   exit 2
 fi
 wget ${GIT_VERS_URL} --output-document=${GIT_VERS_FILE} 1>/dev/null 2>&1
 if [ $? -ne 0 ]
 then
   prRed "$(get_date_time) Unable to download. Please try the below command manually and verify"
   prRed "$(get_date_time) wget ${GIT_VERS_URL} --output-document=${GIT_VERS_FILE}"
 else
   prGreen "$(get_date_time) Successfully downloaded git vers info from git-scm and stored the info into a file: ${GIT_VERS_FILE}"
 fi
}
diplay_all_available_git_versions(){
  if [ ! -e ${GIT_VERS_FILE} ]
  then
    prRed "$(get_date_time) Unable to find the ${GIT_VERS_FILE}"
  fi
  prPurple "$(get_date_time) Sorting git versions. Please wait..."
  while read line
  do
    git_vers+=($(echo $line | sed -n '/git-\([0-9]\+\.\)\+tar.gz/p'|awk -F '"' '{ print $2 }'|cut -c 5- | awk -F '.tar.gz' '{ print $1}'))

done < ${GIT_VERS_FILE}
  #echo ${#git_vers[@]}
  prHeader "="
  prtxtCentre "$(get_date_time) Displaying all available git versions"
  cnt=0
  no_vers=${#git_vers[*]}
  WIDTH=14
  prHeader "="
  for each_ver in ${git_vers[*]}
  do
   printf "%-*s %-*s %-*s %-*s %-*s %-*s %-*s %-*s\n" $WIDTH  ${git_vers[$cnt]}  $WIDTH ${git_vers[$((cnt+1))]} $WIDTH ${git_vers[$((cnt+2))]} $WIDTH ${git_vers[$((cnt+3))]} $WIDTH  ${git_vers[$((cnt+4))]} $WIDTH  ${git_vers[$((cnt+5))]}  $WIDTH  ${git_vers[$((cnt+6))]} $WIDTH  ${git_vers[$((cnt+7))]}
   cnt=$((cnt+8))
   if [ $cnt -ge $no_vers ]
   then
     break
   fi
  done
  prHeader "_"
}
display_existing_git_info(){
  which git 1>/dev/null 2>/dev/null
  if [ $? -ne 0 ]
  then
    prCyan "$(get_date_time) select git version to install "
    return 0
  fi

  git_ver=$(git --version | awk '{ print $3}')
  prCyan "$(get_date_time) The existing git version: $git_ver"
  return 1
}
get_git_install_location(){
   which git 1>/dev/null 2>&1
   if [ $? -eq 0 ]
   then
     git_path=$(dirname $(which git))
     mv $git_path/git $git_path/git_bkp
     echo $git_path
   else
     echo '/usr/local'
   fi
}
install_update_git(){
  req_git=$1
  git_loc=$(get_git_install_location)
  url_for_req_git="https://mirrors.edge.kernel.org/pub/software/scm/git/git-${req_git}.tar.gz"
  echo "$(get_date_time): Downloading --> $url_for_req_git"
  if  [ ! -e "git-${req_git}.tar.gz" ]
  then
      wget $url_for_req_git
  fi
  echo "$(get_date_time): Extracting git-${req_git}.tar.gz...."
  if [ ! -e git-${req_git} ]
  then
      tar -xvzf git-${req_git}.tar.gz
  fi
  which gcc 1>/dev/null 2>/dev/null || yum install gcc -y
  cd  git-${req_git}; ./configure  ; make ; make install


}
display_current_git(){
 which git 1>/dev/null 2>&1
 if [ $? -eq 0 ]
 then
   prPurple "$(get_date_time): Now the Git on host is: $(git --version)"
 else
   prYellow "Unable to install ur required git."
   if [ -e "$git_path/git_bkp" ]
   then
     $git_path/git_bkp $git_path/git
   fi
 fi
}
main() {
  clear
  prHeader "="
  prtxtCentre "Welcome to Automate Git installation using shell script"
  prHeader "="
  prCyan "$(get_date_time) Checking all available git versions from official git-scm websites. Please wait...."
  download_git_versions_info
  diplay_all_available_git_versions
  display_existing_git_info
  if [ $? -eq 0 ]
  then
    read -p "$(get_date_time) Enter your required git version to install: " GIT_TO_INSTALL
    install_update_git $GIT_TO_INSTALL
    display_current_git
  else
    read -e -i no -p "$(get_date_time) Do you want to update/downgrade git ? (yes/no)" GIT_CNF
    GIT_CNF=${GIT_CNF,,}
    #echo $GIT_CNF
    if [ "${GIT_CNF}" == "yes" ]
    then
      read -e -i ${git_ver} -p "$(get_date_time) Enter your required git version to update: " GIT_TO_INSTALL
      if [ "${GIT_TO_INSTALL}" == "${git_ver}" ]
      then
        prRed "$(get_date_time) Thank you for using $0 script"
        prHeader "="
        exit 0
      fi
      if [ "${GIT_TO_INSTALL}" \< "${git_ver}" ]
      then
        prGreen "$(get_date_time) Downgrading existing git ${git_ver} to required git ${GIT_TO_INSTALL}. Please wait..."
        install_update_git $GIT_TO_INSTALL
        display_current_git
        prHeader "="
        exit 0
      else
        prGreen "$(get_date_time) Updating existing git ${git_ver} to required git ${GIT_TO_INSTALL}. Please wait..."
        install_update_git $GIT_TO_INSTALL
        display_current_git
        prHeader "="
        exit 0
      fi
    else
      prGreen "$(get_date_time) Thank you for using $0 script"
    fi
 fi

}
if [ $USER != "root" ]
then
    prRed "$(get_date_time) :Please run this script from root user"
    exit 1
else
   main
fi