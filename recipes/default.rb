require "net/http"
require 'json'
include_recipe "git"

directory node.source_mirror.data_dir do
  owner node.source_mirror.user
  group node.source_mirror.user
  mode "0755"
  recursive true
end

node.source_mirror.repos.each do | user, repo |
  if '*' == repo
    uri = URI("https://api.github.com/users/#{user}/repos")
    user_repos = []
    Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https') do |http|
      JSON.load(http.get(uri.path).body).each { |r|
        user_repos << r['name']
      }
    end
    node.override['source_mirror']['repos'][user] = user_repos
  end
end

{
  "source-mirror.sh.erb" => "#{node.source_mirror.data_dir}/source-mirror.sh",
  "services/source-mirror.conf.erb"      => "/etc/init/source-mirror.conf",
  "services/source-mirror-shim.conf.erb" => "/etc/init/source-mirror-shim.conf",
}.each do |src, target|
  template target do
    source src
    owner node.source_mirror.user
    group node.source_mirror.user
    mode "0755"
  end
end

service "source-mirror-shim" do
  provider Chef::Provider::Service::Upstart
  action :restart
end

# Serve the gems (when they finish mirroring)
web_app "source_mirror" do
  docroot node.source_mirror.data_dir
  hostname node.source_mirror.apache.listen_hostname
  port node.source_mirror.apache.listen_port
end

log "Started mirroring RubyGems; tail /var/log/upstart/source-mirror.log to monitor."
