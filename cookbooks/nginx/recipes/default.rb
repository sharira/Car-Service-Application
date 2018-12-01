#
# Cookbook:: nginx
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

apt_package 'nginx' do
	action :install
end

service 'nginx' do
	action [ :enable, :start ]
end
