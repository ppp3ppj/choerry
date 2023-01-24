# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Test Testing' do
  describe 'eq' do
    it '45+9' do
      expect(45 + 9).to eq(54)
    end
  end
end
