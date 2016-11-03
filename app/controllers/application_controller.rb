class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def login(person)
    session[:id] = person.id
    @current_person = person
  end

  def current_person
    @current_person ||= Person.find_by_id(session[:id])
  end

  helper_method :current_person

  def logout
    @current_person = session[:id] = nil
  end

end
