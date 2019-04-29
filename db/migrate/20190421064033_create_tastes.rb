class CreateTastes < ActiveRecord::Migration[5.2]
  def change
    create_table :tastes do |t|
      t.text :impression, null: false, default: "", length: { maximum: 1000 }
      t.integer :bitter,  null: false
      t.integer :acidity, null: false
      t.integer :rich,    null: false
      t.integer :sweet,   null: false
      t.integer :aroma,   null: false
      t.references :tasteable, polymorphic: true, index: true


      t.timestamps
    end
  end
end
