class CreateFavoriteBlends < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_blends do |t|
      t.references :user, foreign_key: true
      t.references :my_blend, foreign_key: true

      t.timestamps
    end
  end
end
