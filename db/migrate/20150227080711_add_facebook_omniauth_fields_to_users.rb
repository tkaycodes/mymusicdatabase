class AddFacebookOmniauthFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_credentials_token, :string
    add_column :users, :facebook_credentials_expires_at, :datetime
  end
end
