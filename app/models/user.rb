class User < ApplicationRecord
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

    validates :email, presence: true, uniqueness: true
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
end
