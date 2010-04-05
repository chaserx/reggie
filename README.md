# Reggie
A Ruby on Rails web application for use in the registration of attendees to small university conferences or symposia. 

## Why?

Why do this when there are other options? Well...

## Actions:

* Simple semi-static pages for event information
* Receive information from attendees including an abstract via file upload (S3 Storage using Paperclip)
* Email attendee their registration receipt (thinking of using SendGrid addon at Heroku)
* All registrations receipts are publicly available (URLs slugged with Friendly_ID)
* All administrative actions (view all/index, edit, delete) require authorization via Authlogic. Although, openid seems like a better idea.
* Export all registration data except for attachments into CSV (FasterCSV) formatted file
* Download all abstracts from S3 into a zip file (Rubyzip; Paperclip)
* Toggle on/off registrations (rails-settings)

## Inactions:

* Take payment
* User modifying their registration (modification only by Admin)


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

Step 2. 







## Hosting

Planned for Heroku and Amazon S3 for file uploads, but this could be easily modified for a VPS host. 

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

## Services

* Amazon S3
* Heroku
* SendGrid via Heroku Account
* Hoptoad

