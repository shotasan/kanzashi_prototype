class CreateMyBlends < ActiveRecord::Migration[5.2]
  def change
    create_table :my_blends do |t|
      t.string :name      ,null: false, default: "", length: { maximum: 30 }
      t.integer :choice1  ,null: false
      t.integer :choice2  ,null: false
      t.integer :choice3
      t.integer :amount1  ,null: false
      t.integer :amount2  ,null: false
      t.integer :amount3
      t.text :description ,null: false, default: "", length: { maximum: 1000 }
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
