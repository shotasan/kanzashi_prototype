class CreateBeans < ActiveRecord::Migration[5.2]
  def change
    create_table :beans do |t|
      t.string :name,        null: false, default: ''
      t.string :country,     null: false, default: ''
      t.string :plantation,  null: false, default: ''
      t.string :roasted,     null: false, default: ''
      t.string :grind,       null: false, default: ''
      t.string :icon,        null: false, default: ''
      t.string :store,       null: false, default: ''
      t.integer :price,      null: false, default: 0
      t.date :purchase_date, null: false, default: ''
      t.text :description,   null: false, default: '', length: { maximum: 1000 }
      t.references :user,foreign_key: true

      t.timestamps
    end
  end
end
