class CreatePostText < ActiveRecord::Migration[7.0]
  def change
    create_table :post_texts do |t|
      t.text :content
      t.timestamps
    end
  end
end
