# frozen_string_literal: true

module Api
  module V1
    class LinksController < ApplicationController
      skip_before_action :verify_authenticity_token

      def index
        @links = Link.all.limit(100)
        render json: { links: @links, status: :ok }
      end
      
      def shorten
        long_url = params[:long_url]
        if long_url.present?
          json_response = connection.shorten(long_url)
          Link.new(response: json_response).save
          response = { response: json_response, status: :ok }
        else
          response = { response: 'missing long_url param', status: :unprocessable_entity }
        end
        render json: response
      end

      private

      def connection
        @client ||= Rebrandly::Api.new
      end
    end
  end
end