class AddPublicKeyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :public_key, :text
  end
end
