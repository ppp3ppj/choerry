# frozen_string_literal: true

class Api::V1::AppController < Api::AppController
  skip_before_action :verify_authenticity_token
  before_action :set_current_user_from_jwt
  before_action :authenticate_user!
end
