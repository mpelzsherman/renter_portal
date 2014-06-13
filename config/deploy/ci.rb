set :rails_env, "ci"

role :app,    "renterportal-web-01.ci.nor.primedia.com"
role :web,    "renterportal-web-01.ci.nor.primedia.com", :primary => true
role :db,     "renterportal-web-01.ci.nor.primedia.com", :primary => true, :no_release => true
