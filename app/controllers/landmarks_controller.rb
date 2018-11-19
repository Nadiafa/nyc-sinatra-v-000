
class LandmarksController < ApplicationController
  get '/landmarks' do 
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end 
  
  get '/landmarks/new' do 
    erb :'landmarks/new'
  end 
  
  post '/landmarks' do 
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    
    redirect '/landmarks'
  end 
  
  get '/landmark/:id' do 
    @landmark = Landmark.(params[:id])
    erb :'landmarks/show'
  end 
  
  get '/landmarks/show'
    @landmark = Landmark.(params[:id])
    erb :'landmarks/show'
  end 
  
  
end
