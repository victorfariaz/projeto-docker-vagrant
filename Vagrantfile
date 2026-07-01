Vagrant.configure("2") do |config|
  config.vm.box = "debian/bookworm64"

  # Configuração de Rede e Hostname (Victor / Matrícula: 14)
  config.vm.network "private_network", ip: "192.168.56.114"
  config.vm.hostname = "victor.local"

  # Geração de chaves SSH dinâmicas desativada
  config.ssh.insert_key = false

  # Configurações do Provedor VirtualBox
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.name = "VM-Victor-Projeto2"
  end

  # Verificação de guest additions desabilitada
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = false
  end

  # Provisionamento automático via Ansible
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "playbook_ansible.yml"
    ansible.compatibility_mode = "2.0"
  end
end
