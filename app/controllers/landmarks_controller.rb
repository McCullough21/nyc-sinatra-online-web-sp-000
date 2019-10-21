class LandmarksController < ApplicationController

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  get 'landmark/:id' do
    @landmark = Landmark.find_by(params[:id])
    erb :show
  end

  post '/landmarks' do
    @landmark = Landmark.create(name: params["name"], year_completed: params["landmark[year_completed]"])
    @landmark.figure = Figure.find_or_create_by(name: params["figure name"])
    @landmark.figure.title = FigureTitle.find_or_create_by(title: params["figure title"])
    @landmark.save

    redirect '/lanmarks/#{@landmark.id}'
  end



end
