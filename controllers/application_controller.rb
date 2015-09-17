class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }
  enable  :sessions
  set :session_secret, "whatever"
  
  get "/" do
    redirect to("/paperboys")
  end

  helpers do
    def paperboy
      # session[:paperboy_id]
      Paperboy.first
    end
  end
end