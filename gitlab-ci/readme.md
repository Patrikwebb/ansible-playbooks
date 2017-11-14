
# Create gitlab.ci.yml


# Docker image exec

apk update

apk add openjdk8
  - add edge to repo
  - apk update

apk add maven

vi /etc/apk/repositories

# Add gitlab runner

  - change docker -> docker-with-maven
  - pull only from local registry

# Build image with runner

# Docker login

# Docker pull image from Gitlab Registry
