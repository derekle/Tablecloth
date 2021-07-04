class User < ApplicationRecord
    has_many :orders
    has_many :tables, through: :orders

    has_secure_password
    validates :username, presence: true, uniqueness: true, format: { without: /[0-9]/, message: "does not allow numbers" }
    validates_confirmation_of :password, presence: true
    validates :email, uniqueness: true, presence: true
    validates :employee_type, presence: true

    scope :get_managers, -> { where("employee_type = 'manager'") }
    scope :get_cooks, -> { where("employee_type = 'cooks'") }
    scope :get_waitstaff, -> { where("employee_type = 'waitstaff'") }
    scope :get_bussers, -> { where("employee_type = 'bussers'") }
    scope :get_bartenders, -> { where("employee_type = 'bartenders'") }
    scope :get_hosts, -> { where("employee_type = 'hosts'") }
    scope :get_needsrole, -> { where("employee_type = 'needs role'") }
   
    def self.from_omniauth(auth)
      where(email: auth.info.email).first_or_initialize do |user|
        user.username = auth.info.name
        user.email = auth.info.email
        user.password = SecureRandom.hex
        if User.where("employee_type = 'manager'").empty?
          user.employee_type = "manager"
        else
          user.employee_type = "needs role"
        end
      end
  end
end
