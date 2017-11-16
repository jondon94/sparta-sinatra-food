class FoodControl < Sinatra::Base

  ##Sets root as parent directory of the current file
  set :root, File.join(File.dirname(__FILE__), "..")
  set :view, Proc.new { File.join(root, "views") }

  configure :development do
    register Sinatra::Reloader
  end

  $veg = [{
	 id: 0,
	 title: "Courgette",
	 body: "This is the first post",

  },
  {
    id: 1,
    title: "Tomato",
    body: "This is the second post",

  },
  {
    id: 2,
    title: "Rhubarb",
    body: "This is the third post",

  }];

  $flo = [{
	 id: 0,
	 title: "Hydrangers",
	 body: "This is the first post",

  },
  {
    id: 1,
    title: "Daffydils",
    body: "This is the second post",

  },
  {
    id: 2,
    title: "Lavender",
    body: "This is the third post",

  }];

  get "/" do
    @title = 'Homepage'
    erb :'pages/homepage'
  end

  get "/veggies" do
    @title = 'Veggies'
    @info = $veg
    erb :'pages/homepage'
  end

  get "/flowers" do
    @info = $flo
    @title = 'Flowers'
    erb :'pages/homepage'
  end

  get "/veggies/:id" do
    id = params[:id].to_i
    @info = $veg[id]
    erb :'pages/homepage'
  end

  get "/flowers/:id" do
    id = params[:id].to_i
    @info = $flo[id]
    erb :'pages/homepage'
  end






end
