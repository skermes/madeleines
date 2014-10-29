class AddUserIdToRemembrances < ActiveRecord::Migration
  def change
    add_column :remembrances, :user_id, :integer
  end
end
