set :rails_env, "development"

server "renterportal-web-01.ci.nor.primedia.com", :app, :web, :db, :primary => true
