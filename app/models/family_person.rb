class FamilyPerson < ApplicationRecord
  belongs_to :family
  belongs_to :person

  enum role: ["caregivers", "children", "sitters", "friends"]
end
