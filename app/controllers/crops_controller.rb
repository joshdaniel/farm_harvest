class CropsController < ApplicationController
  def new
  end

  def create
    @crop= Crop.new(crop_params)
    if @crop.save
      redirect_to harvest_field_path
    else
      redirect_to_harvest_field_path
    end
  end

  private
    def crop_params
      params.require(:crop).permit(:name, :comments, :quantity, :unit_type)
    end
end
