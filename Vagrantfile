BOX_NAME = "ubuntu/focal64"
NUM_NODES = 3

Vagrant.configure("2") do |config|
  config.vm.box = BOX_NAME
  ssh_pub_key = File.readlines("./keys/bad_key.pub").first.strip

  config.vm.define "overlord" do |overlord|
    overlord.vm.hostname = "overlord"
    overlord.vm.network "private_network", ip: "192.168.56.10"

    overlord.vm.provision "shell", inline: <<-SHELL
      apt-get update &&
      apt-get install -y python3-pip &&
      python3 -m pip install ansible
    SHELL

    overlord.vm.provision "shell", privileged: false, inline: <<-SHELL
      ln -s /vagrant /home/vagrant/ansible-playground
      cp /vagrant/keys/bad_key /home/vagrant/.ssh/id_rsa
      chmod 0600 /home/vagrant/.ssh/id_rsa
    SHELL

  end

  (1..NUM_NODES).each do |i|
    config.vm.define "host#{i}" do |node|
      node.vm.hostname = "host#{i}"
      node.vm.network "private_network", ip: "192.168.56.#{i + 50}"

      node.vm.provision "shell", inline: <<-SHELL
        echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
      SHELL
    end
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get install -y avahi-daemon libnss-mdns
  SHELL
end

