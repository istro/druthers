class ApplicationController < ActionController::Base
  protect_from_forgery
  after_filter :store_location

  def store_location
    session[:return_to] = request.fullpath
  end


  def after_sign_in_path_for(resource)                                                                                                                      
    sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')                                            
    if (request.referer == sign_in_url)                                                                                                                     
      super                                                                                                                                                 
    else                                                                                                                                                    
      request.referer || session[:return_to] || root_path                                                                                         
    end                                                                                                                                                     
  end
end


