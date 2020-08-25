class User < ApplicationRecord
  #Encrypting password
  has_secure_password

  has_and_belongs_to_many :flights

end
