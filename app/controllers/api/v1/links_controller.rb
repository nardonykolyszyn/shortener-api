# frozen_string_literal: true

module Api
  module V1
    class LinksController < ApplicationController
      skip_before_action :verify_authenticity_token
      
      def shorten
        long_url = params[:long_url]
        if long_url.present?
          response = connection.shorten(long_url)
          response = { response: response, status: :ok }
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