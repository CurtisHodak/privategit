#!/bin/bash
# Update system and install Docker

#Create the public key file first 

# ssh-keygen -t rsa -b 4096 -C "gitlab-ec2-access" -f ~/.ssh/gitlabkey

# cat  ~/.ssh/gitlabkey

# Create a variable in your stack called TF_VAR_public_key and set it to the contents of ~/.ssh/gitlabkey.pub
# ssh -i ~/.ssh/gitlabkey ec2-user@<public-ip>
sudo yum update -y
sudo yum install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user
# exit and reconnect to apply group changes

# Create GitLab directories
mkdir -p /srv/gitlab/config /srv/gitlab/logs /srv/gitlab/data

# Run GitLab CE Docker container
docker run --detach \
  --hostname "$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)" \
  --publish 443:443 \
  --publish 80:80 \
  --name gitlab \
  --restart always \
  --volume /srv/gitlab/config:/etc/gitlab \
  --volume /srv/gitlab/logs:/var/log/gitlab \
  --volume /srv/gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce:latest

# Get admin or root password for gitlab username is root
#docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password
# Other users only need to sign into the instance, not a gitlab.com account.