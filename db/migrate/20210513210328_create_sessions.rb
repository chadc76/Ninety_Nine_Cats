class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.integer :user_sessions_table_id, null: false
      t.string :session, null: false

      t.timestamps
    end
    
    add_index :sessions, :user_sessions_table_id
    add_index :sessions, :session, unique: true
  end
end
