require "omniauth/youyu/configuration"

module OmniAuth
  module Strategies
    class Youyu < OmniAuth::Strategies::OAuth2
      option :name, :doorkeeper

      option :client_options, {
          :site            => "http://passport.youyu.im",
          :authorize_path  => "/oauth/authorize",
          :token_url       => "/oauth/access_token",
      }

      info do
        {
          :email => raw_info["email"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/me.json').parsed || {}
      end
    end
  end
end
