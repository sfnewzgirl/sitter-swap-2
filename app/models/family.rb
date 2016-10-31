class Family < ApplicationRecord
  has_many :family_people
  has_many :people, through: :family_people
end
