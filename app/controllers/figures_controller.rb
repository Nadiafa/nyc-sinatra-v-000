class FiguresController < ApplicationController
  get '/figures' do 
    @figures = Figure.all 
    erb :'figures/index'
  end 
  
  get '/figures/new' do 
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end 
  
  post '/figures' do
    @figure_name = params[:figure][:name]
    @figure = Figure.create(name: @figure_name)
    @title_name = params[:title][:name]
    @landmark_name = params[:landmark][:name]
 
    unless params[:title][:name].empty?
      @figure.titles << Title.create(name: params[:title][:name])
    end 
    
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed])
    end
    
    @figure.save
    
    redirect '/figures/#{@figure.id}'
  end 
  
  # it "allows you to create a new figure with a title" do
  #   visit '/figures/new'
  #   fill_in :figure_name, :with => "Doctor Who"
  #   check "title_#{Title.first.id}"
  #   click_button "Create New Figure"
  #   figure = Figure.last
  #   expect(Figure.all.count).to eq(3)
  #   expect(figure.name).to eq("Doctor Who")
  #   expect(figure.titles).to include(Title.first)
  # end
  
  
  
  
  
  
  
  
  
  
  
  
  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end
  
  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end
  
  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    unless params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end
end