class User < ApplicationRecord
    has_many :tables
    has_many :orders, through: :tables
    has_secure_password
    validates_confirmation_of :username, uniqueness: true, format: { without: /[0-9]/, message: "does not allow numbers" }
    validates_confirmation_of :password, presence: true
    validates :email, presence: true

    def is_unique?
        User.find_by_username(params[:username]) == nil
    end
end
