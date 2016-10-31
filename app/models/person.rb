class Person < ApplicationRecord
  has_secure_password
  has_many :family_people
  has_many :families, through: :family_people

  def self.confirm params
    @person = Person.find_by({email: params[:email]})
    @person ? @person.authenticate(params[:password]) : false
  end
end
