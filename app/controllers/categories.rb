require 'json'

StatusCollector::App.controllers :categories do
  include DataMapper::Serializer



  get :index, :provides => :json do
    @categories = Category.all
    @categories.to_json
  end


  get :index, :with => :id, :provides => [:json] do
    @category = Category.get(params[:id])
    @category.to_json
  end


  put :index, :with => :id, :provides => :json do
    @category = Category.first(:id => params[:id])
    puts params.inspect
    @category.name = params[:name]
    @category.description = params[:description]
    @category.save
    @category.to_json
  end


  post :index, :provides => :json do
    @category = Category.new
    puts params.inspect
    @category.name = params[:name]
    @category.description = params[:description]
    @category.save
    @category.to_json
  end 


  delete :index, :with => :id, :provides => :json do
    @category = Category.first(:id => params[:id])
    @category.destroy
    {}.to_json
  end


end
