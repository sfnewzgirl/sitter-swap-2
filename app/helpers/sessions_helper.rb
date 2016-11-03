module SessionsHelper

  def login(person)
    session[:id] = person.id
    @current_person = person
    puts 'SESSION-HELPER-ID', person.id
  end

  def current_person
    puts 'SESSION-HELPER-CURRENT-PERSON'
    @current_person ||= Person.find_by_id(session[:id])
  end

  def logout
    @current_person = session[:id] = nil
  end

end
