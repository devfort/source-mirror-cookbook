# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "source-mirror-berkshelf"
  config.vm.box = "devfort-ubuntu-13.04-provisionerless-120gb"
  config.vm.box_url = "http://devfort.s3.amazonaws.com/boxes/devfort-ubuntu-13.04-provisionerless-120gb-virtualbox.box"

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      'apache' => {
        'default_site_enabled' => false
      },
      'source_mirror' => {
        'user' => 'vagrant'
      }
    }

    chef.run_list = [
        "recipe[source-mirror::default]",
    ]
  end
end
