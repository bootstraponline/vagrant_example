# https://github.com/phusion/passenger-docker/blob/master/Vagrantfile
# https://github.com/phusion/passenger-docker/blob/master/README.md#docker-base-images-for-ruby-python-nodejs-and-meteor-web-apps
FROM phusion/passenger-full

# Set correct environment variables.
ENV HOME /root

# Use baseimage-docker's init process.
CMD ["/sbin/my_init"]

# Enable SSH
RUN rm -f /etc/service/sshd/down

# Regenerate SSH host keys. Passenger-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Expose SSH port
EXPOSE 22
