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

## The game

The auth portion of the app has no graphic interface, so be great with curl or have [Postman](https://www.getpostman.com/apps) or a similar application. Hit up the routes from `config/routes.rb`.


There is a minimal demo of the game located in the `/demo` directory. It can be used to debug the ActionCable interactions. To run the demo:

1. cd to the demo directory and serve the files from localhost:8000
    * `cd demo`
    * `ruby -run -e httpd . -p 8000`
    * Alternative to the above commands, there is a rake task, `rake demo:start`
1. If you absolutely must use a different port/IP configuration add a matching regex to the cable's whitelisted hosts in `application.rb`: `config.action_cable.allowed_request_origins = [/localhost:8000/,/* your stuff here */]`
1. Start your rails server
1. Navigate to localhost:8000
1. Create Game -> Create Subscription -> Initialize Round
    * Create game creates a game record in Rails' and returns the object
    * Create subscription instantiates the GameChannel subscription
    * Initialize round begins the back and forth socket connections between user and server

The final product will eventually be available at this repo:
[###Renzo](https://github.com/PopularDemand/renzo)

Happy hacking!