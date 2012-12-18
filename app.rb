require File.expand_path("../config/boot.rb", __FILE__)
require "json"

class VotaloBotalo < Sinatra::Base
  helpers do
    def current_user
      User.find(ip: env["REMOTE_ADDR"])
    end
  end

  get "/" do
    @top_projects = Project.top
    @recent_projects = Project.recent
    @user = current_user

    erb :index
  end

  post "/project/:id/vote" do
    project = Project[params[:id]]

    user_ip = env["REMOTE_ADDR"]
    user = User.find_or_create(ip: user_ip)

    opts = { project: project, user: user }
    vote = Vote.find(opts) || Vote.new(opts)

    if ["1", "-1"].include?(params[:v])
      num_vote = params[:v].to_i
    end

    if params[:d] and vote.voto == num_vote
      vote.delete
    else
      vote.voto = num_vote
      vote.save(changed: true, raise_on_save_failure: true)
    end

    return nil
  end
end
