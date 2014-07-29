Renter Portal
=============

Portral for connecting tenants to their property management company and their community.

Potential features:

1. Pay Rent Online
2. Submit Maintenance requests
3. Comunity Bulletin Board 

Getting Started
===============
- install postgres (e.g. brew install postgresql)
- `bundle install`
- `cp config/database.yml.example config/database.yml`
- modify `config/database.yml` as needed
- `rake db:create`
- `rake db:migrate`
- `rake db:seed`
 
Start with `rails s`.
 
Workflow
=========
  - commit to dev, deploy from master


Deployment
============
- `ssh bot`
- `sudo su - deploy`
- `cd source/renter_portal`
- `cap ci deploy:full`

CI server is http://renterportal-web-01.ci.nor.primedia.com/

There is no QA or Production server at this time.


Stories
=======
- pivotal project: https://www.pivotaltracker.com/n/projects/1104508
 