class FoodOption < ApplicationRecord
  # Direct associations

  has_many   :comments,
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  belongs_to :city,
             :counter_cache => true

  # Indirect associations

  has_many   :visits,
             :through => :bookmarks,
             :source => :user

  # Validations

end
