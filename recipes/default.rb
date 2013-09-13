require "net/http"
require 'json'
include_recipe "git"

def mirror_repo(repo_url, local_path)
  # HACK: su to change user because script/execute doesn't set user (http://tickets.opscode.com/browse/CHEF-1523, via http://serverfault.com/questions/402881/execute-as-vagrant-user-not-root-with-chef-solo)
  execute "update-#{repo_url}" do
    command <<-EOH
      su #{node.source_mirror.user} -lc \
      'cd #{local_path} git fetch origin +refs/heads/*:refs/heads/*'
EOH
    only_if { File.exist?(local_path) }
  end
  execute "mirror-#{repo_url}" do
    command <<-EOH
      su #{node.source_mirror.user} -lc \
      'git clone --bare #{repo_url} #{local_path}'
EOH
    not_if { File.exist?(local_path) }
  end
end

node.source_mirror.repos.each do | user, repo |
  if repo.is_a?(Array)
    repo.each{ |r|
      mirror_repo("https://github.com/#{user}/#{r}.git", "#{node.source_mirror.data_dir}/#{user}/#{r}.git")
    }
  elsif '*' == repo
    uri = URI("https://api.github.com/users/#{user}/repos")
    Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https') do |http|
      JSON.load(http.get(uri.path).body).each { |r|
        mirror_repo(r['clone_url'], "#{node.source_mirror.data_dir}/#{r['full_name']}.git")
      }
    end
  else
    mirror_repo("https://github.com/#{user}/#{repo}.git", "#{node.source_mirror.data_dir}/#{user}/#{repo}.git")
  end
end

# Serve the gems (when they finish mirroring)
web_app "source_mirror" do
  docroot node.source_mirror.data_dir
  hostname node.source_mirror.apache.listen_hostname
  port node.source_mirror.apache.listen_port
end

log "Started mirroring RubyGems; tail /var/log/upstart/source-mirror.log to monitor."
