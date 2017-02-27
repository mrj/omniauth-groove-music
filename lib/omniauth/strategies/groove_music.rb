require 'uri'
require 'rack/utils'
require 'active_support'
require 'time'
require 'omniauth/strategies/oauth2'

# https://docs.microsoft.com/en-us/groove/api-overview

module OmniAuth
  module Strategies
    class GrooveMusic < OmniAuth::Strategies::OAuth2
      # Scopes and permissions => https://docs.microsoft.com/en-us/groove/using-the-groove-restful-services/user-authentication-on-the-web
      DEFAULT_SCOPE = 'MicrosoftMediaServices.GrooveApiAccess'

      option :client_options, {
        site:          'https://login.live.com',
        authorize_url: '/oauth20_authorize.srf',
        token_url:     '/oauth20_token.srf'
      }

      option :authorize_params, {
        response_type: 'code'
      }

      option :name, 'groove_music'

      # https://docs.microsoft.com/en-us/groove/groove-service-rest-reference/json-userprofileresponse
      info do
        {
          'subscription_available?'  => raw_info['IsSubscriptionAvailableForPurchase'],
          'subscription_type'        => raw_info['HasSubscription'] ? raw_info['Subscription']['Type'].downcase.to_sym : :none,
          'subscription_region_code' => raw_info['HasSubscription'] ? raw_info['Subscription']['Region'] : nil,
          'subscription_end_time'    => raw_info['HasSubscription'] ? Time.iso8601(raw_info['Subscription']['EndDate']) : nil,
          'culture'                  => raw_info['Culture']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      # https://docs.microsoft.com/en-us/groove/groove-service-rest-reference/overview
      def raw_info
        @raw_info ||= begin
          request = 'https://music.xboxlive.com/1/user/music/profile'
          MultiJson.decode(access_token.get(request).body)
        end
      end

    end
  end
end
