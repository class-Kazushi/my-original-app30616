class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '-----' },
    { id: 2, name: '学業・資格支援' },
    { id: 3, name: '地域イベント' },
    { id: 4, name: '教育' },
    { id: 5, name: '広報・PR活動' },
    { id: 6, name: '個人活動' },
    { id: 7, name: '伝統文化' },
    { id: 8, name: '地元産業' },
    { id: 9, name: 'ボランティア' },
    { id: 10, name: '仕事依頼' },
    { id: 11, name: '環境保全' },
    { id: 12, name: '国際・グローバル' },
    { id: 13, name: '福祉・医療' },
    { id: 14, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :requests
end