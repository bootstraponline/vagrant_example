ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

VAGRANT_API_LEVEL = '2'

# https://docs.vagrantup.com/v2/docker/basics.html
Vagrant.configure(VAGRANT_API_LEVEL) do |config|
  config.vm.provider "docker" do |d|
    # use local Dockerfile
    d.build_dir = "."
  end
end

# rebuild Dockerfile: vagrant reload
# https://docs.vagrantup.com/v2/docker/configuration.html