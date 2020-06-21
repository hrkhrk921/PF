class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
    	t.integer :user_id, null: false
    	t.string :image_id, null: false
    	t.string :title, null: false
    	t.text :body

      t.timestamps
    end
  end
end
