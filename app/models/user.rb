class User < ApplicationRecord
    has_many :orders
    has_many :tables, through: :orders

    has_secure_password
    validates :username, presence: true, uniqueness: true, format: { without: /[0-9]/, message: "does not allow numbers" }
    validates_confirmation_of :password, presence: true
    validates :email, presence: true
    validates :employee_type, presence: true

    scope :get_managers, -> { where("employee_type = 'manager'") }

    def is_unique?
        User.find_by_username(params[:username]) == nil
    end
    
    def self.from_omniauth(auth)
      where(email: auth.info.email).first_or_initialize do |user|
        user.username = auth.info.name
        user.email = auth.info.email
        user.password = SecureRandom.hex
        if User.where("employee_type = 'manager'").empty?
          user.employee_type = "manager"
        end
      end
  end
end
