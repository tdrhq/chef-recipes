#
# Cookbook Name:: main_arnold
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


include_recipe "ruby_build"
include_recipe "nginx"


node.set["nginx"]["init_style"]["init"] = "runit"

package 'git-core'
package 'emacs'
package 'imagemagick'
package 'libmysqlclient-dev'
gem_package 'bundler'

ruby_build_ruby "2.0.0-p247" do
  prefix_path "/usr/local/ruby/ruby-2.0.0-p247"
  environment({
  })

  action      :install
end


include_recipe "nginx::source"


# create a deploy user

user "deploy" do
 home "/home/deploy"
 shell "/bin/bash"
end

directory "/home/deploy" do
  owner "deploy"
  group "deploy"
  mode 0755
  action :create
end


ssh_keys = [
 "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/RoGz9LGuAphZ+h82ycr5C13Z93vES9PcXC8x5uQoY1k0viBWYTT34hG6c0b2rCpnC5ARrJuzmTdUVT9AHjoIP/pBGVlUjJksaKToAwQWrapFWffJfq6VUxdb3cp/Q/izncdLjJd3mDHg3XDmGMgrPorYu2ALx6n7dQHHnACXED2Rc55FO2+blynFX7A32yR4yn2b8SOOzLMSxUnh3rkQ5pZRLNh089Zsgu6ulJFpOX8IQwed5pyylZiJU5YSzyFmQFsQUiU6MZ6FNfXPXkdJf5zlh6QSgrbTgozJk9lcJuTcq4TDPd0ueDF1vzsaFWKIOyJPRZxOWYSYC2fVNU1P arnold@think"
]

directory "/home/deploy/.ssh" do
  owner "deploy"
  group "deploy"
  mode 0700
  action :create
end

template "/home/deploy/.ssh/authorized_keys" do
  variables(:keys => ssh_keys)
  source "authorized_keys.erb"
  owner "deploy"
  group "deploy"
  mode 0600
  action :create
end

