class HarvestController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def availability
  end

  def field
    @crop = Crop.new
  end

  def fields
    @crop_types = ["Strawberries", "Early Girl", "Cucumbers", "Broccoli"]
  end
end
