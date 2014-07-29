Renter Portal
=============

Portral for connecting tenants to their property management company and their community.

Potential feature:

1. Pay Rent Online
2. Submit Maintenance requests
3. Comunity Bulletin Board 

Getting Started
===============
  - install postgres (e.g. brew install postgresql)
  - 
  - `bundle install`
  - `cp config/database.yml.example config/database.yml`
  - modify `config/database.yml` as needed
  - `rake db:create`
  - `rake db:migrate`
 
 Start with `rails s`.
 
Workflow
=========
  - commit to dev, deploy from master


Deployment
============
- ssh bot
- sudo su - deploy
- cap ci deply:full

CI server is http://renterportal-web-01.ci.nor.primedia.com/


Stories
=======
- pivotal project: https://www.pivotaltracker.com/n/projects/1104508
 