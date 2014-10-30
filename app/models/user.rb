class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :remembrances, :inverse_of => :user

  def self.find_by_email_insensitive(email)
    nil if email.nil?

    User.where('lower(email) = ?', email.downcase).first
  end
end
