#
# Cookbook:: provision
# Recipe:: hello-world
#
# Copyright:: 2019, The Authors, All Rights Reserved.

file '/tmp/Hello_World.txt' do
    mode '0600'
    owner 'root'
    group 'root'
end
