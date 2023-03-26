class AddUserRefToMessage < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :messages, :users
  end
end
