class MigratePasswordDigestToCryptedPassword < ActiveRecord::Migration[7.2]
  def up
    User.reset_column_information
    User.find_each do |user|
      if user.password_digest.present? && user.crypted_password.blank?
        user.update_columns(crypted_password: user.password_digest)
      end
    end
  end

end
