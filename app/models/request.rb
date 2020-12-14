class Request < ApplicationRecord
  belongs_to :user
  has_many :applies
  has_many :supports
  has_one_attached :image

  with_options presence: true do
    validates :title, length: { maximum: 10 }
    validates :image
    validates :category_id, numericality: { other_than: 1, message: :invalid_id }
    validates :content
    validates :job
    validates :want
    validates :prefecture_id, numericality: { other_than: 0, message: :invalid_id }
    validates :city
    validates :reword
    validates :period
    validates :people, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 999 }
    validates :donation, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 9999999 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :category
end
