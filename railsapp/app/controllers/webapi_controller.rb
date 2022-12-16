# frozen_string_literal: true
require 'yaml'

class WebapiController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    p env['rack.input'].read.bytesize.to_s
    p request.headers['CONTENT_LENGTH']
    p request.headers['TRANSFER_ENCODING']
    p request.body
    p request.raw_post
    p params
    p '------------------------'
    puts request.env.to_h.transform_values(&:inspect).to_a.sort_by(&:first).to_h.to_yaml
    p '------------------------'

    head :ok
  end
end
