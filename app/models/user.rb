class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_and_belongs_to_many :roles
  devise :database_authenticatable, :registerable,
   :recoverable, :rememberable, :trackable, :validatable,
   :authentication_keys => {email: false, login: true}

  attr_accessor :login
  validates :tc, presence: true
  validates :phone, presence: true
  validates :password, presence: true,  on: :create
  validates_uniqueness_of :tc, :email,:phone
  validates :tc, length: { is: 11 }
  validates :phone, length: { is: 11 }
  validates :tc, numericality: true
  validates :phone, numericality: true

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(tc) = :value OR lower(email) = :value OR lower(phone) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_h).first
    end
  end
end
