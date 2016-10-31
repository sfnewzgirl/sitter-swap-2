module SessionsHelper

  def login(person)
    session[:id] = person.id
    @current_person = person
  end

  def current_person
    @current_person ||= Person.find_by_id(session[:id])
  end

  def logout
    @current_person = session[:id] = nil
  end
  
end
