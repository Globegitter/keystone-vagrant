Vagrant.configure("2") do |config|
    # pick an ubuntu 14.04 image
    config.vm.box = "phusion-open-ubuntu-14.04-amd64"
    config.vm.box_url = "https://oss-binaries.phusionpassenger.com/vagrant/boxes/latest/ubuntu-14.04-amd64-vbox.box"
    config.vm.provision :shell, :path => "yo-keystone.sh"
    config.vm.network :private_network, ip: '192.168.192.168'
    #config.vm.network :forwarded_port, guest: 22, host: 1234, auto_correct: true
    config.vm.network :forwarded_port, guest: 3000, host: 3000, auto_correct: true
    config.vm.hostname = "keystonejs"
    nfs_setting = RUBY_PLATFORM =~ /darwin/ || RUBY_PLATFORM =~ /linux/
    config.vm.synced_folder "server", "/home/vagrant/server", id: "vagrant-root", :nfs => nfs_setting,  type: "rsync"

    config.vm.provider :virtualbox do |vb|
        vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
        vb.customize ["modifyvm", :id, "--memory", "512"]
    end
end
