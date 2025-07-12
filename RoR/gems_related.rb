In development env mails are restricted. Below are the steps to configure letter_opener gem:

1) In Gemfile add gem ‘letter_opener’ and save.
2)bundle install
3)go to config/environments/development.rb add below lines and save
  config.action_mailer.delivery_method = :letter_opener
  config.action_mailer.perform_deliveries = true
4)Restart the server
5)Navigate the pages and do the operations where the mails can be generated.
6)Mail will be triggered automatically and opens in our browser.
