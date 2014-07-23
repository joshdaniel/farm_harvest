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
    @crop_types = ['Armenian Cucumber',
                   'Pickling Cukes',
                   'Slicing Cucumbers',
                   'Mixed Summer Squash',
                   'Padron Peppers',
                   'Picante Padron',
                   'French Fingerling Potatoes',
                   'Russian Banana Potatoes',
                   'Yukon A/B mix',
                   'Early Girl',
                   'Lemon Boy',
                   'Orange Blossom',
                   'Mixed Medley Tomato',
                   'Sungold',
                   'Sweet 100',
                   'Carrots',
                   'Beets']
  end
end
