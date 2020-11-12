class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :title,          null: false
      t.references :user,       foreign_key: true
      t.integer :category_id,   null: false
      t.text :content,          null: false
      t.string :url
      t.text :job,              null: false
      t.text :want,             null: false
      t.date :period,           null: false
      t.text :reword,           null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.integer :people,        null: false
      t.integer :donation,      null: false
      t.timestamps
    end
  end
end
