class ChangeSessionColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :session_tokens, :session, :token
  end
end
