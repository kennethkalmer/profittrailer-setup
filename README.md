# ProfitTrailer Setup Scripts

Get started with ProfitTrailer on Ubuntu easily

# Step 0 - Get this repo on your VPS

Either download this repo or run the following command to clone it directly to your VPS

```sh
$ curl -sL https://github.com/kennethkalmer/profittrailer-setup/raw/master/00_download.sh | sudo -E bash -
```

This will install git and clone this repo to the directory you're in.

# Step 1 - Install Java and create a `profittrailer` user

```sh
$ cd profittrailer-setup
$ ./01_setup.sh
```

This script will update your system and install Java 8 for you. It also creates a `profittrailer` user.

# Step 2 - Install pm2


```sh
$ cd profittrailer-setup
$ ./02_pm2.sh
```

# Step 3 - Install Apache & certbot for sure access


```sh
$ cd profittrailer-setup
$ ./03_apache.sh
```

# Step 4 - Setup your bots

_Document this_

# Step 5 - Setup secure access to your bot


```sh
$ cd profittrailer-setup
$ ./add-site.sh bot.mydomain.name 8081
```
