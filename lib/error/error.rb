module PlanitApp
  module Errors

    def self.included base

      base.error Mongoid::Errors::MongoidError do
        $logger.error env['sinatra.error']
        status 400
        {:error => "document could not be saved"}.to_json
      end

      base.error Mongoid::Errors::DocumentNotFound do
        $logger.error env['sinatra.error']
        status 404
        {:error => "object was not found"}.to_json
      end

      base.error OpenSSL::Cipher::CipherError do
        $logger.error env['sinatra.error']
        status 401
        {:error => "authentication failed"}.to_json
      end

      base.error ::Security::AuthenticationError do
        $logger.error env['sinatra.error']
        status 401
        {:error => "authentication failed"}.to_json
      end

      base.not_found do
        $logger.error env['sinatra.error']
        status 400
        {:error => "API is not implemented"}.to_json
      end

    end

  end
end