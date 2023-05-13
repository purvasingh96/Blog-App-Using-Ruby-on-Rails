class User < ApplicationRecord
    
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true, confirmation: true

    validate :tos_aggrement_acceptance
    validate :password_requirements_are_met

    def password
        @password
    end

    def password=(raw)
        @password = raw
        self.password_digest = BCrypt::Password.create(raw)
    end
    
    def is_password?(raw)
        BCrypt::Password.new(password_digest).is_password?(raw)
    end

    def tos_aggrement_acceptance
        errors.add(:terms_of_service,  " must be accepted before registering.") unless @terms_of_service == true
    end

    def password_requirements_are_met
        rules = {
          " must contain at least one lowercase letter"  => /[a-z]+/,
          " must contain at least one uppercase letter"  => /[A-Z]+/,
          " must contain at least one digit"             => /\d+/,
          " must contain at least one special character" => /[^A-Za-z0-9]+/
        }
      
        rules.each do |message, regex|
          errors.add( :password, message ) unless @password.match( regex )
        end
    end
end
