Chitter
=======
This is the week #6 friday test for [Makers Academy](http://www.makersacademy.com).

## What is it?
Chitter is a simple web application built in Sinatra, that simulates the popular social network Twitter.

## Specifications

We are going to write a little Twitter clone that will allow the users to post messages to a public stream.

Features:
In order to use chitter as a maker I want to sign up to the service
In order to user chitter as a maker I want to log in
In order to avoid others to use my account as a maker I want to log out
In order to let people know what I am doing as a maker I want to post a message to chitter
In order to see what people have to say as a maker I want to see all peeps in chronological order
Notes:

Makers sign up to chitter with their email, password, name and a user name (i.e. ecomba@makersacademy.com, s3cr3t, Enrique Comba Riepenhausen, ecomba)
The username and email are unique
Peeps (posts to chitter) have the name of the maker and their user handle
Use bcrypt to secure the passwords
Use data mapper and postgres to save the data
You don't have to be logged in to see the peeps
You only can peep if you are logged in.

Bonus:

If you have time you can implement the following:
In order to start a conversation as a maker I want to reply to a peep from another maker.
      Or / and:
Work on the css to make it look good (we all like beautiful things).

## Technologies
- Ruby
- Sinatra
- DataMapper
- PostgreSQL
- RSpec
- Capybara
- HTML
- CSS

## How to use it:

Clone the repository:

```shell
$ git clone git@github.com:leopoldkwok/week6-challenge6.git
```
Change into the directory:

```shell
$ cd week6-challenge6
```
Run Bundle to load the required gems:

```shell
$ bundle install
```
You will need a local version of PostgreSQL, along with a test and a development database:

Create a local database:

```shell
$ psql
=# CREATE DATABASE chitter_test;
=# \q
```

Run the auto-upgrade task:

```shell
$ rake auto_upgrade
```

Run Rspec:

```shell
$ rspec
```
Open a web browser and type localhost:9292