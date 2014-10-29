class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :remembrances, :inverse_of => :user
end
