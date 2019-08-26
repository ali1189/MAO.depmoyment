
Vagrant.configure("2") do |config|
  config.vm.provision "shell", path: "bootstrap.sh"
  config.vm.box = "centos/7"
    config.vm.provider "virtualbox" do |vb|

        vb.name = "Mesos-Project-Centos7"
  end
 #Mesos-Master
  config.vm.define "Mesos-Project-Master", primary: true do |master|
    master.vm.network "private_network", ip: "192.168.10.10"
    master.vm.provider "virtualbox" do |vb|
      vb.name = "Mesos-Project-Centos7-Master"
      vb.memory = 2048
      vb.cpus = 1
    end
    master.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "ansible-yml-files/playbook-master.yml"
      ansible.become = true
      ansible.limit = "master"
      ansible.inventory_path = "ansible-yml-files/hosts-master"
    end
    master.vm.hostname = "Mesos-Master"
  end
 


 #Mesos-Agent
  config.vm.define "Mesos-Project-Agent" do |agent|
    agent.vm.network "private_network", ip: "192.168.10.11"
    agent.vm.provider "virtualbox" do |vb|
      vb.name = "Mesos-Project-Centos7-Agent"
      vb.memory = 2048
      vb.cpus = 1
    end
    agent.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "ansible-yml-files/playbook-agent.yml"
      ansible.become = true
      ansible.limit = "agent"
      ansible.inventory_path = "ansible-yml-files/hosts-agent"
    end
    agent.vm.hostname = "Mesos-Agent"
  end



 

 #Mesos-Management
  config.vm.define "Mesos-Project-Management" do |management|
    management.vm.network "private_network", ip: "192.168.10.12"
    management.vm.provider "virtualbox" do |vb|
      vb.name = "Mesos-Project-Centos7-Management"
      vb.memory = 2048
      vb.cpus = 2
    end
    management.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "ansible-yml-files/playbook-management.yml"
      ansible.become = true
      ansible.limit = "management"
      ansible.inventory_path = "ansible-yml-files/hosts-management"
    end
    management.vm.hostname = "Mesos-Management"
  end
end


