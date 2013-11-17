
# to be run as root

curl -L https://www.opscode.com/chef/install.sh | bash
rm -rf /root/chef-repo
git clone https://github.com/tdrhq/chef-recipes /root/chef-repo
cd /root/chef-repo
chef-solo -c solo.rb -j web.json

