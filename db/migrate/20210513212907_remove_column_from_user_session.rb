class RemoveColumnFromUserSession < ActiveRecord::Migration[6.1]
  def change
    remove_column :user_sessions, :session_id
  end
end
