class CreateCounselComments < ActiveRecord::Migration[5.2]
  def change
    create_table :counsel_comments do |t|
    	t.references :user, foreign_key: true
    	t.references :counsel, foreign_key: true
    	t.string :comment

      t.timestamps
    end
  end
end
