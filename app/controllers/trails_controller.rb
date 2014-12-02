class TrailsController < ApplicationController
  before_action :signed_in_user

  def show
    @trail = Trail.find(params[:id])
  end

  def new
    @trail = Trail.new
  end

  def create
    @folio = current_user.folios.find(trail_params[:folio_id])
    @trail = @folio.trails.build(trail_params)
    if @trail.save
      redirect_to folio_path(@folio.id), notice: "You successfully saved a trail"
    else
      render 'new'
    end
  end

  def index
    @folios = current_user.folios
    if params[:activity_type_name] && params[:city]
      @response = Trail.party(params[:activity_type_name], params[:city])
    else
      @response = nil
    end
  end

  def destroy
    @trail = Trail.find(params[:id])
    @folio = @trail.folio_id
    current_folio_id = @folio
    @trail.destroy
    redirect_to folio_path(current_folio_id), notice: "You successfully deleted a trail from your folio!"
  end

  private

    def trail_params
      params.require(:trail).permit(:name, :activity_type_name, :city, :state, :folio_id, :directions)
    end

    def signed_in_user
      redirect_to signin_path, notice: "Please sign in." unless signed_in?
    end
end
