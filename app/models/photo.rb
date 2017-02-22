class Photo < ApplicationRecord
  # Direct associations

  belongs_to :food_option

  belongs_to :box

  # Indirect associations

  # Validations

end
