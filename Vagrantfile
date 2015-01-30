ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

VAGRANT_API_LEVEL = '2' unless defined?(VAGRANT_API_LEVEL)

# https://github.com/mitchellh/vagrant/blob/efd1d5e11bfc5a72c7a1d1eae294b4751d841544/website/www/source/blog/2014-04-28-feature-preview-vagrant-1-6-docker-dev-environments.html.markdown
# https://docs.vagrantup.com/v2/docker/basics.html
Vagrant.configure(VAGRANT_API_LEVEL) do |config|
  config.vm.provider "docker" do |d|
    # use local Dockerfile
    d.build_dir = "."
    d.name    = "vagrant_example"
    d.cmd     = ["/sbin/my_init", "--enable-insecure-key"]
    d.has_ssh = true
  end

  # https://raw.githubusercontent.com/phusion/passenger-docker/master/image/insecure_key
  config.ssh.username = "root"
  config.ssh.private_key_path = "insecure_key"
end

# rebuild Dockerfile: vagrant reload
# https://docs.vagrantup.com/v2/docker/configuration.html