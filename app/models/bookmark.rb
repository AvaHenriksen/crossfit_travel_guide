class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :box,
             :counter_cache => true

  belongs_to :user

  # Indirect associations

  # Validations

end
