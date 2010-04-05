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

If you want to use hoptoad, then create and complete the following:

* config/initializers/hoptoad.rb

    HoptoadNotifier.configure do |config|
      config.api_key = 'YOURHOPTOADAPIKEY'
    end
    

Step 2. 

For Heroku, make a .gems manifest file as FasterCSV and 



## Hosting

Planned for Heroku and Amazon S3 for file uploads, but this could be easily modified for a VPS host. 

## Plugins / Gems / Generators

* Authlogic
* FasterCSV
* Friendly_ID
* Paperclip
* Nifty_Generators
* Hoptoad
* Heroku
* Rubyzip
* Rails-settings

## Services

* Amazon S3
* Heroku
* SendGrid
* Hoptoad

