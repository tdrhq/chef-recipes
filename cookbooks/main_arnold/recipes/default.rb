#
# Cookbook Name:: main_arnold
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


include_recipe "ruby_build"


ruby_build_ruby "2.0.0-p247" do
  prefix_path "/usr/local/ruby/ruby-2.0.0-p247"
  environment({
  })

  action      :install
end
