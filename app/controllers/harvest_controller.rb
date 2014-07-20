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
end
