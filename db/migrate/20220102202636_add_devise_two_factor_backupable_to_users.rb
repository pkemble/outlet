class AddDeviseTwoFactorBackupableToUsers < ActiveRecord::Migration[6.1]
  def change
    # Change type from :string to :text if using MySQL database
    add_column :users, :otp_backup_codes, :text, array: true
  end
end
