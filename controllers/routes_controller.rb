class RoutesController < ApplicationController

  get "/routes" do
    @routes = Route.all
    erb :routes_index
  end

  get "/routes/:id" do
    @route = Route.find(params[:id])
    erb :routes_show
  end

  post "/routes/:route_id/make_deliveries" do
    route = Route.find(params[:route_id])
    @deliveries = route.make_deliveries
    erb :deliveries_made
  end

  # patch "/routes/:id/houses/:house_id" do
  #   house = House.find(params[:house_id])
  #   route = Route.find(params[:id])
  #   route.houses << house
  #   redirect to("/houses")  
  # end

end