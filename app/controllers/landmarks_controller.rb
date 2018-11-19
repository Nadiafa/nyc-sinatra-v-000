
class LandmarksController < ApplicationController
  get '/landmarks/new' do 
    erb :'landmarks/new'
  end 
  
  post '/landmarks' do 
    @landmark = Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
  end 
end
