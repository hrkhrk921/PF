class AddParentToCounselComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :counsel_comments, :parent, foreign_key: { to_table: :counsel_comments }
  end
end
