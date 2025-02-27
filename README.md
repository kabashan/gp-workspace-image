# gp-workspace-image
A custom workspace image for gitpod

# How to push my docker image to my Docker Hub
Accoriding to the document https://docs.docker.jp/v1.9/engine/userguide/dockerrepos.html, 
when you want to register your image manually, you need to login to docker first like this
```
$ docker login
Log in with your Docker ID or email address to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com/ to create one.
You can log in with your password or a Personal Access Token (PAT). Using a limited-scope PAT grants better security and is required for organizations using SSO. Learn more at https://docs.docker.com/go/access-tokens/

Username: kabashan
Password: 
WARNING! Your password will be stored unencrypted in /home/gitpod/.docker/config.json.
Configure a credential helper to remove this warning. See
https://docs.docker.com/engine/reference/commandline/login/#credentials-store

Login Succeeded
```

And then, just push your image with tag name.
```
export dt=$(date +%Y%m%d)
docker build -t kabashan/gitpod-workspace-image:$dt .
docker build -t kabashan/gitpod-workspace-image:$dt-flex -f Dockerfile_devcontainer .

$ docker images
kabashan/gitpod-workspace-image   20240621   a5a11f4b2415   53 seconds ago   8.77GB

$ docker push kabashan/gitpod-workspace-image:$dt
$ docker push kabashan/gitpod-workspace-image:$dt-flex
...
...
latest: digest: sha256:503850f6dab57ced4bcb06c6318baf72fc90d163a0286c6b37ccda3099d4769e size: 13958

$ docker search kabashan
NAME                              DESCRIPTION   STARS     OFFICIAL   AUTOMATED
kabashan/gitpod-workspace-image
```