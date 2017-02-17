class City < ApplicationRecord
  # Direct associations

  has_many   :boxes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
