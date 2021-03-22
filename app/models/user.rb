class User < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_presence_of :first_name, :last_name, :email, :password
  has_secure_password

  def slug
    first_name.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|user| user.slug == slug}
  end

end
