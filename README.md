# Listmonk Kamal

A basic [Kamal](https://kamal-deploy.org/) setup for deploying [Listmonk](https://listmonk.app/) newsletter manager.

## Features

- One-command deployment with Kamal
- Automatic database initialization
- Custom port mapping (5433) for PostgreSQL
- Uses GitHub Container Registry

## Prerequisites

- Docker
- Ruby (for Kamal)
- Kamal
- Linux server with Docker
- GitHub Personal Access Token with Package read/write access
- Domain name

## Quick Start

1. Clone and configure:
```bash
git clone https://github.com/mrkshm/listmonk-kamal.git
cd listmonk-kamal
cp config/local.yml.sample config/local.yml
cp .kamal/secrets.sample .kamal/secrets
```

2. Edit `config/local.yml`:
```yaml
server_ip: your_server_ip
domain: your.domain.com
github_username: your_username
```

3. Set up secrets in `.kamal/secrets`:
```plaintext
GITHUB_PAT=your_github_access_token
POSTGRES_PASSWORD=your_db_password
LISTMONK_db.password=your_db_password
LISTMONK_app.admin_password=your_admin_password
```

4. Deploy:
```bash
# This will set up and start Listmonk
kamal setup
```

After making changes to your configuration, update with:
```bash
kamal deploy
```

Visit `https://your.domain.com` to start using Listmonk.

## Configuration Files

- `deploy.yml`: Main Kamal deployment configuration
- `Dockerfile`: Simple container definition using official Listmonk image
- `local.yml`: Personal settings (not committed to git)
- `secrets`: Sensitive credentials (not committed to git)

## Database

The PostgreSQL database runs on port 5433 to avoid conflicts with existing installations. Data persists across deployments in a Docker volume.

## Make It Better

If you've got ideas to improve this:

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

MIT License