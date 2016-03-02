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
5. bundle exec rake db:migrate
6. bundle exec puma
(ctrl-c to stop it)
