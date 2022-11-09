On server terminel.
```
ssh ubuntu@13.250.34.2
scp build.zip ubuntu@54.255.112.89:/var/www/html/threemusketeers
https://418912162951.signin.aws.amazon.com/console
ssh ubuntu@54.255.112.89
make swap   
https://linuxize.com/post/how-to-add-swap-space-on-ubuntu-20-04
````
# Enable ssh connect.
1. Install SSH
- sudo apt install ssh
- sudo systemctl enable --now ssh
- sudo systemctl status ssh
- cd ~/.ssh
- sudo nano
- sudo nano authorized_keys (Add ssh key to server)
Set server SSH key to git hub.
- ssh-keygen -t rsa -b 4096 -C "truongezgg@gmail.com"
- cat ~/.ssh/id_rsa.pub
2. Update packge
sudo apt-get update -y
sudo apt-get upgrade -y
3. Install nodejs & npm
- sudo apt-get install nodejs
- sudo apt-get install npm
- sudo npm install -g n
- sudo n stable
- hash -r
4. Install nginx
```
https://www.linode.com/docs/web-servers/nginx/use-nginx-reverse-proxy/
```
- sudo apt-get update
- sudo apt-get install nginx
- sudo nano /etc/nginx/nginx.conf
- sudo nano /etc/nginx/conf.d/api-master.conf
- sudo vi /etc/nginx/conf.d/api-crawler.conf
```
server {
  listen 80;
  listen [::]:80;
  server_name api.growth-capability.com;
  location / {
      proxy_pass http://localhost:3000/;
  }
}
```
- sudo mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.disabled
- sudo nginx -t
- sudo nginx -s reload
# Setting SSL
```
https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04
```
- sudo apt-get update
- sudo apt-get install python3-certbot-nginx
- sudo certbot --nginx -d api.growth-capability.com
Auto renew ssl
- sudo certbot renew --dry-run
5. Install mongodb
```
https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/
```
# To remove an already installed MongoDB
- sudo apt-get purge mongodb-org*
- sudo rm -r /var/log/mongodb
- sudo rm -r /var/lib/mongodb
# Install mongo
```
- sudo apt-get install gnupg
- wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
- echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-
```
4.list
- sudo apt-get update
- sudo apt-get install -y mongodb-org
- sudo systemctl start mongod
- sudo systemctl daemon-reload
- sudo systemctl enable mongod
- sudo systemctl restart mongod
```
wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb
sudo dpkg -i ./libssl1.1_1.1.0g-2ubuntu4_amd64.deb
rm -i libssl1.1_1.1.0g-2ubuntu4_amd64.deb
```
6. Install redis
- sudo apt update
- sudo apt install redis
- sudo systemctl start redis-server
- sudo systemctl status redis
7. Install mysql-server
- sudo apt update
- sudo apt install mysql-server
Setup mysql and create new username: dotachan, password: Amela@123a@
CREATE USER 'runcrew'@'%' IDENTIFIED WITH mysql_native_password BY 'Amela@123a@';
GRANT ALL PRIVILEGES ON *.* TO 'runcrew'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
CREATE DATABASE runcrew CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
8. Install pm2
- npm i -g pm2
- pm2 start dist/index.js(on dotakyan project)
-DONE-
# Create s3 upload
```
https://docs.aws.amazon.com/AmazonS3/latest/user-guide/create-bu
c0k0e0t0555.html
```
```
server {
  server_name rcr-api.stg1.amelacorp.com;
  location / {
    proxy_pass http://localhost:3000;
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host $host;
    proxy_cache_bypass $http_upgrade;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header X-Forwarded-Proto $scheme;
  }
}
```
```
server {
    server_name rcr-cms.stg1.amelacorp.com;
    # gzip
    gzip on;
    gzip_comp_level 6;
    gzip_vary on;
    gzip_types text/plain text/css application/json application/x-javascript application/javascript text/xml application/xml application/rss+xml text/javascript image/svg+xml application/vnd.ms-fontobject application/x-font-ttf font/opentype;
    root /var/www/html/cms_run_crew/build;
    index index.html;
    location  ~ ^/(.*)$ {
       auth_basic "Restricted Content";
       #auth_basic_user_file /etc/nginx/.htpasswd;
       try_files $uri /$1/index.html /index.html;
    }
}
```
// Create backup mysql
```
mkdir backup
sudo vi backup.sh
mysqldump -u runcrew -p'Amela@123a@' runcrew | gzip>/home/ubuntu/backup/runcrew _`date +"%y%m%d_%H%M%S"`.sql.gz
find /home/ubuntu/backup -mtime +13 -type f -delete
crontab -e
mm hh * * *
```
```
29 11 * * * /bin/bash /home/ubuntu/backup.sh
```
Khi bắt đầu 1 con server cần bật tường lửa.
Open fire wall ubuntu
```
https://www.cyberciti.biz/faq/how-to-configure-firewall-with-ufw-on-ubuntu-20-04-lts/
```
sudo ufw status
sudo ufw default allow outgoing
Default outgoing policy changed to 'allow'
(be sure to update your rules accordingly)
sudo ufw allow ssh
Rules updated
Rules updated (v6)
sudo ufw enable

MongoDB 5.0
```
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl status mongod
```
