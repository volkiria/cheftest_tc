#
# Cookbook:: provision
# Recipe:: jenkins_configure
#
# Copyright:: 2019, The Authors, All Rights Reserved.

bash 'verify_port' do
  code <<-EOH
  rm -f /tmp/configure_port /tmp/port_configured_reload
  port=`grep '<slaveAgentPort>[^<]*</slaveAgentPort>'  /var/lib/jenkins/config.xml | sed 's/^.*<slaveAgentPort>//;s/<.*//'`
  echo [ "x${port}" == "x0" -o "x${port}" == "x-1" ] >> /tmp/111
  netstat -nl --tcp | grep -q ":${port} "
  if [ $? != 0 ]
  then
    touch /tmp/configure_port
  fi
  EOH
  only_if { ::File.exist?('/var/lib/jenkins/config.xml') }
  action :run
  notifies :run, 'bash[configure_port]', :immediately
  retries 10
end

bash 'configure_port' do
  code <<-EOH
    sed -i 's/<slaveAgentPort>0</<slaveAgentPort>6060</;s/<slaveAgentPort>-1</<slaveAgentPort>6060</' /var/lib/jenkins/config.xml
    touch /tmp/port_configured_reload
    EOH
  only_if { ::File.exist?('/tmp/configure_port') }
  action :run
  notifies :restart, 'service[jenkins]', :immediately
end

service 'jenkins' do
  action :nothing
  only_if { ::File.exist?('/tmp/port_configured_reload') }
end


