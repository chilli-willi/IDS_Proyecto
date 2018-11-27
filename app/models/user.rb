class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum premium: { si: 0, solicitado: 1, no: 2 }

  scope :admins, -> {where(admin: 1)}
end
