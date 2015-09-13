class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  protected
    def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:email, :password]
    devise_parameter_sanitizer.for(:account_update) << [:email, :password]
  end
end
