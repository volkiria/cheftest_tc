#
# Cookbook:: provision
# Recipe:: mysql-server
#
# Copyright:: 2019, The Authors, All Rights Reserved.

mysql_service 'cheftest' do
    port '3306'
    version '5.7'
    initial_root_password 'change_me'
    action [:create, :start]
end
