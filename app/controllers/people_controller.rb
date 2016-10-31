class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
    @person = Person.find_by_id(:id)
    if !current_person
      redirect_to root_path
    end
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find_by(params[:id])
    @families
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
      format.html { render :edit }
      format.json { render json: @person.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_person
      @person = Person.find_by(params[:id])
    end

    def person_params
      params.require(:person).permit(:first_name, :last_name, :phone_number, :city, :email, :password)
    end
end
