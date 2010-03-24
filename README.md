# Reggie
A Ruby on Rails web application for use in the registration of attendees to small university conferences or symposia. 

## Actions:

+ Simple semi-static pages for event information
+ Receive information from attendees including an abstract via file upload (S3 Storage using Paperclip)
+ Email attendee their registration receipt (using SendGrid addon at Heroku)
+ All registrations receipts are publicly available (URLs slugged with Friendly_ID)
+ All administrative actions (view all/index, edit, delete) require authorization via Authlogic
+ Export all registration data except for attachments into CSV (FasterCSV) formatted file
+ Download all abstracts from S3 via a zip file

## Inactions:

+ Take payment
+ User modifying their registration (modification only by Admin)


## Setup

Put setup info here.

## Hosting

Planned for Heroku and Amazon S3 for file uploads, but this could be easily modified for a VPS. 

## Plugins / Gems / Generators

+ Authlogic
+ FasterCSV
+ Friendly_ID
+ Paperclip
+ Nifty_Generators
+ Hoptoad
+ Heroku
+ Rubyzip
+ Rails-settings

## Services

+ Amazon S3
+ Heroku
+ SendGrid
+ Hoptoad

