class ChangeCatsOwnerId < ActiveRecord::Migration[6.1]
  def change
    rename_column :cats, :owner_id, :user_id
  end
end
