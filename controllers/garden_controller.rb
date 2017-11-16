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
	 body: "Corgettes are easy to grow",
   image: 'https://i2-prod.manchestereveningnews.co.uk/incoming/article12478695.ece/ALTERNATES/s615/Fresh-zucchini-courgette.jpg',
  },
  {
    id: 1,
    title: "Tomato",
    body: "Tomatos are easy to grow",
    image: 'https://www.rodalesorganiclife.com/sites/rodalesorganiclife.com/files/styles/listicle_slide_custom_user_phone_1x/public/airyspot_ahmad_faizal_yahya_102522.jpg?itok=Xnuv04tf',
  },
  {
    id: 2,
    title: "Rhubarb",
    body: "Rhubarb is easy to grow",
    image: 'https://www.pomonafruits.co.uk/images/Rhubarb-Thompsons-Terrifically-Tasty.jpg',
  }];

  get "/" do
    @title = 'Homepage'
    erb :'pages/home'
  end

  get "/veggies" do
    @title = 'Veggies'
    @info = $veg
    erb :'pages/infopage'
  end

  get "/veggies/:id" do
    id = params[:id].to_i
    @info = $veg[id]
    erb :'pages/index'
  end

end
