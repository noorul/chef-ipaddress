# Somehow on ubuntu 14.04 network restart is disabled. So in order for the ip change to
# take effect the system should be rebooted until a solid solution is found.

db = data_bag_item("servers", node.name)
interfaces = db['interfaces']

template "/etc/network/interfaces" do
	source "interfaces.erb"
	owner "root"	
	group "root"
  mode "0644"
  action :create
	variables :interfaces => interfaces
end
