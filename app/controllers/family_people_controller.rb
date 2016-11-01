class FamilyPeopleController < ApplicationController

  def index
    @family_people = FamilyPerson.all
  end

  def show
  end

  def new
    @family_person = FamilyPerson.new
  end

  def edit
  end

  def create
    @family_person = FamilyPerson.new(family_person_create_params)
    @family_person.person_id = current_person.id

      if @family_person.save
        flash[:notice] = "Your family has been confirmed."
        flash[:color] = "success"
        redirect_to '/people/' + current_person.id.to_s
      else
        flash[:error] = "Something went wrong. Please try again."
        flash[:color] = "failure"
        redirect_to family_people_search_path
      end
  end

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
    
    def set_family_person
      @family_person = FamilyPerson.find(params[:id])
    end

    def family_person_params
      params.require(:family_person).permit(:role, :family_id, :person_id)
    end

    def family_person_create_params
      params.permit(:role, :family_id)
    end


end
