class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :requests
  has_many :applies
  has_one :support

  with_options presence: true do
    validates :nickname
    EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
    PASSWORD_REGEX = /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/.freeze
    validates :password, length: { minimum: 8 }, format: { with: PASSWORD_REGEX }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :family_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :gender_id, numericality: { other_than: 1 }
    validates :age, numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 99 }
    validates :occupation_id, numericality: { other_than: 1 }
    validates :ability
    validates :introduction
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
  belongs_to :occupation

end
