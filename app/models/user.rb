class User < ActiveRecord::Base 
  has_secure_password validations: false
  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length:{minimum: 7}
end 