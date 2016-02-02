require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Harvest < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://api.harvestapp.com',
        authorize_url: '/oauth2/authorize',
        token_url: '/oauth2/token'
      }

      uid { user_info['user']['id'] }

      info { user_info }

      private

      def user_info
        @user_info ||= access_token.get('/account/who_am_i.json').parsed
      end
    end
  end
end
