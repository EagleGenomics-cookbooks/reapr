#
# Cookbook Name:: reapr
# Recipe:: default
#
# Copyright 2016 Eagle Genomics Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include_recipe 'apt'
include_recipe 'build-essential'
include_recipe 'perl'
include_recipe 'r'

package ['tar', 'make', 'cmake', 'zlib1g-dev'] do
  action :install
end

cpan_module 'File::Spec::Link'

remote_file "#{node['reapr']['install_path']}/#{node['reapr']['filename']}" do
  source node['reapr']['url']
  action :create_if_missing
end

execute "Untar #{node['reapr']['filename']}" do
  command "tar -xvf #{node['reapr']['filename']}"
  cwd node['reapr']['install_path']
  not_if { ::File.exist?("#{node['reapr']['install_path']}/#{node['reapr']['dirname']}") }
end

execute './install.sh' do
  cwd "#{node['reapr']['install_path']}/#{node['reapr']['dirname']}"
  not_if { ::File.exist?("#{node['reapr']['install_path']}/#{node['reapr']['dirname']}/reapr") }
end

# this symlinks every executable in the install subdirectory to the top of the directory tree
# so that they are in the PATH
execute "find #{node['reapr']['install_path']}/#{node['reapr']['dirname']} -maxdepth 1 -name 'reapr*' -executable -exec ln -s {} . \\;" do
  cwd 'usr/local/bin'
end

# Take the test data also
remote_file "#{node['reapr']['install_path']}/#{node['reapr']['dirname']}/#{node['reapr']['test_data']}" do
  source node['reapr']['test_data_url']
  action :create_if_missing
end

execute "Untar #{node['reapr']['test_data']}" do
  command "tar -xvf #{node['reapr']['test_data']}"
  cwd "#{node['reapr']['install_path']}/#{node['reapr']['dirname']}"
end 
