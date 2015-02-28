class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :remembrances, :inverse_of => :user
  validates_uniqueness_of :email, :case_sensitive => false

  def self.build(email, password)
    user = User.new
    user.email = email
    user.password = password

    # Cheat the date here so it shows up as user's first remembrance.
    howto_remembrance = Remembrance.from_linked_item(LinkedItem.howto_item,
                                                     user,
                                                     cheat_date: true)

    user.save
    user
  end

  def self.find_by_email_insensitive(email)
    nil if email.nil?

    User.where('lower(email) = ?', email.downcase).first
  end

  DEFAULT_SETTINGS = {
    'notifications' => false
  }

  def settings_with_defaults
    DEFAULT_SETTINGS.merge(self.settings).merge({'email' => self.email})
  end
end
