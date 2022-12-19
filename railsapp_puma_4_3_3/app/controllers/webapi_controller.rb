# frozen_string_literal: true
require 'yaml'

class WebapiController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    p "rack.input: #{request.env['rack.input'].read}"
    request.env['rack.input'].rewind
    p "request.headers['CONTENT_LENGTH']: #{request.headers['CONTENT_LENGTH']}"
    p "request.body: #{request.body}"
    request.body.rewind
    p "request.body: #{request.content_length}"
    p "request.raw_post: #{request.raw_post}"

    head :ok
  end
end
