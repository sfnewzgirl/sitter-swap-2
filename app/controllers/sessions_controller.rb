class SessionsController < ApplicationController

  def new
      @person = Person.new
  end

  def create
  end

  def destroy
  end

  private

  def person_params
  end

end
