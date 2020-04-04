# Initial setup

0. Check "Setup docker" paragraph.
1. Copy `./template.env` to `./.env`.
2. Fill `./.env` variables.
3. Make sure that `~/certificates` contains your adb keys copied from host OS (usually they are in `~/.android`).
4. Depending what you want to do - use "Create project from scrath" or "Clone project from repository" paragraph.
5. (optional) Use `./tools/authenticate_container.sh` to get security popup on mobile.
6. (optional) Check if `./boot.sh` should do something more before starting your project.
7. Run `docker-compose up --build`.

# Setup docker

...

# Create project from scrath

Use ./tools/init_project.sh

# Clone project from repository

...

# 