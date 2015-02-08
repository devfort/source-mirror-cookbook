include_recipe 'git'
chef_gem 'octokit'
require 'octokit'

# Replace all * instances with names of all the user's repos from GitHub's API
Octokit.auto_paginate = true
node['source_mirror']['repos'].each do | user, repo |
  if '*' == repo
    repos = Octokit.repos user
    user_repos = repos.map do |repo_data|
      repo_data[:name]
    end
    node.override['source_mirror']['repos'][user] = user_repos
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
