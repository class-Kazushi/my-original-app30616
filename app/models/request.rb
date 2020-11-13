class Request < ApplicationRecord
  belongs_to :user
  has_many :applies
  has_one_attached :image

  with_options presence: true do
    validates :title, length: { maximum: 10 }
    validates :category_id, numericality: { other_than: 1 }
    validates :content
    validates :job
    validates :want
    validates :period
    validates :reword
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :people, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999 }
    validates :donation, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9999999 }
    validates :image
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
end
