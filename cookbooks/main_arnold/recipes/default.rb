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

ruby_build_ruby "2.0.0-p247" do
  prefix_path "/usr/local/ruby/ruby-2.0.0-p247"
  environment({
  })

  action      :install
end


include_recipe "nginx::source"


# create a deploy user

user "deploy" do

end

