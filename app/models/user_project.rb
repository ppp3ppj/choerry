class UserProject < ApplicationRecord
  # UserProject is eq members
  belongs_to :user
  belongs_to :project
end
