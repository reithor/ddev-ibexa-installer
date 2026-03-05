![project is maintained](https://img.shields.io/maintenance/yes/2025.svg)

# DDEV Ibexa DXP Installer <!-- omit in toc -->

* [What is DDEV Ibexa DXP Installer?](#what-is-ddev-ibexa-dxp-installer)
* [Requirements](#requirements)
* [Additional Features](#additional-features)
* [Getting started](#getting-started)

## What is DDEV Ibexa DXP Installer?

DDEV Ibexa DXP Installer is an interactive installation tool to install Ibexa DXP.
During install you can change the following parameters for the new project:

- Choose DXP release: 4.6 Latest, 4.6.x dev, 5.0.x dev, fixed 4.6.x release, 3.3 Latest, fixed 3.3.x release
- PHP: 8.3, 8.2, 8.1
- Node: 18, 20, 21, 22
- HTTP Servers: nginx-fpm, apache-fpm
- HTTP Cache: Varnish, Symfony's built in HTTP cache
- Database:
  - MariaDB: 10.11, 10.3
- MySQL: 8
- Postgres: 16, 15, 14, 13, 12, 11, 10
- App cache: Redis, Memcached, Filesystem
- Search engine: Elasticsearch, Solr, Legacy

## Additional Features
- Install Symfony Profiler
- Configure app environment: prod or dev
- Install Ibexa Cloud configuration
- Prompt for product edition
- Install sample data using ibexa/test-fixtures (Access is restricted)

## Requirements
- DDEV installed in your system: https://ddev.readthedocs.io/en/stable/users/install/ddev-installation/
- For Ibexa Headless, Ibexa Experience, Ibexa Commerce a valid license is mandatory. Adding a personal github OAUTH token is recommended. Typical composer auth config:
```
# .ddev/homeadditions/.composer/auth.json
{
    "github-oauth": {
        "github.com": "YOUR_OAUTH_TOKEN"
    },
    "http-basic": {
        "updates.ibexa.co": {
            "username": "INSTALLATION_KEY",
            "password": "INSTALLATION_TOKEN"
        },
    }
}
```
 
## Getting started

Clone this repo locally, eg:
```
git clone git@github.com:reithor/ddev-ibexa-installer.git ~/ddev-ibexa-installer
```

When this is done, you can create new projects :
```
mkdir installer_demo
cd installer_demo
~/ddev-ibexa-installer/bin/create_project
```

Existing local project checkouts can be initialized:
```
~/ddev-ibexa-installer/bin/init_project
```
