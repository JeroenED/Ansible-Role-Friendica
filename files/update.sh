#!/bin/bash

## https://social.jeroened.be/display/cd9f100a165b8c276118c9f802432799

## Get variables
webroot=${1}

if [[ ${webroot} == "" ]]; then
	webroot=${PWD}
fi

## initialize
cd ${webroot}
bash bin/console maintenance 1 || exit 1

## Core update
git pull --ff-only || exit 2
php bin/composer.phar install --optimize-autoloader --no-dev || exit 3
bash bin/console dbstructure update || exit 1

## Addon update
cd addon
git pull --ff-only || exit 2

## finalize
cd ${webroot}
bash bin/console maintenance 0 || exit 1