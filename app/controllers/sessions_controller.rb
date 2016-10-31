class SessionsController < ApplicationController

  def new
    @person = Person.new
  end

  def create
    @person = Person.confirm(person_params)
    if @person
      login(@person)
      redirect_to 'people' + @person.id
    else
      redirect_to login_path
    end
  end

  def destroy
    logout(@person)
    redirect_to root_path
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :phone_number, :city, :email, :password)
  end

end
