# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION  = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "puppetlabs/centos-6.5-64-puppet"
  config.vm.network :forwarded_port, :guest => 8080, :host => 8080

  # WHYYYYYYY
  config.vm.provision :shell, :inline => "puppet resource service iptables ensure=stopped enable=false"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'examples'
    puppet.manifest_file  = 'full-role-example.pp'
    puppet.module_path    = 'modules'
    puppet.options = "--verbose --debug"
  end

end
