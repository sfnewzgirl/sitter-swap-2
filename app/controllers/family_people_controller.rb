class FamilyPeopleController < ApplicationController
  before_action :set_family, only: [:new, :show, :edit, :update, :destroy]

  def index
    @family_people = FamilyPerson.all
  end

  def show
  end

  def new
    @family_person = FamilyPerson.new
    family_id = Family.find_by(params[:id])
  end

  def edit
  end

  def create
    @family_person = FamilyPerson.new(family_person_create_params)
    @family_person.person_id = current_person.id
    @results = Family.find_by(params[:id])

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

  def sitter_create
    #@sitters = Person.find_by(params[:id])
    @family_person = FamilyPerson.new(family_person_sitter_create_params)
    puts 'FAMILY-PERSON'

    fams = FamilyPerson.select{ |fp| fp.role == "caregivers" && fp.person_id == current_person.id }
    puts 'FAMS'
    if fams
      puts fams
      @family_person.family_id = fams[0].family_id
    end
    puts 'FAMILY', @family_person.person_id, @family_person.family_id, @family_person.role
    cur_fams = FamilyPerson.select{ |fp| fp.role == @family_person.role && fp.person_id == @family_person.person_id && fp.family_id == @family_person.family_id }
    puts cur_fams

    if @family_person.save
      puts 'SAVE-SUCCEEDED'
      flash[:notice] = "Your sitter has been confirmed."
      flash[:color] = "success"
      redirect_to '/people/' + current_person.id.to_s
    else
      puts 'SAVE-FAILED'
      flash[:error] = "Something went wrong. Please try again."
      flash[:color] = "failure"
      #redirect_to family_people_search_path
      redirect_to "http://www.example.com/"
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
    @sitters = Person.all.select{|person| person.email == @user_input}
  end

  private

    def set_family
      @family = Family.all.select{|fam| fam.id == (params[:id])}
    end

    def family_person_params
      params.require(:family_person).permit(:role, :family_id, :person_id)
    end

    def family_person_create_params
      params.permit(:role, :family_id, :person_id)
    end

    def family_person_sitter_create_params
      params.permit(:role, :family_id, :person_id)
    end

end
