class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :body
      t.string :book_image
      t.string :user_id
      t.timestamps
    end
  end
end
