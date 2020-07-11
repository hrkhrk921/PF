class CreateCounsels < ActiveRecord::Migration[5.2]
  def change
    create_table :counsels do |t|
    	t.integer :user_id, null: false
    	t.string :image_id
    	t.string :title, null: false
    	t.text :body, null: false
    	t.boolean :is_settled, default: true, null: false

      t.timestamps
    end
  end
end
