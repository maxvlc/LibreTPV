# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  def filtrado
    if params[:filtro]
      cookies[("filtrado_fecha_inicio").to_sym] = { :value => Date.civil(params[:filtro][:"fecha_inicio(1i)"].to_i,params[:filtro][:"fecha_inicio(2i)"].to_i,params[:filtro][:"fecha_inicio(3i)"].to_i), :expires => 5.days.from_now }
      cookies[("filtrado_fecha_fin").to_sym] = { :value => Date.civil(params[:filtro][:"fecha_fin(1i)"].to_i,params[:filtro][:"fecha_fin(2i)"].to_i,params[:filtro][:"fecha_fin(3i)"].to_i), :expires => 5.days.from_now }
    end
    redirect_to :action => :listado
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
