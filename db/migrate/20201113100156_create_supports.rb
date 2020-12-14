class CreateSupports < ActiveRecord::Migration[6.0]
  def change
    create_table :supports do |t|
      t.string :price,      null: false
      t.references :user,    foreign_key: true
      t.references :request, foreign_key: true
      t.timestamps
    end
  end
end
