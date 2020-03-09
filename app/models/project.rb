class Project < ApplicationRecord
  has_many :issues,dependent: :destroy
  has_one :user
end
