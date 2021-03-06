# Reggie
A Ruby on Rails web application for use in the registration of attendees to small university conferences or symposia. 

## Why?

This isn't mind-blowing code, it's just another Rails app. Why do this when there are other options? Well...

Sadly, this is my annual work excuse to (re-)construct a Rails app for gathering symposium registration information. Creating web apps in Ruby on Rails is quite simply fun - a challenge.
It's also a good excuse to investigate new gems, services, and technologies. I don't get enough Ruby in my day job. This project has evolved over the past few years.
Each iteration adds new features and cleans up code. 

## Actions:

* Simple semi-static pages for event information
* Receive information from attendees including an abstract via file upload (S3 Storage using Paperclip)
* Email attendee their registration receipt (using SendGrid addon at Heroku)
* All registrations receipts are publicly available (URLs slugged with Friendly_ID)
* All administrative actions (view all/index, edit, delete) require authorization via Authlogic. Although, openid seems like a better idea.
* Export all registration data except for attachments into CSV (FasterCSV) formatted file
* Download all abstracts from S3 into a zip file (Rubyzip; Paperclip)
* Toggle on/off registrations (rails-settings)

## Inactions:

* Take payment
* User modifying their registration (modification only by Admin) although this would probably be not that difficult to implement.


## Setup

Step 1. Add and complete required files

Complete and add to project the following files (example files are included): 

* config/database.yml
* config/s3.yml
* config/passwords_config.yml
* config/app_config.yml

Hoptoad is included as a gem. Rake file is also included, but you'll need to add your own config file. Run:

    script/generate hoptoad --api-key your_key_here

For Heroku, make a .gems manifest file as FasterCSV and rubyzip as they are required but not available by default.
See [http://docs.heroku.com/gems](http://docs.heroku.com/gems)

Run

    rake secret

to generate a new pseudo-random key.

Replace new generated key with the old key in

    config/initializers/session_store.rb


Step 2. 

Modify the semi-static pages and layouts to your liking. You'll find them in app/views/page/ and app/views/layouts/page.html.erb, respectively.

Step 3.

Get up and running on Heroku. Follow these steps in the [Heroku Docs](http://docs.heroku.com/quickstart). Assuming that you already have a fork or copy of Reggie as a git repo, begin with the Heroku Quickstart step 2.





## Hosting

Heroku and Amazon S3 for file uploads, but this could be easily modified for a VPS host. 

## Language / Framework

* Ruby 1.8.7 p72
* Rails 2.3.5

## Plugins / Gems / Generators

* [Authlogic](http://github.com/binarylogic/authlogic)
* [FasterCSV](http://rubygems.org/gems/fastercsv)
* [Friendly_ID](http://github.com/norman/friendly_id)
* [Paperclip](http://github.com/thoughtbot/paperclip)
* [Nifty_Generators](http://github.com/ryanb/nifty-generators)
* [Hoptoad](http://github.com/thoughtbot/hoptoad_notifier)
* [Heroku](http://rubygems.org/gems/heroku)
* [Rubyzip](http://rubygems.org/gems/rubyzip)
* [Rails-settings](http://github.com/Squeegy/rails-settings)

## Services used

* Amazon S3
* Heroku
* SendGrid via Heroku Account
* Hoptoad

## License

Copyright &copy; 2010 Chase Southard, released under the MIT license. 


