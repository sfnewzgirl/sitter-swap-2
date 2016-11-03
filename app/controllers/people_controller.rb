class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    family_id = Family.find_by_id(params[:id])
    @family_people = Person.find_by(params[:family_id])
    @person = Person.find_by(params[:id])
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



  # def new_sitter
  #   current_person = Person.find_by_id(:id)
  #   @sitter = Person.new
  # end
  #
  # def create_sitter
  #   @sitter = Person.new(person_params)
  #   if @sitter.save
  #     flash[:notice] = 'Your profile was successfully created.'
  #     redirect_to person_path(current_person)
  #   else
  #     flash[:notice] = 'Something went wrong. Please try again.'
  #     redirect_to person_path(current_person)
  #   end
  # end

  private

    def set_person
      @person = Person.find_by(params[:id])
    end

    def person_params
      params.require(:person).permit(:first_name, :last_name, :phone_number, :city, :email, :password)
    end

    # def sitter_person_params
    #   params.require(:person).permit(:first_name, :last_name, :phone_number, :city, :email)
    # end
end
