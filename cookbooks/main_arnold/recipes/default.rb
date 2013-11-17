#
# Cookbook Name:: main_arnold
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


include_recipe "ruby_build"

package 'git-core'
package 'emacs'
package 'imagemagick'
package 'libmysqlclient-dev'

ruby_build_ruby "2.0.0-p247" do
  prefix_path "/usr/local/ruby/ruby-2.0.0-p247"
  environment({
  })

  action      :install
end

