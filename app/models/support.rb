class Support < ApplicationRecord
  attr_accessor :token

  belongs_to :user
  belongs_to :request

  validates :price, presence: true
  validates :token, presence: true
end
