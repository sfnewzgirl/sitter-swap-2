class FamilyPerson < ApplicationRecord
  belongs_to :family
  belongs_to :person
end
