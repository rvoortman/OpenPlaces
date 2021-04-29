# OpenPlaces
![Build status](https://github.com/rvoortman/OpenPlaces/actions/workflows/ruby.yml/badge.svg) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Open Places is a Free Open Source GPS Point of Interests Manager. It makes it easy to categorize points on a map.

OpenPlaces is under heavy development at the moment.

## State of the Project
OpenPlaces is not yet ready for primetime yet. However, the following is already done:
- Business logic to create Point of Interests, Categories, Maps and Users
- Authorization and Authentication
- Framework to create API endpoints
- Some Quality of Life development tools like specs, CI, SAST tool, etc..

There is still a lot to be done tough:
- Adding views for the CRUD actions
- Adding a map and plotting the PoI's on the map
- Docker support for easy deployment

Feel free to contribute to this project by forking this repository and opening a Pull Request. You are encouraged to open issues for feature requests.

## Installation
### Prequisities
OpenPlaces uses Ruby on Rails as it's framework. The used database is Postgres. Therefore you need to have at least the following installed:
- Ruby 2.7.3
- Postgres 13.x
- Docker
- Forego/Foreman
- npm (included with Node, see the official installation instructions)
- bundler (`gem install bundler`)
- yarn (`npm install -g yarn`)
- webpack (`yarn global add webpack"`)

### Installation script
There is script for simplicity sake to install and update all the dependencies and make sure the environment is ready to go. Run the following command to get started:
```
bin/setup
```
This will start a docker container with a postgres database, prepare and seed the database and compile the assets for the first time. You are encouraged to read the script to see what it does exactly.

## Development
You can start the local development environment by running the script for this goal:
```
bin/start-dev-environment
```
This will start the docker container with the postgres database and will start Mailcatcher and the Puma webserver. After that, mails are send to Mailcatcher and Puma will handle the webserver requests.

| Service  |  Address |
|---|---|
|  OpenPlaces Web Application  |  http://0.0.0.0:5000  |
|  Mailcatcher  |  http://0.0.0.0:1080  |


## Contributing
You can contribute
- by forking this project and opening a Pull Request
- by opening an issue with bug reports or feature requests
- by spreading the love for OpenPlaces on social media

You can also help financially by following me on patreon:

[![Patreon](https://upload.wikimedia.org/wikipedia/commons/thumb/9/94/Patreon_logo.svg/240px-Patreon_logo.svg.png)](https://www.patreon.com/OpenPlaces)
