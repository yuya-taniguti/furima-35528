class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday_year
    validates :password,     format: { with: /\A[a-zA-Z0-9]+\z/ }

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
      validates :first_name
      validates :last_name
    end

    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :first_name_k
      validates :last_name_k
    end
  end
end
