# SNApp-HOST
Easy SNApp hosting on Debian

For installing on a Raspberry or similar PI see [README_PI.md](README_PI.md)

![](https://i.imgur.com/ywSbzAz.png)

# `SNApp-HOST` [![Release 1.1](https://img.shields.io/badge/Release-1.1-green.svg)](https://github.com/necro-nemesis/raspap-webgui/releases)

Loki SNApp-HOST is an easy to use Lokinet webserver set up tool to rapidly configure a hidden service (SNApp) on a Debian-based system. After running the script and entering your own user during the installation the device is ready to launch your website providing you with your individual Loki address.

### WHAT IS LOKI?

https://loki.network/

"Loki is a privacy network which will allow users to transact and communicate privately over the internet, providing a suite of tools to help maintain the maximum amount of anonymity possible while browsing, transacting and communication online. Using the decentralised nature of blockchain technology, Loki creates new private and secure methods of interacting with the internet, as well as building privacy-centric applications, such as messaging services, forums, online marketplaces, and social media platforms."

Loki

![](https://i.imgur.com/fxKF4bi.jpg)

![](https://i.imgur.com/dufI8PE.png)

![](https://i.imgur.com/bNggIs3.png)

![](https://i.imgur.com/KDYFjEu.png)

## Contents

 - [Quick installer](#quick-installer)
 - [Test Site](#test-site)
 - [Support us](#support-us)
 - [How to contribute](#how-to-contribute)
 - [License](#license)

## Quick installer

Install SNApp-HOST from shell prompt:
```sh
$ wget -q https://git.io/JepoL -O /tmp/snapp && bash /tmp/snapp
```
The installer will update, locate, install and configure all the prerequisites for you. You will be prompted to create a new user account. In future this account and it's associate SNApp directory is used to run the server. Enter a username and password, the script will automatically create and elevate privileges of this account to root while generating the SNApp folder at /home/$USER/snapp.

At the end of the install process you will be presented with your Lokinet address. Either by starting the test server by answer "Y" or exiting the script "N" it will allow you to highlight the address and copy/paste this to clipboard or plug it directly into your browser to test your server. Remember to have Lokinet running on the computer you are using to test the site. Lokinet privately and anonymously only communicates with Lokinet.

## Creating your unique Webserver (SNApp)

SNApps are placed in the /home/$USER/snapp directory "$USER" being substituted by the name of the user you created. The index.html file is there for initial testing. Either move it to another name or remove it and replace it with your own files. If you have a computer that can read the SD card partitions you can simply copy over your SNApp files to the folder on the sd card otherwise sftp into the PI and transfer the files you require. As shown in the image above you can use a program like FileZilla to sftp into the pi then navigate to the directory of the SNApp on your pc and the aforementioned SNApp directory on the pi then transfer the files to the pi.

## Starting and Stopping the Webserver

Login and run all server commands as root. SNApp-HOST uses the utility "screen" and the script "snapp" found in /usr/local/bin to run the server. If the server is running the terminal command ```screen -r snapp``` will open up the terminal screen showing it running and reporting requests. To stop the server use ```Ctrl C``` while in this snapp terminal screen. Starting the webserver is done by running the snapp script with ```snapp```. This will create the snapp screen in the background and run the server. If you exit terminal at this stage the webserver remains running as it is now in "detached" mode. If you are uncertain if the webserver is running using ```screen -ls``` will reveal any screens running in the background and the one for the SNApp will be indicated by name. Lastly if you wish to detach from the snapp screen after entering into it and wish to leave it running on exit ```Ctrl A D``` will detach and leave the webserver running. Additional information on use of screen can be found on the man page here https://linux.die.net/man/1/screen. The server is not automatically set to start on boot therefore when you boot the pi you will be required to type ```snapp``` to start it. If you wish to have it start automatically every time on boot there are ways to do that through setting up a service or placing an entry in rc.local etc.

## Selection of Ports

The default port is set to ```80```. This value can be found and changed by editing the ```snapp``` script located in the /usr/local/bin directory i.e. stopping the webserver then ```sudo nano snapp``` ,changing the value found there from ```80``` to one of your choosing, saving it then restarting the script. If you change the port number ensure that you forward that port through your routers firewall as well. 80 typically will be an already open port.

## Support us

SNApp-HOST is free software, but powered by your support. If you find it beneficial or wish to contribute to inspire ongoing development your donations of any amount; be they even symbolic, are a show of approval and are greatly appreciated.

Loki Donation Address:
```sh
LA8VDcoJgiv2bSiVqyaT6hJ67LXbnQGpf9Uk3zh9ikUKPJUWeYbgsd9gxQ5ptM2hQNSsCaRETQ3GM9FLDe7BGqcm4ve69bh
```
## How to contribute

1. File an issue in the repository, using the bug tracker, describing the
   contribution you'd like to make. This will help us to get you started on the
   right foot.
2. Fork the project in your account and create a new branch:
   `your-great-feature`.
3. Commit your changes in that branch.
4. Open a pull request, and reference the initial issue in the pull request
   message.

## License
See the [LICENSE](./LICENSE) file.
