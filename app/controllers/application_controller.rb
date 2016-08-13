require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
    erb :team
    end

    post '/team' do
      @team = Team.new(params["team"]["name"], params["team"]["motto"])
      @hero_1 = Hero.new(params["team"]["members"][0]["name"],params["team"]["members"][0]["power"],params["team"]["members"][0]["bio"])
      @hero_2 = Hero.new(params["team"]["members"][1]["name"],params["team"]["members"][1]["power"],params["team"]["members"][1]["bio"])
      @hero_3 = Hero.new(params["team"]["members"][2]["name"],params["team"]["members"][2]["power"],params["team"]["members"][2]["bio"])
      erb :super_hero
    end

    get '/super_hero' do
      erb :super_hero
    end
end
