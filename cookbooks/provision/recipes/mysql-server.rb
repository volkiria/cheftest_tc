#
# Cookbook:: provision
# Recipe:: mysql-server
#
# Copyright:: 2019, The Authors, All Rights Reserved.

remote_file '/tmp/mysql-community-release-el7-7.noarch.rpm' do
      source 'http://repo.mysql.com/mysql-community-release-el7-7.noarch.rpm'
      owner 'vagrant'
      group 'vagrant'
      mode '0644'
      action :create
end

rpm_package '/tmp/mysql-community-release-el7-7.noarch.rpm' do
    action :install
end

package 'mysql-server'
