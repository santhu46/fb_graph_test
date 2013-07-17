class UsersController < ApplicationController

  def index
         @users= User.all
      @config ||= if ENV['fb_client_id'] && ENV['fb_client_secret'] && ENV['fb_scope']
        {
          :client_id     => ENV['fb_client_id'],
          :client_secret => ENV['fb_client_secret'],
          :scope         => ENV['fb_scope'],
        }
      else
        YAML.load_file("#{Rails.root}/config/facebook.yml")[Rails.env].symbolize_keys
      end
    rescue Errno::ENOENT => e
      raise StandardError.new("config/facebook.yml could not be loaded.")
  end
def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def create
        @user=User.new
    @profile ||= FbGraph::User.me(params[:access_token]).fetch
       if (@profile)

            @user.name=@profile.name
            @user.username=@profile.username
            @user.gender=@profile.gender
            @user.identifier=@profile.identifier
            @user.hometown=@profile.hometown
            @user.location=@profile.location
            @user.save
             redirect_to users_path
     else
             redirect_to users_path, notice: 'User was not created check Access Token.' 
     end
  end
end
