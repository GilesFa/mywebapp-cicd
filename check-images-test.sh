if [ $(docker ps -a --format {{.Names}} | grep webapp-test) ]
then
    docker rm -f webapp-test
    docker rmi webapp-dotnetcore-test:latest 
fi

if [ $(docker ps -a --format {{.Names}} | grep nginx-test) ]
then
    docker rm -f nginx-test
    docker rmi webapp-nginx-test:latest 
fi

if [ $(docker ps -a --format {{.Names}} | grep busybox-test) ]
then
    docker rm -f busybox-test
    docker rmi sequenceiq/busybox 
fi