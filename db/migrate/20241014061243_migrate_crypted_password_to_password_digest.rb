class MigrateCryptedPasswordToPasswordDigest < ActiveRecord::Migration[7.2]
  def up
    User.reset_column_information
    User.find_each do |user|
      if user.crypted_password.present? && user.password_digest.blank?
        user.update_columns(password_digest: user.crypted_password)
      end
    end
  end
end