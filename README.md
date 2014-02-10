# Omniauth::Youyu

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-youyu'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-youyu

## Usage

for devise:

1. Apply your app id&secret key from youyu.im

2. Update initializers/devise.rb

        require 'omniauth-youyu'

        config.omniauth :youyu,  ENV['YOUYU_AUTH_ID'], ENV['YOUYU_AUTH_SECRET'], :strategy_class => OmniAuth::Strategies::Youyu, :client_options =>  {:site => ENV['YOUYU_AUTH_URL']}

3. create your own OmniauthCallbackController, then update routes file.

    eg:

        class Cimu::OmniauthCallbacksController < Devise::OmniauthCallbacksController

          def youyu

            oauth_data = request.env["omniauth.auth"]

            @account = Account.find_or_create_for_youyu_oauth(oauth_data)

            @account.update_youyu_credentials(oauth_data)

            sign_in_and_redirect @account

          end

          def passthru

           render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false

          end

        end

        devise_for :accounts, :controllers => {:omniauth_callbacks => "Cimu::OmniauthCallbacks"}

4. add youyu_access_token to your account model, and update youyu_access_token after auth

        def self.find_or_create_for_youyu_oauth(oauth_data)

          Account.find_or_initialize_by_youyu_email(oauth_data.info.email).tap do |account|

            account.email = oauth_data.info.email

          end

        end

        def self.find_or_initialize_by_youyu_email(email)

          account = Account.where(:email => email).first

          account ||= Account.new

        end

        def update_youyu_credentials(oauth_data)

          self.youyu_access_token = oauth_data.credentials.token

        end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
