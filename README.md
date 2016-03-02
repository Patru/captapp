# A Template for my Cuba Projects
I very quickly started to like the way Cuba does routing, so I want to run some projects with it. In order to avoid
reinventing the wheel constantly I put the jumble of things I chose to fit my needs in one place.
## How to use it
1. clone it
  check out [http://stackoverflow.com/questions/160608/do-a-git-export-like-svn-export] to know how
2. change it
3. create your github project for it
4. commit it

## how to run it
1. rvm (or the like)
2. rvm install 2.2.3
3. rvm use 2.2.3
4. bundle
5. rm db/*.db
6. bundle exec rake db:migrate
7. bundle exec puma
8. surf to the URL http://localhost:9234/admin/new
9. give email, name and password with digits and lower case and upper case (TODO: error handling currently not ideal)
10.  bundle exec sequel sqlite://db/development.db (TODO: only now, should not be needed any more when finished, email not configured)
10a  > require './models/admin.rb'
10b  > Admin.last.login_path 
11. prepend the output path with http://localhost:9234 in the browser
12. login with the password that you defined in step #9

(ctrl-c to stop it)


## how to run the tests
1. like above up to 4. (bundle)
2. RACK_ENV=test bundle exec rake db:migrate  (or:  (export RACK_ENV=test ; bundle exec rake db:migrate) )
3. bundle exec rake
