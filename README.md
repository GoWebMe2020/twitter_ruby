# Project Name

## Twitter

# User Stories

- [x] As a user, I want to visit the home page and see a feed of tweets.
- [x] As a user, I would like to be able to add a new tweet and see it displayed.
- [x] As a user, so I can remove a tweet, I would like to delete a tweet.
- [x] As a user, if I change my mind, I would like to update a tweet.
- [x] Extract a database object and refactor.
- [x] As a user, if I have something to say about a tweet, I would like to be able to comment on it.

# Install Databases

- Follow the db migration instructions in their order.

# Technologies / Dependencies

### Backend

- Ruby
- Sinatra
- Rspec
- SQLite3

### Front End

- React
- CSS

### APIs

- GNews (https://gnews.io/)

# Installation

- Clone this repo
- Make sure that you have 2 terminals open.
- Change directory into the first directory
- Follow the database installation instructions
- Run bundle install to install all the necessary gems
- Run rackup to start the Ruby server. Likely to be localhost:9292
- In the second terminal, change directory into the React folder
- Run npm install
- Run npm start to the start the React server. Likely localhost:3000

- You will need to either create an account on GNews or another news feed provider.
- Once you have created an account, create a .env file in the root derectory and make sure the variable name for the API_KEY.
- You may also have to change the SERVER_SIDE varibale details once you connect the server.
