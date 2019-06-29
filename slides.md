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

## Ruby basics

    index = 100 # Déclaration de variable

    welcome = "Hello World"

    status = :in_progress # Symbole

    array = [1, 2, 3]

    array2 = [1, "Bonjour", nil] # Tableau non typé

    hash = { title: "Apéro", content: "Ruby on Rails", attendees: 27 }

    nil # représente null

## Ruby basics

    array = [-1, -2, -3]

    array.map { |number| number.abs } # => [1, 2, 3]
         .map { |number| number * 2 } # => [2, 4, 6]


## Fonctions

    def welcome
      puts "Welcome here"
    end

    welcome # => Welcome here

    welcome() # => Welcome here

    def welcome(name)
      puts "Welcome #{name}"
    end

    welcome "bob" # => Welcome bob

    welcome("bob") # => Welcome bob

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

# Rails Philosophie

* 
