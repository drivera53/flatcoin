class User < ActiveRecord::Base
  has_many :trades

  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email
  has_secure_password

end
