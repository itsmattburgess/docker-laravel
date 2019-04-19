# Laravel CLI

![Build Status](https://img.shields.io/docker/build/itsmattburgess/docker-laravel.svg)
![Downloads](https://img.shields.io/docker/pulls/itsmattburgess/docker-laravel.svg)
![Licence](https://img.shields.io/github/license/itsmattburgess/docker-laravel.svg)

This is a Docker image which builds a CLI environment for operating Laravel applications in CI/CD pipelines. It does not serve the site and as such does not include a web server. I use it purely to run tests for my laravel applications.

## Installed extensions

It comes built with the following packages and extensions enabled, in addition to the Laravel requirements:

- PHP 7.3
  - `imagick`
  - `xdebug`
  - `mongodb`
  - `curl`
  - `xml`
  - `gd`
  - `bcmath`
- npm
- yarn
- pdftk
- unzip
- sqlite3

## Contributing

If you want to use this image for your pipeline builds, but need access to a extension which isn't installed, I welcome pull requests. Submit your PR and I will review as soon as possible.
