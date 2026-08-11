> [!NOTE]
> (not affiliated with Techmino or Studio26F)

An attempt to dockerize everything you need to run Techmino's backend.


## Steps:
1. Run the setup script to pull the latest source code for `Techrater` and `Studio26F` into their respective build directorys.
```bash
chmod +x ./setup.sh
./setup.sh
```

2. Copy the `.env.example` file into `.env` and update the passwords and tokens
```bash
cp .env.example .env
# open `.env` with your preferred text editor and edit the credentials
```
3. Compile the binarys and start the container
```bash
docker compose up -d --build
```
