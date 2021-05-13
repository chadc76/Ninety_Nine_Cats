class ChangeColumnOnUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :session_token
    add_column :users, :user_sessions_id, :integer
    add_index :users, :user_sessions_id, unique: true
  end
end
