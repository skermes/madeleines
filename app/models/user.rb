class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :remembrances, :inverse_of => :user
  validates_uniqueness_of :email, :case_sensitive => false

  def self.build(email, password)
    user = User.new
    user.email = email
    user.password = password
    user.api_key = ApiKey.build

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
    'notifications' => 'none',
    'twitter' => nil
  }

  def settings_with_defaults
    user_settings = self.settings || {}
    non_json_settings = {
      'email' => self.email,
      'api_key' => self.api_key
    }
    DEFAULT_SETTINGS.merge(user_settings).merge(non_json_settings)
  end

  def to_s
    "#{id}:#{email}"
  end
end
