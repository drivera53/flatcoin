# FlatCoin
Welcome to FlatCoin! This App was develop as a Flatiron School Sinatra project. I developed this app to help users practice building a cryptocurrency portfolio and react to the markets in real time using fake money (10000 free FlatCoins), they can also compete against their friends or coworkers to earn their spot at the top of the leaderboards.

# Installation
Fork this repository and Install all of the required gems:
```ruby
bundle install
```
Migration:
My current database holds ten accounts with trades, if you want to practice with them run:
```ruby
rake db:migrate SINATRA_ENV=development
``` 
and then
```ruby
shotgun
```
If you want to start with a fresh new database you may delete `development.sqlite` and `schema.rb`; and then run:
```ruby
rake db:migrate SINATRA_ENV=development
```
You may also use my `seeds.rb` or make your own.
```ruby
rake db:seed
```


# Usage
Execute the bin file './bin/run'. 
You will be prompted with a list of the top 20 cryptocurrencies in the world. You can then get detailed information of each of the 20 coins by typing its number.
You can also get information from any other cryptocurrency by just typing its name. 

## License
[MIT](https://github.com/drivera53/cli_cryptocurrency_data/blob/main/LICENSE)