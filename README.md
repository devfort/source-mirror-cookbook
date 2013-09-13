Description
===========

This cookbook configures the machine to mirror a selection of source repositories.

Requirements
============

Platform
--------

* Ubuntu 13.04 (that's all we support at /dev/fort for now, so that's all I've tested.)

Attributes
==========

Cookbook attributes are named under the `source_mirror` namespace.

* `node['source_mirror']['user']` - user to host source repos as, defaults to `fort`
* `node['source_mirror']['data_dir']` - directory to store source repos in, defaults to '/data/git'
* `node['source_mirror']['apache']['listen_hostname']` - Hostname to listen on for source repo Apache virtualhost, defaults to '*'
* `node['source_mirror']['apache']['listen_port']` - Port to listen on for source repo Apache virtualhost, defaults to '80'
* `node['source_mirror']['repos']` - Hash of repositories to clone. Keyed on username, with values being one of repo name, `*` (all repositories for user), or an array of repo names.

Recipes
=======

The main entrypoint for this cookbook is the `default` recipe.

Usage
=====

Include `source-mirror` and it will start cloning repositories. This will take a _very_ long time (probably a couple of days), and require tens of gigabytes of storage (~60GB, at time of writing). You have been warned.

TODO
====

- `client` recipe
- Handle sources other than GitHub
- Work out how to better serve `.git` folders; cloning via Apache doesn't appear to work
- Decide if cloning at provision-time is the right thing to do, or if we should do it with a service.
