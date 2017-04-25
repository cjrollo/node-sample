# node-sample
This is a sample node JS project. It uses the Express JS and the Moment JS libraries. The project can be wrapped up as a Docker image using the Dockerfile in the root folder. It is based on https://lostechies.com/gabrielschenker/2016/03/22/ci-with-teamcity-and-docker/

## usage
1. run the teamcity-server
> docker run -dt --name teamcity -p 8111:8111 sjoerdmulder/teamcity

2. run at least one teamcity-agent
> docker run -d --name=teamcity-agent-1 --link teamcity:teamcity --privileged -e TEAMCITY_SERVER=http://teamcity:8111 sjoerdmulder/teamcity-agent:latest

3. pull the repo
> git clone https://github.com/cjrollo/node-sample.git

4. update the user specific items (docker login, etc)
5. push the changes
  git add... git commit... git push...
6. check the build (should be kicked automatically) for errors
7. run the built image
> docker run -d -p 1337:1337 --name node-sample rollo/node-sample

8. Test it
> open http://192.168.99.100:1337
