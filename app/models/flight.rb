class Flight < ApplicationRecord
  belongs_to :airplane, optional: true
  has_and_belongs_to_many :users
end
