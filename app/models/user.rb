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

    def managerbydefault?
        User.where("employee_type = 'manager'").empty?
    end
    
    def self.from_omniauth(auth)
      where(email: auth.info.email).first_or_initialize do |user|
        user.username = auth.info.name
        user.email = auth.info.email
        user.password = SecureRandom.hex
        if managerbydefault?
          user.employee_type = "manager"
        end
      end
  end
end
