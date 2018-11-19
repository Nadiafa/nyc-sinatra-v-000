
class LandmarksController < ApplicationController
  get '/landmarks/new' do 
    @landmarks = Landmark.all
    erb :'landmarks/new'
  end 
  
  post '/landmarks' do 
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    
    redirect '/landmarks'
  end 
  
  
end
