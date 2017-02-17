class Comment < ApplicationRecord
  # Direct associations

  belongs_to :box

  belongs_to :user

  # Indirect associations

  # Validations

end
