class CreateFavoriteBeans < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_beans do |t|
      t.references :user, foreign_key: true
      t.references :bean, foreign_key: true

      t.timestamps
    end
  end
end
