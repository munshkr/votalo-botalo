require File.expand_path("../config/boot.rb", __FILE__)
require "json"

class VotaloBotalo < Sinatra::Base
  get "/" do
    @top_projects = Project.top
    @recent_projects = Project.recent

    erb :index2
  end

  post "/project/:id/vote" do
    project = Project[params[:id]]

    user_ip = env["REMOTE_ADDR"]
    user = User.find_or_create(ip: user_ip)

    if params[:vote] == "positive"
      num_vote = 1
    elsif params[:vote] == "negative"
      num_vote = -1
    end

    opts = { project: project, user: user }
    vote = Vote.find(opts) || Vote.new(opts)
    vote.voto = num_vote
    vote.save(changed: true, raise_on_save_failure: true)

    return nil
  end
end
