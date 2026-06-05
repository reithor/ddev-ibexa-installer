
# DDEV Ibexa DXP Installer <!-- omit in toc -->

* [What is DDEV Ibexa DXP Installer?](#what-is-ddev-ibexa-dxp-installer)
* [Requirements](#requirements)
* [Additional Features](#additional-features)
* [Getting started](#getting-started)

## What is DDEV Ibexa DXP Installer?

DDEV Ibexa DXP Installer is an interactive installation tool to install Ibexa DXP.
During install you can change the following parameters for the new project:

- Choose DXP release: 5.0 Latest, 5.0.x dev, fixed 5.0.x release, 4.6 Latest, 4.6.x dev, fixed 4.6.x release
- PHP: 8.4, 8.3, 8.2, 8.1
- Node version
- HTTP Servers: nginx-fpm, _apache-fpm(*)_
- HTTP Cache: Varnish, Symfony's built-in HTTP cache
- Database:
  - MariaDB, MySQL, Postgres
- App cache: Redis, Filesystem, _Memcached(*)_
- Search engine: Elasticsearch, Solr, Legacy

_(*): barely tested (!)_

## Additional Features

- Install Symfony Profiler
- Configure app environment: prod or dev
- Install Ibexa Cloud configuration
- Prompt for product edition
- Install sample data using ibexa/test-fixtures (Access is restricted)

## Requirements

- DDEV installed in your system: https://ddev.readthedocs.io/en/stable/users/install/ddev-installation/
- For Ibexa Headless, Ibexa Experience, or Ibexa Commerce, a valid license is mandatory.
  Adding a personal GitHub OAUTH token is recommended.
  Typical Composer auth.json config:
  ```json
  {
      "github-oauth": {
          "github.com": "YOUR_OAUTH_TOKEN"
      },
      "http-basic": {
          "updates.ibexa.co": {
            "username": "INSTALLATION_KEY",
            "password": "INSTALLATION_TOKEN"
          }
      }
  }
  ```
 
## Getting started

Credential can be stored in several places.
In `~/.ddev/homeadditions/.composer/auth.json` for all your DDEV projects or at project level.

For example,
the following commands
create a new DDEV project and customize its ports,
copy the global auth.json to the project,
get the add-on,
and run the installer:

```shell
AUTH_JSON=~/.composer/auth.json
PROJECT_DIR=~/www/my-ddev-ibexa-project

mkdir $PROJECT_DIR
cd $PROJECT_DIR || exit 1

ddev config --project-type=php --router-http-port=8080 --router-https-port=8443
mkdir -p .ddev/homeadditions/.composer
cp $AUTH_JSON .ddev/homeadditions/.composer/auth.json
ddev add-on get reithor/ddev-ibexa-installer
ddev ibexa-installer
```

You can increase installer verbosity (for example to see the packages installed by Composer)
by creating a DDEV config file like `.ddev/config.local.yaml` before running the installer with the content:

```yaml
web_environment:
  - VERBOSE_INSTALL=true
```

It can eventually be created by a command line:
```shell
echo -e "web_environment:\n  - VERBOSE_INSTALL=true" > .ddev/config.local.yaml
```

## How to contribute

Clone this repository locally, for example:

```shell
git clone git@github.com:reithor/ddev-ibexa-installer.git ~/ddev-ibexa-installer
```

You can then install the add-on from your local copy:

```shell
ddev add-on get ~/ddev-ibexa-installer
```

When you open a pull request to propose your changes,
you can test them by installing the add-on from this pull request using its number:

```shell
# Test https://github.com/reithor/ddev-ibexa-installer/pull/123
ddev add-on get reithor/ddev-ibexa-installer --pr 123
```
