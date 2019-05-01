#
# Cookbook:: provision
# Recipe:: docker
#
# Copyright:: 2019, The Authors, All Rights Reserved.

docker_service 'default' do
  action [:create, :start]
end
