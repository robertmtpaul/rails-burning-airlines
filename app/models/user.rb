class User < ApplicationRecord
  #Encrypting password
  has_secure_password

  has_many :reservations

end
