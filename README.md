# ProfitTrailer Setup Scripts

Get started with ProfitTrailer on Ubuntu easily

## Step 0 - Get this repo on your VPS

Either download this repo or run the following command to clone it directly to your VPS

```sh
$ curl -sL https://github.com/kennethkalmer/profittrailer-setup/raw/master/00_download.sh | sudo -E bash -
```

This will install git and clone this repo to the directory you're in.

## Step 1 - Install Java and create a `profittrailer` user

```sh
$ cd profittrailer-setup
$ sudo ./01_setup.sh
```

This script will update your system and install Java 8 for you. It also creates a `profittrailer` user.

## Step 2 - Install pm2

[pm2](http://pm2.io) is a process manager that you can use to keep your ProfitTrailer instances up and running always. The authors of ProfitTrailer provide a sensible default pm2 configuration right there in the zip file...

Setting up pm2 is a multi-step process, just follow along:

### Install pm2 itself

```sh
$ cd profittrailer-setup
$ ./02_pm2.sh
```

### Setup pm2 to start up with your system

This is important! When your server gets rebooted, you need to ensure pm2 starts up, so it in turn can start all your ProfitTrailer instances.

This command you need to run as the `profittrailer` user that got created in the our first step.

So lets switch to the `profittrailer` user

```sh
$ su - profittrailer
```

No we need to run this command to get instructions on how to setup pm2 to start when the server starts.

```sh
$ pm2 startup
```

It is important to get the command to run from the instructions that got printed above. Then _exit_ the profittrailer user to get back to your main user.

```sh
$ exit
```

Now paste the command that was provided by the `pm2 startup` output.

#### Example of what this looks like:

This might change with future versions of pm2, but this might help you understand what to expect:

```sh
root@localhost:~/profittrailer-setup# su - profittrailer
profittrailer@localhost:~$ pm2 startup
[PM2] Init System found: systemd
[PM2] To setup the Startup Script, copy/paste the following command:
sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u profittrailer —hp /home/profittrailer
profittrailer@localhost:~$ exit
logout
root@localhost:~/profittrailer-setup# sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u profittrailer —hp /home/profittrailer
```

## Step 3 - Install Apache & certbot for sure access


```sh
$ cd profittrailer-setup
$ ./03_apache.sh
```

# Step 4 - Setup your bots

_Document this_

## Step 5 - Setup secure access to your bot


```sh
$ cd profittrailer-setup
$ ./add-site.sh bot.mydomain.name 8081
```
