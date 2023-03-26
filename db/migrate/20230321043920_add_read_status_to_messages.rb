class AddReadStatusToMessages < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :read_status, :boolean, default: false, null: false

  end
end
