class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/recipes/new' do

    erb :new
  end

  get '/recipes' do
    @recipes = Recipes.all
    erb :show
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params, cook_time: params[:cook_time])
    # Recipe.save
    redirect to "recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipes = Recipe.find_by_id(params[:id])
    erb :show
  end




end
