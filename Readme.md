Dependencies:
- Docker Engine
- Docker Compose

Setup:
1. Clone the repository:
	 ```bash
	 git clone

	 ```

2. Navigate to the project directory:
	 ```bash
	 cd your-repo-name
	 ```

3. Add user to docker group (optional, for non-root usage):
	 ```bash
	 sudo groupadd docker
	 sudo usermod -aG docker $USER
	 newgrp docker
	 ```

4. Build and start the Docker containers:
	 ```bash
	 make
	 ```

5. Edit hosts file
