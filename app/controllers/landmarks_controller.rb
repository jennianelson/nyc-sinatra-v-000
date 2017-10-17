class LandmarksController < ApplicationController

  get '/landmarks/new' do
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])
    if params[:landmark][:figure_id]
      @landmark.figure_id = params[:landmark][:figure_id]
      @landmark.save
    end
  end

  get '/landmarks' do
    erb :'/landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])

    redirect "/landmarks/#{@landmark.id}"
  end

end
