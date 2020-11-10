class Occupation < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '会社員' },
    { id: 3, name: '大学・専門学生' },
    { id: 4, name: '高校生' },
    { id: 5, name: '専業主婦（夫）' },
    { id: 6, name: '公務員' },
    { id: 7, name: '自営業' },
    { id: 8, name: 'アルバイト・パート' },
    { id: 9, name: 'フリーランス' },
    { id: 10, name: '無職' }
  ]
  include ActiveHash::Associations
  has_many :users

end