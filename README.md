
# DDEV Ibexa DXP Installer <!-- omit in toc -->

https://github.com/user-attachments/assets/ff9447a4-ed33-4cb1-a524-e0c79c5acb9d

* [What is DDEV Ibexa DXP Installer?](#what-is-ddev-ibexa-dxp-installer)
* [Additional Features](#additional-features)
* [Requirements](#requirements)
* [Preparation](#reparation)
* [Finally: Create Project](#finally-create-project)

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
- App cache: Redis, Valkey, Filesystem, _Memcached(*)_
- Search engine: Elasticsearch, Solr, Legacy

_(*): barely tested (!)_

## Additional Features

- Install Symfony Profiler
- Configure app environment: prod or dev
- Install Ibexa Cloud configuration
- Prompt for product edition
- Install sample data using ibexa/test-fixtures (Access is restricted)

## Requirements

☝ DDEV installed on your system: https://ddev.readthedocs.io/en/stable/users/install/ddev-installation/

☝ For Ibexa Headless, Ibexa Experience, Ibexa Commerce a valid license is mandatory. Adding a personal github OAUTH token is recommended. Typical composer auth.json config:
``` json
{
    "github-oauth": {
        "github.com": "<your-oauth-token>"
    },
    "http-basic": {
        "updates.ibexa.co": {
            "username": "<installation-key>",
            "password": "<installation-token>"
        }
    }
}
```

Further information about Composer Authentication can be found here:

- DDEV Docs: https://docs.ddev.com/en/stable/users/extend/in-container-configuration/#composer-authentication
- Ibexa Docs: https://doc.ibexa.co/en/5.0/getting_started/install_with_ddev/#using-authjson

## Preparation

#### With local Composer authentication already working:

👷Run the following script to symlink your existing auth.json file to DDEVS global configuration: 
``` bash
DDEV_DIR="$(ddev version -j | docker run -i --rm ddev/ddev-utilities jq -r ".raw.\"global-ddev-dir\" | select (.!=null) // \"$HOME/.ddev\"" 2>/dev/null)"

mkdir -p "$DDEV_DIR/homeadditions/.composer"
# Find the correct location of the auth.json file if Composer is installed
COMPOSER_AUTH_FILE="$(composer config --global home 2>/dev/null)/auth.json"

# Otherwise default to the location on Debian
if [ ! -f "$COMPOSER_AUTH_FILE" ]; then
  COMPOSER_AUTH_FILE="$HOME/.composer/auth.json"
fi

ln -s "$COMPOSER_AUTH_FILE" $DDEV_DIR/homeadditions/.composer/auth.json
```

✅ All newly created DDEV projects will now use your local Composer's Authentication.

#### Without having local Composer authentication:

👷 Create `auth.json` file manually
and save it to your global DDEV sources as `~/.ddev/homeadditions/.composer/auth.json`

✅ All newly created DDEV projects will use your custom `auth.json` file.

_Note:
If you do not want the same config for all of your projects, you can do the same per new project:_

``` bash
mkdir my_php_project
cd my_php_project

ddev config --project-type=php

# create .ddev/homeadditions/.composer/auth.json file
# in your project directory as described above
```

## Finally: Create Project

The following code will start the installation for a new project running on https://my_ibexa_project.ddev.local:

``` bash
mkdir my_ibexa_project
cd my_ibexa_project

ddev config --project-type=php
ddev add-on get reithor/ddev-ibexa-installer
ddev ibexa-installer
```
