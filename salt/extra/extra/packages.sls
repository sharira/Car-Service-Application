install_webserver_packages:
        pkg.installed:
                - pkgs:
                  - apache2
                  - mysql-server
                  - mysql-client
                  - firewalld
                  - php
                  - php-mysql
                  - libapache2-mod-php

/var/www/html/index.html:
        file:
          - managed
          - source: salt://index.html

/var/www/html/mysql.php:
        file:
          - managed
          - source: salt://mysql.php

/var/www/html/contact.html:
        file:
          - managed
          - source: salt://contact.html

/etc/apache2/apache2.conf:
        file:
          - managed
          - source: salt://apache2.conf

apache2:
  service.running:
    - enable: True

mysql:
  service.running:
    - enable: True

firewalld:
  service.running:
    - enable: True

'sudo iptables -A INPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT':
  cmd.run

'sudo iptables -A OUTPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate ESTABLISHED -j ACCEPT':
  cmd.run
