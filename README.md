# Flickr API 📷

A simple Flickr API project to learn working with external API's. Enter a user ID to then retrieve and display photos in the app.
* [Link to lesson](https://www.theodinproject.com/lessons/ruby-on-rails-flickr-api)
* [Flickr API Doc](https://www.flickr.com/services/api/)

## Table of Content

- [Installation](#installation)
- [Usage](#usage)

## Installation

clone repository
```
git clone git@github.com:MclPio/odin-flickr-api.git
```

install gems
```
bundle install
```

configure figaro
```
bundle exec figaro install
```

add you API key and shared secret to config/application.yml
```
flickr_api_key:
flickr_shared_secret:
```

install bootstrap:
```
./bin/rails css:install:bootstrap
```

Gems used:
1. [flickr](https://github.com/cyclotron3k/flickr)
2. [figaro](https://github.com/laserlemon/figaro)

## Usage

start server
```
rails s
```

open in browser
```
localhost:3000
```

Enter a flickr user id and search
