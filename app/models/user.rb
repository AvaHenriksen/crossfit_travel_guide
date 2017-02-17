class User < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :saved_food_options,
             :through => :bookmarks,
             :source => :food_option

  has_many   :saved_boxes,
             :through => :bookmarks,
             :source => :box

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
