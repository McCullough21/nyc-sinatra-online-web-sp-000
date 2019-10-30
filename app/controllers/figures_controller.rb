class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :"/figures/index"
  end

  post '/figures' do
<<<<<<< HEAD
    @title = params[:title]
    @title_ids = params[:figure][:title_ids]
    @landmark = params[:landmark]
    @landmark_ids = params[:figure][:landmark_ids]
=======
    @figure = Figure.create(name: params[:name])
    if Landmark.find_or_create_by(params[:landmark])
    end
>>>>>>> 385f87084c72d2ee7fd759850afcfefc20279f20

    @figure = Figure.create(:name => params[:figure][:name])
    if !@title[:name].empty?
      t = Title.create(:name => @title[:name])
      @figure.titles << t
    end
    if @title_ids
      @title_ids.each do |id|
        t = Title.find(id)
        @figure.titles << t
      end
    end
    if !@landmark[:name].empty?
      l = Landmark.create(:name => @landmark[:name])
      @figure.landmarks << l
    end
    if @landmark_ids
      @landmark_ids.each do |id|
        l = Landmark.find(id)
        @figure.landmarks << l
      end
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :"figures/new"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"/figures/edit"
  end

  patch '/figures/:id' do
    @title = params[:title]
    @title_ids = params[:figure][:title_ids]
    @landmark = params[:landmark]
    @landmark_ids = params[:figure][:landmark_ids]

    @figure = Figure.find(params[:id])
    @figure.name = params[:figure][:name]
    if @title_ids
      @figure.titles.clear
      @title_ids.each do |id|
        t = Title.find(id)
        @figure.titles << t
      end
    end
    if !@title[:name].empty?
      t = Title.create(:name => @title[:name])
      @figure.titles << t
    end
    if @landmark_ids
      @figure.landmarks.clear
      @landmark_ids.each do |id|
        l = Landmark.find(id)
        @figure.landmarks << l
      end
    end
    if !@landmark[:name].empty?
      l = Landmark.create(:name => @landmark[:name])
      @figure.landmarks << l
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :"figures/show"
  end

end
