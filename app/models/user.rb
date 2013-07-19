class User < ActiveRecord::Base
  has_many :chocolatiers, :dependent => :destroy
  has_many :ratings , :dependent => :destroy
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :uid, :provider ,:admin, :photo , :user_name ,:fb_photo
  mount_uploader :photo , ImageUploader
  # attr_accessible :title, :body
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           password:Devise.friendly_token[0,20],
                           user_name:auth.info.name,
                           fb_photo:auth.info.image,
                           admin:0

        )
      end

    end
  end
end
