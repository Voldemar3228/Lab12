class User < ApplicationRecord


  def self.new_remember_user_id
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(user_id)
    Digest::SHA1.hexdigest(user_id.to_s)
  end

  private

  def create_remember_user_id
    self.remember_user_id = User.encrypt(User.new_remember_user_id)
  end
end
