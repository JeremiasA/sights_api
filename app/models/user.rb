class User < ApplicationRecord
    validates :email, :password, presence: true
    validates_format_of :email, with: /@/
    validates :email, uniqueness: true
    has_secure_password
end
