class CreateApplies < ActiveRecord::Migration[6.0]
  def change
    create_table :applies do |t|
      t.string :phone_num
      t.text :reason,        null: false
      t.text :question
      t.references :user,    foreign_key: true
      t.references :request, foreign_key: true
      t.timestamps
    end
  end
end
