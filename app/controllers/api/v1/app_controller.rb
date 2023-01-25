# frozen_string_literal: true

class Api::V1::AppController < Api::AppController
  skip_before_action :verify_authenticity_token
end
