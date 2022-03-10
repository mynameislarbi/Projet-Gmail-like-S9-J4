class EmailsController < ApplicationController

  def index
    @emails = Email.all.sort_by(&:id)
  end

  def show
    @email = Email.find(params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def create
    @email = Email.create(object: Faker::Name.unique.name, body: Faker::ChuckNorris.fact, read: false)
    respond_to do |format|
      format.html { redirect_to root }
      format.js { }
    end
  end

  def edit
    @email = Email.find(params[:id])
  end

  def update
    @email = Email.find(params[:id])
    @email.update(read: false)
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy

    respond_to do |format|
      format.html {  }
      format.js  { }
    end
  end

end