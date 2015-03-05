class ApiKey
  def self.build
    SecureRandom.uuid
  end
end
