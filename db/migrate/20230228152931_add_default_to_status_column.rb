class AddDefaultToStatusColumn < ActiveRecord::Migration[7.0]
  def change
    change_column_default :events, :status, from: nil, to: "pending"
  end
end
