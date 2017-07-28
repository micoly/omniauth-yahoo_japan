require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class YahooJapan < OmniAuth::Strategies::OAuth2

      option :name, 'yahoo_japan'
      option :client_options, {
        :site => 'https://auth.login.yahoo.co.jp',
        :authorize_url => '/yconnect/v2/authorization',
        :token_url => '/yconnect/v2/token',
        :auth_scheme => :basic_auth
      }

      option :authorize_options, [:display, :prompt, :scope, :bail]

      uid { raw_info['sub'] }

      info do
        prune!({
          :name       => raw_info['name'],
          :email      => raw_info['email'],
          :first_name => raw_info['given_name'],
          :last_name  => raw_info['family_name'],
        })
      end

      extra do
        hash = {}
        hash[:raw_info] = raw_info unless skip_info?
        prune! hash
      end

      def raw_info
        @raw_info ||= access_token.get('https://userinfo.yahooapis.jp/yconnect/v2/attribute').parsed
      end

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end
    end
  end
end

