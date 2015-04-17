require 'json'

StatusCollector::App.controllers :status_posts do
  include DataMapper::Serializer

  # get :index, :map => '/foo/bar' do
  #   session[:foo] = 'bar'
  #   render 'index'
  # end

  # get :sample, :map => '/sample/url', :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   'Maps to url '/foo/#{params[:id]}''
  # end

  # get '/example' do
  #   'Hello world!'
  # end
  
  # mapping is always /status_posts for restful interface
  
  get :index, :with => :id, :provides => [:json] do
    puts "====== id version ====="
    @post = StatusPost.get(params[:id])
    if(params[:id] == '6')
      @post = StatusPost.new({id:6, content:'blah blah'})
    end
    @post.to_json
  end


  get :index, :provides => :json do
    @posts = StatusPost.all
    @posts.to_json
  end


  put :index, :with => :id, :provides => :json do
    @post = StatusPost.first(:id => params[:id])
    puts "params #{params}"
    @post.content = params[:content]
    @post.save
    puts "post to update #{@post}"
    @post.to_json
  end


  post :index, :provides => :json do
    @post = StatusPost.first(:id => params[:id])
    @post.to_json
  end 


  # get :new, :provides => :json do
  #   @post = StatusPost.new(:content => 'foobar')
  #   @post.to_json   # with "require 'json'"  ... JSON.pretty_generate(@post)
  # end


  delete :index, :with => :id, :provides => :json do

  end


end
