class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create :cart_create

   def cart_create
     Cart.create(user_id: self.id)
   end

  has_one :cart, dependent: :destroy
  has_many :orders, through: :cart, dependent: :destroy

  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "L'email doit être renseigné au bon format (email@eamil.email) !"},
            uniqueness: {message: "Email déjà utilisé"}
end
