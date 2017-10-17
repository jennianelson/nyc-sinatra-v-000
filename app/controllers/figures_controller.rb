class FiguresController < ApplicationController

    get '/figures/new' do
      erb :'/figures/new'
    end

    post '/figures' do
      @figure = Figure.create(params[:figure])
      if params[:title][:name]
        @figure.titles << Title.create(params[:title])
      else
        params[:figure][:title_ids].each do |id|
          @figure.titles << Title.find(id)
        end
      end

      if params[:landmark][:name]
        @figure.landmarks << Landmark.create(params[:landmark])
      else
        params[:landmark][:landmark_ids].each do |id|
          @figure.landmarks << Landmark.find(id)
        end
      end
      @figure.save
    end

    get '/figures' do
      erb :'/figures/index'
    end

    get '/figures/:id' do
      @figure = Figure.find(params[:id])
      erb :'/figures/show'
    end

    get '/figures/:id/edit' do
      @figure = Figure.find(params[:id])
      erb :'/figures/edit'
    end

    patch '/figures/:id' do
      @figure = Figure.find(params[:id])
      @figure.update(params[:figure])
      if params[:title][:name]
        @figure.titles << Title.create(params[:title])
      else
        params[:figure][:title_ids].each do |id|
          @figure.titles << Title.find(id)
        end
      end

      if params[:landmark][:name]
        @figure.landmarks << Landmark.create(params[:landmark])
      else
        params[:landmark][:landmark_ids].each do |id|
          @figure.landmarks << Landmark.find(id)
        end
      end
      @figure.save

      redirect "/figures/#{@figure.id}"
    end

end
