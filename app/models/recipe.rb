class Recipe < ActiveRecord::Base
attr_accessor :name, :ingredients, :cook_time

  def initialize(params)
    @name = params[:name]
    @ingredients = params[:ingredients]
    @cook_time = params[:cook_time]

    @@recipes << Recipe.new(params)
  end

  def self.all
    @@recipes
  end

end