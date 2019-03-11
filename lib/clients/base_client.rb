# frozen_string_literal: true

require 'faraday/request_id'

class BaseClient
  def service_url
    raise NotImplementedError
  end

  private

  def connection
    @connection ||= Faraday.new("https://api.rebrandly.com/v1/links?apikey=2e93bb9a25fe40ee8f83c989a85ef1a5") do |builder|
      builder.request :json
      builder.response :raise_error
      builder.response :json, content_type: /\bjson$/
      builder.use :instrumentation
      builder.options[:timeout] = 10
      builder.options[:open_timeout] = 10
      builder.use Faraday::RequestId
      builder.adapter Faraday.default_adapter
    end
  end

  def process_response(response)
    if response.success?
      body = response.body
      if body.blank?
        {}
      elsif body.is_a?(Array)
        body.map(&:deep_symbolize_keys)
      else
        body.deep_symbolize_keys
      end
    end
  end
end
