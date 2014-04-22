# Forem for Electorate.me

This is a fork of the [Forem](https://github.com/radar/forem) gem, used in the implementation of forums in [Electorate.me](https://github.com/electorateme/electorate2-0)

# Getting Started

Inside **Electorate.me**, **Forem** uses **Redis** to save the **Forem::Category** ID's used in the basic categories. Also, it saves the ID for the **Forem::Group** used for Moderators

**Redis** is initialized in `config/initializers/redis.rb` as `$redis`, in the Electorate.me app.

## Retrieve basic ID's used in Forem

To retrieve the basic ID's used in Forem, the following method is used:

```ruby
$redis.get('key_of_the_id_stored')
```

Currently, the keys stored are:

    communities_category_id
    leaders_category_id
    general_category_id
    moderators_group_id

For example, to retrieve the ID for the **Leaders** category, you use `$redis.get('leaders_category_id')`

# Initializing Forem in the server

Initializing forem is easy!

## Initialize

First, initialize Forem's basics (categories and moderator's group):

```shell
bundle exec rake forums:initialize
```

## Create Leaders forums

This command takes the **Leadership Positions** of every **Movement** and creates a forum for each one, inside 

```shell
bundle exec rake forums:create_leaders
```

## Create Communities forums

This command creates the **Category** forums for each **Movement** according to its **Scope**

```shell
bundle exec rake forums:create_communities
```


## Create Moderators forums

This command imports the **Leadership Users** which *state* is *Active* of each **Movement** and recognizes them as **Moderators** of the **Movement**'s forum

```shell
bundle exec rake forums:create_moderators
```

## Clear all content

This command destroys every **Forum**, **Category**, **Group** of the database

```shell
bundle exec rake forums:clear
```

##Setting a user as Superadmin ('Access Denied' message)

If you try to access the **Admin Area** and the message *Access Denied* pops up, it's necessary to set the user as *Superadmin*. 

To do this, access the **Rails Console** in the server and find the **User**, then set its attribute `forem_admin` to *true* and `save` the **User**.

# Methods applied to the User model

These are the basic **Forem**'s methods implemented in the **User** model:

    forem_name
    forem_email
    forem_moderator(movement)