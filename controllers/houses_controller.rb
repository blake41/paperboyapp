class HousesController < ApplicationController

  get "/houses" do
    @houses = House.all
    erb :index
  end

  get "/houses/new" do
    erb :new
  end

  post "/houses" do
    @house = House.create(params[:house])
    # binding.pry
    if session[:house_count].nil?
      session[:house_count] = 1
    else
      session[:house_count] += 1
    end 
    erb :congrats
  end

  get "/houses/:id" do
    @house = House.find(params[:id])
    @routes = Route.all
    erb :show
  end

  post "/houses/:id/join_route" do
    house = House.find(params[:id])
    route = Route.find(params[:route_id])
    route.houses << house
    redirect to("/houses")  
  end

  post "/houses/:id/deliveries" do
    house = House.find(params[:id])
    delivery = paperboy.deliver(house)
    @deliveries = [delivery]
    erb :deliveries_made
  end

end