require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Youyu < OmniAuth::Strategies::OAuth2
      option :name, :youyu

      option :client_options, {
          :site            => "http://passport.youyu.im",
          :authorize_path  => "/oauth/authorize",
          :token_url       => "/oauth/token",
      }

      info do
        {
          :email => (raw_info["email"] if raw_info),
          :name => (raw_info["name"] if raw_info)
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed
      end
    end
  end
end
