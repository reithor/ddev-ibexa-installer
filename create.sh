#!/bin/bash

ddev config --project-type=php
ddev add-on get ~/ddev-ibexa-installer
ddev start