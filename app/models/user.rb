class User < ActiveRecord::Base
  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
  validates_format_of :email, with: /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/
end
