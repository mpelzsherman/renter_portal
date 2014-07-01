# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#   Account: first_name, last_name, street, city, state
#   Landlord: account_id, email, password, management_company
#   Property: landlord_id, name, street, city, state, zip 
#   Tenant: property_id, account_id, email, password
#
# Tenant Accounts
joe = Account.create(first_name: 'Joe', last_name: 'Tenant', street: '123 Tenant Dr', city: 'Tenantville', state: 'AL', zip: 30093)
lisa = Account.create(first_name: 'Lisa', last_name: 'Tenant', street: '343 Tenant Dr', city: 'Tenantville', state: 'FL', zip: 30093)
jeff = Account.create(first_name: 'Jeff', last_name: 'Tenant', street: '343 Tenant Dr', city: 'Tenantville', state: 'GA', zip: 30093)
lori = Account.create(first_name: 'Lori', last_name: 'Tenant', street: '343 Tenant Dr', city: 'Tenantville', state: 'TN', zip: 30093)

# Landlord Accounts
rob = Account.create(first_name: 'Rob', last_name: 'Landlord', street: '324 Landlord Dr', city: 'Landlordville', state: 'GA', zip: 30093)
becky = Account.create(first_name: 'Becky', last_name: 'Landlord', street: '667 Landlord Dr', city: 'Landlordville', state: 'TN', zip: 30093)

# Landlords
rob_landlord = Landlord.create(account: rob, email: 'rob@test.com', password: 'password', management_company: 'Mgtco One')
becky_landlord = Landlord.create(account: becky, email: 'becky@test.com', password: 'password', management_company: 'Mgtco Two')

#Properties
prop_one = Property.create(landlord: rob_landlord, name: 'Property One', street: '123 Apartment Street', city: 'Dothan', state: 'AL', zip: 30092)
prop_two = Property.create(landlord: rob_landlord, name: 'Property Two', street: '456 Apartment Street', city: 'Birmingham', state: 'AL', zip: 30092)
prop_three = Property.create(landlord: becky_landlord, name: 'Property Three', street: '123 Condo Ave', city: 'Dothan', state: 'AL', zip: 30092)
prop_four = Property.create(landlord: becky_landlord, name: 'Property Four', street: '456 Duplex Drive', city: 'Dothan', state: 'AL', zip: 30092)

# Tenants
Tenant.create(property: prop_one, account: joe, email: 'joe@test.com', password: 'password')
Tenant.create(property: prop_three, account: lisa, email: 'lisa@test.com', password: 'password')
Tenant.create(property: prop_two, account: jeff, email: 'jeff@test.com', password: 'password')
Tenant.create(property: prop_four, account: lori, email: 'lori@test.com', password: 'password')
