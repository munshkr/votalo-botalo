require File.expand_path("../config/boot.rb", __FILE__)
require "json"

class Votalo < Sinatra::Base
  get "/" do
    @top_projects = Project.top
    @recent_projects = Project.recent

    erb :index2
  end

  post "/project/:id/vote" do
    project = Project[params[:id]]
    user_ip = env["REMOTE_ADDR"]

    user = User.find_or_create(ip: user_ip)

    if vote = Vote.find(project: project, user: user)
      #return { error "User already voted for this project!"
      return "null"
    end

    if params[:vote] == "positive"
      num_vote = 1
    elsif params[:vote] == "negative"
      num_vote = -1
    end

    vote = Vote.create(project: project, user: user, voto: num_vote)
    puts vote

    [project.positive_votes.count, project.negative_votes.count].to_json
  end
end
