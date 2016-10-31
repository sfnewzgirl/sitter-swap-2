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
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Your profile was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @person = Person.find_by(params[:id])
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
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
