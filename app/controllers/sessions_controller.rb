class SessionsController < ApplicationController
  before_action :set_person

  def new
    @person = Person.new
  end

  def create
    @person = Person.confirm(person_params)
    if @person
      login(@person)
      flash[:notice] = "Successfully logged in."
      redirect_to '/people/' + @person.id.to_s
    else
      flash[:error] = "User Name and Password do not match."
      redirect_to login_path
    end
  end

  def destroy
    logout(@person)
    redirect_to root_path
  end

  private
  def set_person
    @person = Person.find_by(params[:id])
  end

  def person_params
    params.require(:person).permit(:email, :password)
  end

end
