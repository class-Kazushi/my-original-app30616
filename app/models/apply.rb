class Apply < ApplicationRecord

  belongs_to :user
  belongs_to :request

  validates :reason, presence: true
  validates :phone_num, format: { with: /\A\d{10}$|^\d{11}\z/ }, allow_blank: true
  validates :user_id, uniqueness: { scope: :request_id }
end
