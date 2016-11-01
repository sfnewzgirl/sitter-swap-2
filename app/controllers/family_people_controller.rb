class FamilyPeopleController < ApplicationController

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
    @family_person = FamilyPerson.new(family_person_create_params)
    @family_person.person_id = current_person.id

      if @family_person.save
        flash[:notice] = "Your family has been confirmed."
        redirect_to '/people/' + current_person.id.to_s
      else
        flash[:error] = "Something went wrong. Please try again."
        redirect_to new_family_person_path
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
    @user_input = params[:q]
    @results = Family.all.select{|fam| fam.family_name == @user_input}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_person
      @family_person = FamilyPerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_person_params
      params.require(:family_person).permit(:role, :family_id, :person_id)
    end

    def family_person_create_params
      params.permit(:role, :family_id)
    end
end
