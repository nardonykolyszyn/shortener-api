# frozen_string_literal: true

require 'clients/base_client'

class ShortenerClient < BaseClient

  API_VERSION = 'v1'
  


  def access_token
    @access_token ||= ENV.fetch('ACCESS_TOKEN')
  end

  def shorten_url(long_url)
    response = connection.post
    OpenStruct.new(success?: true, body: response)
  rescue Faraday::ClientError => exception
    OpenStruct.new(success?: false, message: 'Provided data is not correct', details: exception.response[:body].to_s)
  end

  private

  def shorten_endpoint
    '/links'
  end
end
