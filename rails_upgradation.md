# Rail upgradation steps
* https://guides.rubyonrails.org/upgrading_ruby_on_rails.html

* Goto  Gemfile
- change the ruby version to the desired version 
(e.g., ruby '3.1.0' to ruby '3.2' or higher)

```
bundle update
bin/rails test:all
```

* In the same Gemfile
- change the rails version form 7.2.2 to 8.0.2

```
bin/rails app:update
bin/rails test:all
```
### Resolve conflicts
* Make changes in config/development.rb and config/production.rb as per new updation

* Make changes in config/application.rb as necessary
```
```
bin/rubocop
```
