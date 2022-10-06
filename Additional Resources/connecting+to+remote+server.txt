Using Passwrod:

ssh user_name@remote_ip

ssh remote_ip   (here remote user name is same as local terminal user)

vi /etc/ssh/sshd_config (Make it; PasswordAuthentication yes  in remote server)
========================================================================

Using passwordless:
-------------------
Step1: On local server generate keys using ssh-keygen
Step2: go to user_home/.ssh then here you will find two files
		id_rsa  (private key, it should be safe)
		id_rsa.pub (public, this has to share with remote servers)
Step3: use below command to share public key with remtoe server, it will ask password
       ssh-copy-id username@remote_server_ip    
Step4: if step3 is success then use below command to login with remote server, it wont ask password now
        ssh username@remote_server_ip

