#
# Cookbook:: webapp
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

node.default['main']['doc_root'] = "/var/www/html"
packages = ['apache2', 'firewalld', 'mysql-server', 'mysql-client', 'php', 'php-mysql', 'libapache2-mod-php'] 

packages.each do |package|
 apt_package package do
    action :install
 end
end

service 'apache2' do
 action [ :enable, :start ]
end

service 'firewalld' do
 action [ :enable, :start ]
end

cookbook_file "#{node['main']['doc_root']}/index.html" do
 source 'index.html'
 owner 'root'
 group 'sudo'
 action :create
end

cookbook_file "#{node['main']['doc_root']}/contact.html" do
 source 'contact.html'
 owner 'root'
 group 'sudo'
 action :create
end

cookbook_file "#{node['main']['doc_root']}/mysql.php" do
 source 'mysql.php'
 owner 'root'
 group 'sudo'
 action :create
end

cookbook_file "/etc/apache2/apache2.conf" do
 source 'apache2.conf'
 owner 'root'
 group 'sudo'
 action :create
 notifies :restart, 'service[apache2]', :immediately
end

mysql_service 'default' do
 port '3306'
 initial_root_password 'secret'
 action [:create, :start]
end

iptables_rule 'http' do
 lines '-A INPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate NEW,ESTABLISHED -j ACCEPT'
end

iptables_rule 'http_outgoing' do
 lines '-A OUTPUT -p tcp -m multiport --dports 80,443 -m conntrack --ctstate ESTABLISHED -j ACCEPT'
end
