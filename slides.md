% Apéro on Rails
% Jean-François Labbé
% 04 07 2019

# Au menu
* What is Rails?
* Démo

# What is rails
* Framework d'application web type MVC
* Langage Ruby
* V1.0 en 2005
* Créateur David Heinemeier Hansson (DHH)
* Extrait d'une application (Basecamp)

# Ruby

## Introduction
* Première version en 1995 (comme Java)
* Inspiré de: Lisp, Samlltalk, Perl, Python
* Langage interprété
* Orienté Objet
* Tout est Objet

## Coinci

    # Java
    public class HelloWorld {
        public static void main(String[] args)
        {
            for (int i = 0; i < 3; i++)
            {
                System.out.println("Hello, world!");
            }
        }
    }
    
    # Ruby
    3.times do
      puts "Hello, world!"
    end


## Ruby basics

    welcome = "Hello World"

    status = :in_progress # Symbole

    array = [1, "Bonjour", nil] # Tableau non typé

    hash = { title: "Apéro", content: "Ruby on Rails", attendees: 27 }

    nil # représente null

## Ruby basics

    array = [-1, -2, -3]

    array.map { |number| number.abs } # => [1, 2, 3]
         .map { |number| number * 2 } # => [2, 4, 6]


## Keyword arguments

    def welcome(name: "bob")
      puts "Welcome #{name}"
    end

    welcome # => Welcome bob

    welcome("john") # => Welcome john

## Fonctions names

    def saved?
      true
    end

    def overwrite!
      ...
    end

## Class

    class World
      def initialize(name)
        @name = name # Instance variable
      end

      def name
        @name
      end

      def name=(name)
        @name = name
      end
    end
    world = World.new("level 1")
    world.name # => "level 1"
    world.name = "new world" # => "new world"

## Class

    class World
      attr_accessor :name

      def initialize(name)
        @name = name # Instance variable
      end
    end

    world = World.new("level 1")
    world.name # => "level 1"
    world.name = "new world" # => "new world"

## Tout est Objet

    1.class # => Integer

    "hello".class # => String

    1.nil? # => false

    nil.nil? # => NilClass

# Rails

## Qui utilise

Github, Gitlab, Airbnb, Shopify, 500px, Twitch, Zendesk

<div class="fragment">
Rails doesn't scale?
</div>

<div class="fragment">
Shopify: 600_000 site marchands, 80_000 req/s (max) [Source 2018](https://engineering.shopify.com/blogs/engineering/e-commerce-at-scale-inside-shopifys-tech-stack)
</div>

## Qui utilise En Open Source

[Dev.to](https://github.com/thepracticaldev/dev.to),
[Discourse](https://github.com/discourse/discourse),
[E-petitions](https://github.com/alphagov/e-petitions),
[Gitlab](https://gitlab.com/gitlab-org/gitlab-ce),
[Mastodon](https://github.com/tootsuite/mastodon),
[Rubygems](https://github.com/rubygems/rubygems.org)...


## Présentation

* Sélection d'outils
* Convention over Configuration
* DRY (don't repeat yourself)
* CRUD (Create, Read, Update, Delete)
* REST (Representational state transfer)
* Basé sur Rack [Ruby Webserver Interface](https://rack.github.io/)

## Rails 6.0
* Parallel testing
* Wepacker
* Multiple databases
* ActionMailbox
* ActionText

## Avantages
* Développement rapide
* Beaucoup de librairies
* Maintenabilité
* Intégrations (front, apis, services)
* Tests

## Pour quel projet
* Une appli web
* E-commerce
* Prototypes

## Structure

    ├── app
    │   ├── assets
    │   ├── channels
    │   ├── controllers
    │   ├── helpers
    │   ├── javascript
    │   ├── jobs
    │   ├── mailers
    │   ├── models
    │   └── views
    ├── Gemfile
    ├── db
    │   └── migrate

## Structure

    ├── log
    ├── public
    ├── test
    │   ├── channels
    │   ├── controllers
    │   ├── fixtures
    │   ├── helpers
    │   ├── integration
    │   ├── mailers
    │   ├── models
    │   ├── system
    
## Les outils
* Migrations de la base de données
* Gestionnaire de dépendances
* Générateurs
* Console

## Les Gems
* Administration: Administrate, ActiveAdmin
* Authentification: Devise
* Autorisation: ActionPolicy, CanCanCan, Pundit
* Async jobs: Sidekick
* Login Google, Facebook, Twitter: Omniauth

## Les Gems 2
* Elasticsearch: Searchkick
* Feature flags: Flipper
* Filtering: Ransack
* Kafka: Karafka
* Mock http: Vcr

## ERB: Template des vues

    <h1>Apéro on Rails</h1>
    <p>Time: <%= Time.now %></p>

## ERB: Template des vues

controllers/posts_controller.rb

    def index
      @posts = Post.all
    end

posts/index.html.erb

    <h1>Les posts</h1>
    <% @posts.each do |post| %>
      <h2><%= @post.title %></h2>
      <p><%= @post.content %></p>
    <% end %>

## ERB: Template des vues

controllers/posts_controller.rb

    def index
      @posts = Post.all
    end

posts/index.html.erb

    <h1>Les posts</h1>
    <% @posts.each do |post| %>
      <%= render post %>
    <% end %>

posts/_post.html.erb

    <h2><%= @post.title %></h2>
    <p><%= @post.content %></p>


## config/routes.rb
```
Rails.application.routes.draw do
  resources :posts
end
```
## Routes
| url                    | Posts controlleur  |
|------------------------|--------------------|
|GET    /posts           | #index             |
|GET    /posts/:id       | #show              |
|GET    /posts/new       | #new               |
|POST   /posts           | #create            |
|GET    /posts/:id/edit  | #edit              |
|PUT    /posts/id        | #update            |
|DELETE /posts/id        | #destroy           |



## Créons un blog

Un blog est composé d'articles
Un article a des commentaires

## Créer une resource

    rails generate scaffold article title content:text

## Une migration

    class CreateArticles < ActiveRecord::Migration[6.0]
      def change
        create_table :articles do |t|
          t.string :title
          t.text :content
 
          t.timestamps
        end
      end
    end


## Un Modèle

    class Article < ApplicationRecord
    end

vide?

## Controlleur
