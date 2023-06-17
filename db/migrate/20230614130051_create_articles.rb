class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :slug, null: false, unique: true
      t.string :title, null: false, unique: true
      t.text :description, null: false
      t.text :body, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
    add_foreign_key :articles, :users, column: :author_id
  end
end
