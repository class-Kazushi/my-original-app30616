class Apply < ApplicationRecord

  belongs_to :user
  belongs_to :request

  validates :reason, presence: true
  
end
