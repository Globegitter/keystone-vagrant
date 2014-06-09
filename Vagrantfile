Vagrant.configure("2") do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.vm.provision :shell, :path => "yo-keystone.sh"
    config.vm.network :private_network, ip: '192.168.192.168'
    config.vm.network :forwarded_port, guest: 3000, host: 3000, auto_correct: true
    config.vm.hostname = "keystone"
    nfs_setting = RUBY_PLATFORM =~ /darwin/ || RUBY_PLATFORM =~ /linux/
    config.vm.synced_folder "www", "/var/www", id: "vagrant-root", :nfs => nfs_setting

    config.vm.provider :virtualbox do |vb|
        vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        vb.customize ["modifyvm", :id, "--memory", "512"]
    end
end
