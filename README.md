Friendica
=========

This role installs and configures friendica.

Requirements
------------

(none)

Role Variables
--------------
Available variables are listed below, along with default values (see `defaults/main.yml`):

    friendica_path: /var/www/friendica
The path where friendica gets installed

    friendica_branch: master
The branch of friendica that is being installed. Possible options are `master` and `develop` where `master` is the current stable and `develop` is the current development snapshot

    friendica_user: www-data
    friendica_group: www-data
The user and group the files of friendica will belong to. When your server does not run with default user and group

    friendica_pull_cron: daily
Create a additional cronjob to pull latest changes of your branch.

    friendica_database_host: localhost
    friendica_database_port: 3306
    friendica_database_user: root
    friendica_database_pass: letmein
    friendica_database_data: friendica
    friendica_database_charset: utf8mb4
Database configuration. If host is localhost the user and database will be made.

### local.ini.php configuration

All configuration of the local.ini.php (develop) and .htconfig.php (master) are can set with ansible. Because these varables are way too much to explain here, I have set up here only a few more important ones.

All other variables can be made by adapting the pattern `friendica_config_{key}_{value w/o underscores}`. Also note that `config_config` wouldn't make sense and is just `config`.

#### Most important variables


    friendica_config_registerpolicy: REGISTER_OPEN 
    friendica_config_registertext: '' 
    friendica_config_adminemail: root@localhost
Your choices are REGISTER_OPEN, REGISTER_APPROVE, or REGISTER_CLOSED. Be certain to create your own personal account before setting REGISTER_CLOSED. 'register_text' (if set) will be displayed prominently on the registration page. REGISTER_APPROVE requires you set 'admin_email' to the email address of an already registered person who can authorise  and/or approve/deny the request. In order to perform system administration via the admin panel, admin_email must precisely match the email address of the person logged in. 

    friendica_config_system_theme: 'frio' 
Default system theme 

    
Automatic Apache Vhost creation
===============================

A virtualhost for Apache can be created by the role. The template is based on the vhost.conf template from Geerlingguy's apache role

    friendica_vhost_servername: friendica.example.com
The servername for the Virtual Host. If this is set the vhost will be created

    friendica_vhost_serveralias: social.example.com
The alternative servernames for the Virtualhost. Commonly not recommended to have this :)

    friendica_vhost_usempmitk: no
Some extra parameters to set in the Vhost.

    friendica_vhost_extraparams:
Some extra parameters to set in the Vhost.

    friendica_certificate:
    friendica_certificatekey:
    friendica_certificatechain:
When you have HTTPS enabled on your website, setting these parameters will create a ssl-enabled vhost and will create redirection from http to https.

Dependencies
------------

    - geerlingguy.apache
    - geerlingguy.php
    - geerlingguy.mysql
    - geerlingguy.php-mysql
    - geerlingguy.git

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: geerlingguy.apache }
         - { role: geerlingguy.php }
         - { role: geerlingguy.mysql }
         - { role: geerlingguy.php-mysql }
         - { role: geerlingguy.git }
         - { role: jeroened.friendica }

License
-------

Copyright 2018 Jeroen De Meerleer <me@jeroened.be>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

