class FamilyPeopleController < ApplicationController
  before_action :set_person, only: [:new, :show, :edit, :update, :destroy]

  # GET /family_people
  # GET /family_people.json
  def index
    @family_people = FamilyPerson.all
  end

  # GET /family_people/1
  # GET /family_people/1.json
  def show
  end

  # GET /family_people/new
  def new
    @family_person = FamilyPerson.new
  end

  # GET /family_people/1/edit
  def edit
  end

  # POST /family_people
  # POST /family_people.json
  def create
    @family_person = FamilyPerson.new(family_person_params)

    respond_to do |format|
      if @family_person.save
        format.html { redirect_to @family_person, notice: 'Family person was successfully created.' }
        format.json { render :show, status: :created, location: @family_person }
      else
        format.html { render :new }
        format.json { render json: @family_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /family_people/1
  # PATCH/PUT /family_people/1.json
  def update
    respond_to do |format|
      if @family_person.update(family_person_params)
        format.html { redirect_to @family_person, notice: 'Family person was successfully updated.' }
        format.json { render :show, status: :ok, location: @family_person }
      else
        format.html { render :edit }
        format.json { render json: @family_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family_people/1
  # DELETE /family_people/1.json
  def destroy
    @family_person.destroy
    respond_to do |format|
      format.html { redirect_to family_people_url, notice: 'Family person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    @q = "%#{params[:query]}%"
    @user_input = @q
    @results = Family.all.select{|fam| fam.family_name == @user_input}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_person
      @family_person = FamilyPerson.find(params[:id])
    end

    def set_person
      @person = Person.find_by(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_person_params
      params.require(:family_person).permit(:role, :family_id, :person_id)
    end
end
