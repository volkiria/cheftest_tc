#
# Cookbook:: provision
# Recipe:: jenkins_manage
#
# Copyright:: 2019, The Authors, All Rights Reserved.

jenkins_user 'my_jenkins_user' do
  password 'my_jenkins_user'
  action :create
end

template '/tmp/config.xml' do
  source 'example_job_config.xml.erb'
  variables(:hostname => node['hostname'])
  action :create
end

jenkins_job 'example_job' do
  config '/tmp/config.xml'
  action :create
  only_if { ::File.exist?('/tmp/config.xml') }
end

