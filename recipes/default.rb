#
# Cookbook:: beats
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

# Update the sources list
apt_update("update") do
  action :update
end

# Get the source for the package to install
apt_repository("elastic-co") do
  keyserver "https://artifacts.elastic.co/GPG-KEY-elasticsearch"
  key "D88E42B4"
  uri "https://artifacts.elastic.co/packages/6.x/apt"
  distribution "stable"
  components ["main"]
  action :add
end

# Install transport-https for installation
package("apt-transport-https") do
  action :install
end

# Update the sources list
apt_update("update") do
  action :update
end

# Install filebeat
package("filebeat") do
  action :install
end
