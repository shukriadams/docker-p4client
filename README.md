# docker-p4

Perforce client in a docker container

## Examples

A simple use is 

    docker run -e P4PORT=myserver.com:1666 shukriadams/p4client:0.0.1 p4 info

Normally Perforce requires more complex setup to function though. To access an SSL-protected server create a script

    nano start.sh

And to this file add

    p4 set P4PORT=myserver.com:1666
    p4 set P4USER=myuser
    p4 trust -i ssl:myserver.com:1666
    p4 trust -f -y

Then run

    docker run -v $(pwd)/start.sh:/tmp/start.sh shukriadams/p4client:0.0.1 /bin/sh -c "sh /tmp/start.sh && p4 info"
