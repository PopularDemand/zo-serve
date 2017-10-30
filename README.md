# ZO-SERVE

*It started with champagne, then we started talking. The words I was saying made the fantasy feel real. -Dubba Jonny*

Wanna pull this repo down for some reason?? Awesome.

Have the following for parity:

ruby 2.4.1
bundler 1.15.4

Then:

`git clone git@github.com:PopularDemand/zo-serve.git`

`cd zo-serve`

`bundle && rake db:create && rake db:migrate`

`rails s`

The app has no graphic interface, so be great with curl or have [Postman](https://www.getpostman.com/apps) or a similar application. Hit up the routes from `config/routes.rb` and happy hacking!
