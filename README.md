# sshtunnel-env
sshtunnel-env is a docker image which allows you to establish SSH Tunnels using environment variables for configuration.

## configuration
Create a `.env` file and copy paste + edit the following values:
```
SSH_USERNAME=tux
SSH_PASSWORD=myawesomepassword
SSH_SERVER_IP=127.0.0.1
SSH_LOCAL_PORT=3336
SSH_SERVER_PORT=3306
SSH_SERVER_DOMAIN=example.com
```

Usage with docker compose:
```
version: "3"
services:
    sshtunnel:
        image: sleeyax/sshtunnel-env
        env_file: .env
        container_name: sshtunnel
    phpmyadmin:
        image: phpmyadmin/phpmyadmin
        ports:
            - "8080:80"
        environment:
            - PMA_ARBITRARY=1
            - PMA_HOST=sshtunnel
        depends_on:
            - sshtunnel
```
