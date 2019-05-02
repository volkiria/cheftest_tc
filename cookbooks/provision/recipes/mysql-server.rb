#
# Cookbook:: provision
# Recipe:: mysql-server
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'yum-mysql-community::mysql57'

mysql_service 'cheftest' do
  port '3306'
  version '5.7'
  initial_root_password 'change_me'
  action [:create, :start]
end

mysql2_chef_gem 'default' do
  action :install
end

mysql_connection_info = {
  :host => '127.0.0.1',
  :port => '3306',
  :username => 'root',
  :password => 'change_me',
}

mysql_database 'db-prod' do
  connection mysql_connection_info
  action :create
end

mysql_database_user 'mysql_user' do
  connection mysql_connection_info
  host '%'
  password 'defaultpass'
  action :create
end

mysql_database_user 'mysql_user' do
  connection mysql_connection_info
  database_name 'db-prod'
  host '%'
  privileges [:select, :insert, :update, :delete, :create, :drop]
  action :grant
end
