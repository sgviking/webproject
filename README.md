# Devops Test

## Summary  
1. Install Elasticsearch  
2. Get apache or nginx running on port 80 and 443 with a self signed
cert. Hint: There will be a problem binding to one of the ports.  
3. Setup iptables to allow port 80/443/22  
4. Install docker and make sure the AUFS is used  
5. Setup LVM on the extra disk that is attached to the instance  
6. Install the latest postgres, create a db called ‘xxxxxxxxx’ and a
user called ‘xxxxxxxxx’  
7. Get and install wpscan, scan xxxxxxxxxxxxxxxxx.xx and give us the results  
8. Write a golang program that prints out the current date/time and
compile it to a binary. Do not install go on the server in order to
compile it. Have this run via cron and output to a file in /tmp/cron.log
every 5 minutes. Make sure you capture both regular output and error output.  

## Add galaxy roles  

```
ansible-galaxy install -r requirements.yml -p roles/  
```

## Kill rogue web service  

```
ansible-playbook -i production -u ubuntu --ask-vault-pass kill_rogue_web.yml  
```

## Build web server  

```
ansible-playbook -i production -u ubuntu --ask-vault-pass site.yml  
```

## Run wpscan from docker image   

```
ansible-playbook -i production -u ubuntu --ask-vault-pass wpscan.yml  
```
