class ApplicationController < Sinatra::Base
   set :default_content_type, 'application/json'
  # add routes
    get '/bakeries' do 
    #get all the bakeries from the database 
     bakeries=Bakery.all 
    #send them back as a JSON array
    bakeries.to_json
    end
    get '/bakeries/:id' do
      #look up the game in the db using its ID
   baked=Bakery.find(params[:id])
   #send a JSON-formatted response of the game data
   baked.to_json(include: :baked_goods)
    end
    get '/baked_goods/by_price' do 
      #get the baked goods by price
    baked=BakedGood.order(price: :desc)
    baked.to_json
    end
    get '/baked_goods/most_expensive' do 
     ordered_good=BakedGood.order(price: :desc)
     good=ordered_good.first
     good.to_json
    end
end
