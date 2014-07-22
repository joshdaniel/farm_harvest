class CropsController < ApplicationController
  def new
  end

  def create
    @crop= Crop.new(crop_params)
    if @crop.save
      flash[:success] = "Recorded " + @crop.name + "!"
      redirect_to harvest_fields_path
    else
      flash[:error] = "Error recording crop."
      redirect_to_harvest_fields_path
    end
  end

  private
    def crop_params
      params.require(:crop).permit(:name, :comments, :quantity, :unit_type)
    end
end
