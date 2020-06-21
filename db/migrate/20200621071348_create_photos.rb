class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
    	t.integer :user_id
    	t.string :image_id
    	t.string :title
    	t.text :body

      t.timestamps
    end
  end
end
