class FoliosController < ApplicationController
  before_action :signed_in_user

  def show
    @folio = Folio.find(params[:id]) 
    @trails = @folio.trails
  end

  def new
    @folio = Folio.new
  end

  def create
    @folio = current_user.folios.build(folio_params)
    if @folio.save
      redirect_to folio_path(@folio.id), notice: "You created a new folio!"
    else
      render 'new'
    end
  end

  def index
    @folios = current_user.folios
  end  

  def destroy
    @folio = Folio.find(params[:id])
    @folio.destroy
    redirect_to folios_path, notice: "You successfully deleted a folio!"
  end  

  def edit
    @folio = Folio.find(params[:id])
  end

  def update
    @folio = Folio.find(params[:id])
    if @folio.update_attributes(folio_params)
      redirect_to folio_path(@folio.id), notice: "You updated a folio!"
    else
      render 'edit'
    end
  end  

  private

    def folio_params
      params.require(:folio).permit(:title)
    end

    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
end
