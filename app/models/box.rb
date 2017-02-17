class Box < ApplicationRecord
  # Direct associations

  belongs_to :city,
             :counter_cache => true

  has_many   :comments,
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  # Indirect associations

  has_many   :visits,
             :through => :bookmarks,
             :source => :user

  # Validations

end
