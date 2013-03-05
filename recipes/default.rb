include_recipe 'python'

python_pip "pyapns" do
  action :install
end

config       = node['pyapns']
service_name = config['service_name']

group_name = config['group']
user_name  = config['user']
home_dir   = config['home']

group group_name do
  system true
end

user user_name do
  gid     group_name
  home    home_dir
  comment "PyAPNS user"
  shell   "/bin/bash"
  system  true
end

directory home_dir do
  owner     user_name
  group     group_name
  recursive true
end

file "/var/log/pyapns.log" do
  action :create
  owner user_name
  group group_name
  mode 00600
end

file "/var/run/pyapns.pid" do
  action :create
  owner user_name
  group group_name
  mode 00644
end



case node['platform']
when "redhat", "centos", "scientific", "amazon"
  template "/etc/init.d/#{service_name}" do
    source "service.centos.erb"
    mode   "0755"
    owner  "root"
    group  "root"
    variables({
      :port  => config['port'],
      :user  => user_name,
      :group => group_name,
      :home  => home_dir
    })
  end

  service service_name do
#    provider Chef::Provider::Service::Upstart
    supports :status => true, :restart => true, :reload => true
    action   [:enable, :start]
  end
when "ubuntu"
  template "/etc/init/#{service_name}.conf" do
    source "service.conf.erb"
    mode   "0644"
    owner  "root"
    group  "root"
    variables({
      :port  => config['port'],
      :user  => user_name,
      :group => group_name,
      :home  => home_dir
    })
  end

  service service_name do
    provider Chef::Provider::Service::Upstart
    supports :status => true, :restart => true, :reload => true
    action   [:enable, :start]
  end
else
  raise "Platform #{platform} not supported! (yet)"
end