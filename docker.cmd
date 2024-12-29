docker volume create mysqlvol
mysqlvol

docker volume list
DRIVER    VOLUME NAME
local     mysqlvol

docker run --name mysql-wvol -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d --mount source=mysqlvol,target=/var/lib/mysql mysql

docker ps
CONTAINER ID   IMAGE     COMMAND                  CREATED          STATUS          PORTS                               NAMES
6e157f940ff0   mysql     "docker-entrypoint.s…"   24 seconds ago   Up 22 seconds   0.0.0.0:3306->3306/tcp, 33060/tcp   mysql-wvol

docker container rm mysql-wvol

docker run --name mysql-wbind -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d --mount type=bind,source="$(pwd)"/mysql_bind_folder,target=/var/lib/mysql mysql
