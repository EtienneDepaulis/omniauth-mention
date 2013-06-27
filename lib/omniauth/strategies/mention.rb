require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Mention < OmniAuth::Strategies::OAuth2
      option :name, "mention"

      option :client_options, {
        :site => 'https://web.mention.net/',
        :authorize_url => 'https://web.mention.net/authorize',
        :token_url => 'https://web.mention.net/oauth/v2/token'
      }

      uid{ raw_info['account']['id'] }

      info do
        {
          :name => raw_info['account']['name'],
          :email => raw_info['account']['email']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        links = access_token.get('/api/accounts/me.json').parsed
        
        @raw_info ||= access_token.get("#{links['_links']['me']['href']}.json").parsed
      end
    end
  end
end