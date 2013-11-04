include_recipe "git"

require "net/http"
require 'json'

# Replace all * instances with names of all the user's repos from GitHub's API
node.source_mirror.repos.each do | user, repo |
  if '*' == repo
    uri = URI("https://api.github.com/users/#{user}/repos")
    user_repos = []
    response = Net::HTTP.start(uri.host, uri.port,
      :use_ssl => uri.scheme == 'https') do |http|
      http.get(uri.path)
    end
    json = JSON.load(response.body)
    
    case response
    when Net::HTTPSuccess
      json.each { |r|
        user_repos << r['name']
      }
      node.override['source_mirror']['repos'][user] = user_repos
    else
      log "GitHub error: #{json.message}" do
        level :error
      end
      return
    end
  end
end

directory node.source_mirror.data_dir do
  owner node.source_mirror.user
  group node.source_mirror.user
  mode "0755"
  recursive true
end

template "#{node.source_mirror.data_dir}/source-mirror.sh" do
  source "source-mirror.sh.erb"
  owner node.source_mirror.user
  group node.source_mirror.user
  mode "0755"
end

mirror "source" do
  target node.source_mirror.data_dir
  user node.source_mirror.user
  hostname node.source_mirror.apache.listen_hostname
  port node.source_mirror.apache.listen_port
  command "#{node.source_mirror.data_dir}/source-mirror.sh"
  cookbook "mirror-core"
end
