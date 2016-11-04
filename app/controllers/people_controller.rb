class PeopleController < ApplicationController
  before_action :set_person, only: [ :edit, :update, :destroy]

  def index
  end

  def show
    @person_family_id = -1
    @family_people = Person.find_by_id(params[:id])
    @person = Person.find_by_id(params[:id])
    if current_person
      person_family = FamilyPerson.select{ |fp| fp.role == "caregivers" && fp.person_id == current_person.id }.first()
      if person_family
        @person_family_id = person_family.family_id
      end
    end
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find_by(params[:id])
  end

  def create
    @person = Person.new(person_params)

      if @person.save
        login(@person)
        flash[:notice] = 'Your profile was successfully created.'
        redirect_to @person
      else
        flash[:notice] = 'Something went wrong. Please try again.'
        redirect_to new_person_path
    end
  end

  def update
    @person = Person.find_by(params[:id])
    if @person.update(person_params)
    redirect_to person_path(@person), notice: 'Your profile was successfully updated.'
    else
      redirect_to edit_person_path
    end
  end

  def destroy
    @person.destroy
    flash[:notice] = 'We are sorry to see you go. Your profile was successfully destroyed.'
    redirect_to root_path
  end

  private

    def set_person
      @person = Person.find_by(params[:id])
    end

    def person_params
      params.require(:person).permit(:first_name, :last_name, :phone_number, :city, :email, :password)
    end

end
