## Usage
[Docker Hub](https://hub.docker.com/r/champpg/sloptoob)

Credit: [Voy7](https://github.com/Voy7/SlopToob) - Thank you for the permission to modify and use SlopToob and turn it into a docker container!

### Running Container
You want the following directory structure for this project to work the data, output, .env dir must be owned by PUID=1000 and GUID=1000
```
.
├── data
│   ├── output
│   └── .env
├── docker-compose.yml
```

### Docker
```
docker run champpg/sloptoob:latest -v ./data/.env:/SlopToob/.env  -v ./data/output:/SlopToob/output -v /path/to/media:/videos -e PUID=1000 -e PGID=1000 -p 3000:3000
```

### Docker Compose
```
services:
  sloptoob:
    image: champpg/sloptoob:latest
    container_name: slop-docker
    restart: unless-stopped
    environment:
      - PUID=1000
      - GUID=1000
    ports:
    - 3000:3000
    volumes:
      - ./data/.env:/SlopToob/.env # Don't change unless you know what you're doing
      - ./data/output:/SlopToob/output # Don't change unless you know what you're doing
      - /path/to/media:/videos # Change to your media directory
```

### media.env
```
SECRET_KEY = secret
USER_PASSWORD = usr-password
ADMIN_PASSWORD = adm-password

# DON'T CHANGE FOR THE LOVE OF GOD
SERVER_URL = http://localhost:3000
SERVER_PORT = 3000
VIDEOS_PATH = /videos
```