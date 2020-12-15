class Support < ApplicationRecord
  attr_accessor :token

  belongs_to :user
  belongs_to :request

  with_options presence: true do
    validates :price, numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 999999 }
    validates :token
  end
end