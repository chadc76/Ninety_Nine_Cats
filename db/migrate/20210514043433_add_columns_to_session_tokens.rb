class AddColumnsToSessionTokens < ActiveRecord::Migration[6.1]
  def change
    add_column :session_tokens, :env, :string
    add_column :session_tokens, :location, :string
  end
end
