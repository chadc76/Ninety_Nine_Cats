class RenameTables < ActiveRecord::Migration[6.1]
  def up
    rename_table :sessions, :session_tokens
    remove_index :user_sessions, :user_id
    add_index :user_sessions, :user_id, unique: true
  end

  def down
    rename_table :session_tokens, :sessions
    remove_index :user_sessions, :user_id, unique: true
    add_index :user_sessions, :user_id
  end

end
