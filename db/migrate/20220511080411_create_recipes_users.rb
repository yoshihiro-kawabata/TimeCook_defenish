class CreateRecipesUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes_users do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
