ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

VAGRANT_API_LEVEL               = '2' unless defined?(VAGRANT_API_LEVEL)

# https://github.com/mitchellh/vagrant/blob/efd1d5e11bfc5a72c7a1d1eae294b4751d841544/website/www/source/blog/2014-04-28-feature-preview-vagrant-1-6-docker-dev-environments.html.markdown
# https://docs.vagrantup.com/v2/docker/basics.html
Vagrant.configure(VAGRANT_API_LEVEL) do |config|

  # https://docs.vagrantup.com/v2/provisioning/ansible.html
  # By default, Vagrant 1.7+ automatically inserts a different
  # insecure keypair for each new VM created. The easiest way
  # to use the same keypair for all the machines is to disable
  # this feature and rely on the legacy insecure key.
  config.ssh.insert_key = false

  machine_name = 'vagrant_example'

  config.vm.provider 'docker' do |docker|
    # use local Dockerfile
    docker.build_dir = "."
    docker.name      = machine_name
    docker.cmd       = %w(/sbin/my_init --enable-insecure-key)
    docker.has_ssh   = true
  end

  # https://raw.githubusercontent.com/phusion/passenger-docker/master/image/insecure_key
  config.ssh.username         = 'root'
  config.ssh.private_key_path = 'insecure_key'

=begin
  config.vm.define machine_name do |machine|
    machine.vm.hostname = machine_name

    machine.vm.provision :ansible do |ansible|
      ansible.playbook   = 'playbook.yml'
      ansible.extra_vars = { ansible_ssh_user: 'vagrant' }
    end
  end
=end

end

# rebuild Dockerfile: vagrant reload
# https://docs.vagrantup.com/v2/docker/configuration.html
