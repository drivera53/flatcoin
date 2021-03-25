# FlatCoin
Welcome to FlatCoin! This App was develop as a Flatiron School Sinatra project. I developed this app to help users practice building a cryptocurrency portfolio and react to the markets in real time using fake money (10000 free FlatCoins), they can also compete against their friends or coworkers to earn their spot at the top of the leaderboards.

# Installation
Fork this repository and Install all of the required gems: (If you run into issues try deleting `Gemfile.lock` and then `bundle install` again.)
```ruby
bundle install
```
Migration:
My current database holds ten accounts with trades, if you want to practice with them run:
```ruby
rake db:migrate SINATRA_ENV=development
``` 
and then `shotgun` to start the server, FlatCoin app will be running on `http://localhost:9393/` as default. 
```ruby
shotgun
```
If you want to start with a fresh new database you may delete `development.sqlite` and `schema.rb`; then run:
```ruby
rake db:migrate SINATRA_ENV=development
```
You may also use my `seeds.rb` or make your own.
```ruby
rake db:seed
```

# Usage
After you run `shotgun` FlatCoin app will be running on `http://localhost:9393/`. Here you may signup or login using credencials from `seeds.rb`. The main page displays a list of the top 20 cryptocurrencies by market cap and you can start trading right away. Keep in mind that you should have enough Buying Power in order to execute an order. Balance displays a list of all your trades along with your portfolio value, here you can also sell or edit your trade.
Lederboard displays a list of all users along with its properly sorted portfolio value.
All trades displays a detailed list of all users' trades.   

## License
[MIT](https://github.com/drivera53/flatcoin/blob/main/LICENSE)