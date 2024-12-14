# Wordock

Wordock is a lightweight, reusable Docker-based WordPress starter template that simplifies development and updates.

## Features
- Customizable environment via `.env`
- Pre-configured MySQL database
- Easy updates with the `update.sh` script

## Getting Started

### Prerequisites\
- Docker installed on your system
- Docker images for WordPress and MySQL manually downloaded

### Setup Instructions

1. Clone this repository:
   ```bash
   git clone <repository-url> my-project
   cd my-project

```
wordock/
├── src/                   # Contains WordPress files
├── docker-compose.yml     # Docker service definitions
├── .env                   # Environment configuration
├── .dockerignore          # Ignore list for Docker
├── README.md              # Project documentation
└── update.sh              # WordPress update script
```

Wordpress 6.7.1