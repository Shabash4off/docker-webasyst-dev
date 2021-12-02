# Docker Webasyst DEV | PHP 5.6, MySQL 5.7
Special docker config for comfortable webasyst app develop  
  
## Contains
- php-fpm 5.6
- mysql 5.7.36
- nginx (lastest)
- phpmyadmin (latest)

## Quickstart
```bash
# 1. Clone this repo
git clone https://github.com/Shabash4off/docker-webasyst-dev webasyst
cd webasyst

# 2. Clone webasyst-framework repo as engine
git clone https://github.com/webasyst/webasyst-framework.git engine

# OPTIONAL Also can clone shop-script repo, if you have access  
git clone https://github.com/webasyst/shop-script.git engine/wa-apps/shop

# 3. Open engine folder for writing
sudo chmod 777 -R engine/

# 4. Rename .env.sample to .env
mv .env.sample .env

# 5. Start docker containers
sudo docker-compose up -d
```
Now you have running webasyst on http://localhost, just process normal webasyst installation.

### Database connection  
That is default values, you can change they in `.env`
- db host: mysql
- username: webasyst
- password: webasyst
- db name: wa 

Also now you can access phpmyadmin on http://localhost:8080. You can log in as root user with password _root_ (root password can be changed in `.env`)