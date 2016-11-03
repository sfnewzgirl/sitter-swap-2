class SessionsController < ApplicationController

  def new
    @person = Person.new
  end

  def create
    @person = Person.confirm(person_params)
    if @person
      login(@person)
      flash[:notice] = "Successfully logged in."
      redirect_to @person
    else
      flash[:error] = "User Name and Password do not match."
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:notice] = "Successfully logged out."
    redirect_to root_path
  end

  def person_params
    params.require(:person).permit(:email, :password)
  end

end
