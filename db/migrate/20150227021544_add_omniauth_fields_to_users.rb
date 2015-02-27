class AddOmniauthFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :twitter_credentials_token, :string
    add_column :users, :twitter_credentials_secret, :string
    add_column :users, :omniauth_raw_data, :text

    add_index :users, [:provider, :uid]

    remove_index :users, :email
    add_index :users, :email
  end
end
