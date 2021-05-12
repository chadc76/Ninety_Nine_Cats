class ChangeCatRentalRequstsStatus < ActiveRecord::Migration[6.1]
  def up
    change_table :cat_rental_requests do |t|
      t.change :status, :string, default: nil, null: false
    end
  end

  def down
    change_table :cat_rental_requests do |t|
      t.change :status, :string, default: "pending"
    end
  end
end
