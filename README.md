### Docker Volumes Overview

*   **Docker Volumes**: Volumes are managed by Docker and provide a way to persist data in containers. They are stored in a part of the host filesystem which is isolated from other parts of the system. Volumes are useful when you want to keep data across container restarts, upgrades, or container removal.
*   **Bind Mounts**: A bind mount is a direct mapping of a file or directory from the host into a container. Unlike volumes, bind mounts can be anywhere on the host filesystem and are not managed by Docker. Changes in the container’s filesystem will affect the host file system and vice versa.

* * *

1.  **Create a Docker Volume:**

    `docker volume create mysqlvol`
    
    *   This command creates a Docker volume named `mysqlvol`, which can be used to persist data between container restarts or when containers are removed. Volumes are the preferred method for persisting data in Docker as they are managed by Docker itself.
2.  **List Docker Volumes:**
    
    `docker volume list`
    
    *   This command lists all the Docker volumes available on the system. In your case, it shows `mysqlvol` as the created volume.
3.  **Run MySQL Container with Volume Mount:**
    
    `docker run --name mysql-wvol -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d --mount source=mysqlvol,target=/var/lib/mysql mysql`
    
    *   **`--name mysql-wvol`**: Assigns a name (`mysql-wvol`) to the container.
    *   **`-p 3306:3306`**: Maps port 3306 on the host machine to port 3306 in the container, allowing access to MySQL from outside the container.
    *   **`-e MYSQL_ROOT_PASSWORD=my-secret-pw`**: Sets the root password for MySQL.
    *   **`-d`**: Runs the container in detached mode (in the background).
    *   **`--mount source=mysqlvol,target=/var/lib/mysql`**: Mounts the previously created Docker volume (`mysqlvol`) to the container’s `/var/lib/mysql` directory, where MySQL stores its data. This ensures that MySQL data is persisted across container restarts.
    *   **`mysql`**: Specifies the MySQL image to use for creating the container.
4.  **List Running Containers:**

    `docker ps`
    
    *   This command lists all running containers. In your example, the container `mysql-wvol` is running, and it’s exposing port 3306 for MySQL access.
5.  **Remove Docker Container:**
    
    `docker container rm mysql-wvol`
    
    *   This removes the running container `mysql-wvol`. Note that the volume `mysqlvol` remains intact even after the container is removed.
6.  **Run MySQL Container with Bind Mount:**
    
    `docker run --name mysql-wbind -p 3306:3306 -e MYSQL_ROOT_PASSWORD=my-secret-pw -d --mount type=bind,source="$(pwd)"/mysql_bind_folder,target=/var/lib/mysql mysql`
    
    *   **`--mount type=bind`**: This command uses a bind mount instead of a volume. The source for the bind mount is the `mysql_bind_folder` in the current working directory (from `$(pwd)`), and the target is `/var/lib/mysql` inside the container.
    *   A **bind mount** directly maps a directory or file from the host system into the container. Unlike volumes, bind mounts are not managed by Docker and are typically used when you need the container to access files or directories on the host.

* * *
