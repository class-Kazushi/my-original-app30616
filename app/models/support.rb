class Support < ApplicationRecord
  attr_accessor :token

  belongs_to :user
  belongs_to :request

  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/, message: :invalid_price_num }
    validates :token
  end
end