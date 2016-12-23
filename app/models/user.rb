class User < ActiveRecord::Base
 
  include BCrypt

  validates :name, :email, presence: true, uniqueness: true
  validates :password, presence: true

   def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  # ej. User.authenticate('fernando@codea.mx', 'qwerty')
  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end

end
