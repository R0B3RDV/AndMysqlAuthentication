# AndMysqlAuthentication
Android Mysql Authentication

### What is the project about?
Android MySQL Authentication App is an Authentication App for android. Member registration and login are done using MySQL database. At the same time it uses SQLite to save the information of logged in users and re-enter them.

The Volley library was used for Android HTTP requests. Php was used on the web to control requests from Android.

When the user tries to register through the application, the application sends a request to the Php server along with the user informations. If the request is true, the user information is saved in the MySQL database. And the inserted user information return to app. This incoming information is insert in the application's SQLite database. So there is no need to send a request to the server over and over again.

### Technology Stack
* Android Studio

* Java

* SQLite

* PHP

* MySQL

* Google Volley library

* Bumptech glide library

### Install
Download Android Mysql Authentication App via github or clone your computer.

Clone:

cd projectfolder

git clone https://github.com/pars11/AndMysqlAuthentication
Open phpmyadmin and create a database with name "andauth" and import the file "andauth.sql" (in the Php/include folder) in that database.

Copy Php folder into your web root directory.

Example :

C:\xampp\htdocs\php
Okey now, Import the project folder into Android studio.

Open the app/java/projectfolder/helper/ AppConfig file and change the register and login url's to your url's. (Note: For localhost you should write your local ip address. cmd / ipconfig)

After this steps, you can easily run your application for register and login.

### How to contribute?
You can reach me by commenting on this post or send message on the discord (@pars11#1145).If you want to make this application better, you can make a Pull Request.
