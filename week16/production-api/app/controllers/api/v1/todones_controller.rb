class Api::V1::TodonesController < ApplicationController
  before_action :set_todone, only: %i[show update destroy]

  # GET /todones
  def index
    @todones = Todone.all

    render json: @todones
  end

  # GET /todones/1
  def show
    render json: @todone
  end

  # POST /todones
  def create
    @todone = Todone.new(todone_params)

    if @todone.save
      render json: @todone, status: :created, location: @todone
    else
      render json: @todone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todones/1
  def update
    if @todone.update(todone_params)
      render json: @todone
    else
      render json: @todone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todones/1
  def destroy
    @todone.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_todone
    @todone = Todone.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def todone_params
    params.require(:todone).permit(:name)
  end
end
