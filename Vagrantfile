Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  config.vm.provider "hyperv" do |vb|
    vb.memory = "512"
  end

  config.vm.provision "shell", path: "vagrant.sh"

  # config.vm.provision "shell", inline: <<-SHELL
  #   echo "Anything you need..."
  # SHELL
end
