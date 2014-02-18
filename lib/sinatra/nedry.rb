module Sinatra
  module Nedry
    def protected!(&blk)
      if authorized?
        blk.call
      else
        not_authorized
      end
    end
    
    def flagged!(&blk)
      if authorized? || ENV["RACK_ENV"] != "production"
        blk.call
      else
        not_authorized
      end
    end
    
    private
    
    def authorized?
      admin_credentials = if ENV["RACK_ENV"] == "production"
        [ENV["ADMIN_USERNAME"], ENV["ADMIN_PASSWORD"]]
      else
        ["admin", "admin"]
      end      
  
      @auth ||= Rack::Auth::Basic::Request.new(request.env)
      @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == admin_credentials
    end
    
    def not_authorized
      headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
      halt 401, NOT_AUTH_TEMPLATE
    end
    
    NOT_AUTH_TEMPLATE = <<-ERB
      <div style="text-align: center; margin-top: 40px">  
        <iframe 
          width="853" 
          height="480" 
          src="//www.youtube.com/embed/RfiQYRn7fBg?autoplay=1&loop=1&playlist=RfiQYRn7fBg" 
          frameborder="0" 
          allowfullscreen>
        </iframe>
        <h1>Ah ah ah!</h1>
      </div>
    ERB
  end

  helpers Nedry
end