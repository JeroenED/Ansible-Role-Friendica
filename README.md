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

    friendica_vhost: forum.friendi.ca
Create a apache vhost for friendica

    friendica_pull_cron: daily
Create a additional cronjob to pull latest changes of your branch.

    friendica_database_host: localhost
    friendica_database_port: 3306
    friendica_database_user: root
    friendica_database_pass: letmein
Database configuration. If host is localhost the user and database will be made.

    friendica_timezone: UTC
Choose a legal default timezone. If you are unsure, use "America/Los_Angeles".
It can be changed later and only applies to timestamps for anonymous viewers.

    friendica_config_system_language: en
Default system language

    friendica_config_sitename: "Friendica Social Network"
What is your site name?

    friendica_config_registerpolicy: REGISTER_OPEN
    friendica_config_registertext: ''
    friendica_config_adminemail: root@localhost
Your choices are REGISTER_OPEN, REGISTER_APPROVE, or REGISTER_CLOSED.
Be certain to create your own personal account before setting
REGISTER_CLOSED. 'register_text' (if set) will be displayed prominently on
the registration page. REGISTER_APPROVE requires you set 'admin_email'
to the email address of an already registered person who can authorise
and/or approve/deny the request.
In order to perform system administration via the admin panel, admin_email
must precisely match the email address of the person logged in.

    friendica_config_maximportsize: 200000
Maximum size of an imported message, 0 is unlimited

    friendica_config_system_maximagesize: 800000
maximum size of uploaded photos

    friendica_config_system_rino_encrypt: 1
Server-to-server private message encryption (RINO) is allowed by default.
set to 0 to disable, 1 to enable

    friendica_config_system_allowed_themes: [ 'quattro', 'vier', 'duepuntozero', 'smoothly' ]
Allowed themes (change this from admin panel after installation)
    
    friendica_config_system_theme: 'vier'
Default system theme

    friendica_config_system_noregfullname: true
By default allow pseudonyms

    friendica_config_system_blocklocaldir: false
Deny public access to the local directory

    friendica_config_system_directory: 'https://dir.friendica.social'
Location of the global directory

    friendica_config_system_allowed_link_protocols': ['ftp', 'ftps', 'mailto', 'cid', 'gopher']
Allowed protocols in link URLs; HTTP protocols always are accepted

    friendica_config_system_auth_cookie_lifetime: 7
Authentication cookie lifetime, in days


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
         - { role: jeroened.friendica }

License
-------

Copyright 2018 Jeroen De Meerleer <me@jeroened.be>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).
