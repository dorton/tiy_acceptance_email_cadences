class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cohorts, through: :user_cohorts
  has_many :user_cohorts, dependent: :destroy
  belongs_to :city

  def name
    "#{first_name} #{last_name}"
  end

end
