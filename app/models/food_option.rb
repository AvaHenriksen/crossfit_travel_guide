class FoodOption < ApplicationRecord
  # Direct associations

  belongs_to :city,
             :counter_cache => true

  # Indirect associations

  # Validations

end
