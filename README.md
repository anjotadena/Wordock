# **Wordock**

<div align="center">
  <img src="wordock.png" alt="Wordock Logo" width="200">
</div>

**Wordock** is a Dockerized WordPress environment designed for streamlined local development and deployment. It uses Nginx, PHP-FPM, MySQL, phpMyAdmin, and MailHog, with built-in support for HTTPS and versioning.

---

## **Folder Structure**

The project is structured as follows:

```
wordock/
├── src/                         # WordPress core files (populated on first run)
├── wordock.png                 # Project logo
├── config/                      # Configuration files for Nginx and PHP
│   ├── nginx/
│   │   ├── nginx.conf           # Nginx server configuration
│   │   ├── Dockerfile           # Custom Dockerfile for Nginx
│   │   └── ssl/                 # SSL certificates
│   │       ├── self-signed.crt # Self-signed SSL certificate
│   │       ├── self-signed.key # Private key for the certificate
│   │       └── ca.crt          # Certificate Authority for trust
│   ├── php/
│   │   ├── php.ini              # PHP configuration for WordPress
│   │   └── Dockerfile           # Custom Dockerfile for PHP
├── .github/                     # GitHub-specific files (e.g., PR templates)
│   └── PULL_REQUEST_TEMPLATE.md # Pull request template
├── docker-compose.yml           # Docker Compose configuration
├── .env                         # Environment variables for configuration
├── .gitignore                   # Files and folders to ignore in Git
├── README.md                    # Documentation
└── VERSION                      # Application version (e.g., 1.0.0-beta)
```

---

## **Beta Version Notice**
This application is currently in **beta (1.0.0-beta)**. Some features may still be under development or subject to change. We welcome your feedback and contributions to improve Wordock.

---

## **Features**
- Nginx as the web server
- PHP-FPM for processing PHP files
- MySQL 5.7 as the database
- phpMyAdmin for managing the database
- MailHog for capturing emails in development
- HTTPS with self-signed certificates for local development
- Customizable through `.env` and easy versioning

---

## **Getting Started**

### **1. Prerequisites**
Ensure the following tools are installed on your system:
- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

---

### **2. Clone the Repository**
Clone the Wordock repository to your local machine:
```bash
git clone https://github.com/yourusername/wordock.git
cd wordock
```

---

### **3. Configure the Environment**
Edit the `.env` file to set your desired configuration:
```env
# WordPress Configuration
WP_PORT=8000
WP_PORT_HTTPS=8000
WP_DB_NAME=wordock_database
WP_DB_USER=wordock_user
WP_DB_PASSWORD=password

# MySQL Configuration
DB_ROOT_PASSWORD=root
```

---

### **4. Build and Start the Containers**
Use Docker Compose to build and start the environment:
```bash
docker-compose up -d
```

---

### **5. Access the Application**
- WordPress: [https://localhost](https://localhost)
- phpMyAdmin: [http://localhost:9080](http://localhost:9080)
  - Username: `wordock_user` (from `.env`)
  - Password: `wordock_password` (from `.env`)
- MailHog: [http://localhost:8025](http://localhost:8025)

---

### **6. Stopping the Environment**
To stop the running containers:
```bash
docker-compose down
```

---

### **7. Reset the Database**
To reset the database and start fresh:
```bash
docker-compose down --volumes
docker-compose up -d
```

---

## **Contributing**

We welcome contributions to Wordock!  
If you want to report a bug, suggest a new feature, or improve the code, feel free to create a pull request (PR).  

### **Steps to Contribute**
1. **Fork the Repository**: Click the **Fork** button at the top right of this page to create your copy of the repo.
2. **Clone Your Fork**:
   ```bash
   git clone https://github.com/yourusername/wordock.git
   cd wordock
   ```
3. **Create a New Branch**: Use a descriptive branch name:
   ```bash
   git checkout -b feature/your-feature-name
   ```
4. **Make Changes**: Add your improvements or fixes.
5. **Commit Your Changes**:
   ```bash
   git add .
   git commit -m "Describe your changes"
   ```
6. **Push Your Branch**:
   ```bash
   git push origin feature/your-feature-name
   ```
7. **Create a Pull Request**:  
   Go to the original repository and click **New Pull Request**. Follow the PR template guidelines.

You can find the **Pull Request template** [here](.github/PULL_REQUEST_TEMPLATE.md).

---

## **Author**
**Anjo Tadena**  
Visit my website: [anjotadena.com](https://anjotadena.vercel.app)

---

## **License**
This project is licensed under the MIT License.

---
