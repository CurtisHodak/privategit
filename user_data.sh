#!/bin/bash
# Update system and install Docker
yum update -y
amazon-linux-extras install docker -y
systemctl enable docker
systemctl start docker

# Create GitLab directories
mkdir -p /srv/gitlab/config /srv/gitlab/logs /srv/gitlab/data

# Run GitLab CE Docker container
docker run --detach \
  --hostname $(curl -s http://169.254.169.254/latest/meta-data/public-hostname) \
  --publish 443:443 --publish 80:80 --publish 22:22 \
  --name gitlab \
  --restart always \
  --volume /srv/gitlab/config:/etc/gitlab \
  --volume /srv/gitlab/logs:/var/log/gitlab \
  --volume /srv/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce:latest
