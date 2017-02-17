class City < ApplicationRecord
  # Direct associations

  has_many   :food_options,
             :dependent => :destroy

  has_many   :boxes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
