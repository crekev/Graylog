class BlacklisttermsController < ApplicationController
  def create
    term = Blacklistterm.new params[:blacklistterm]
    if term.save
      flash[:notice] = "Term has been added to overview blacklist."
    else
      flash[:error] = "Could not add term to overview blacklist!"
    end
    redirect_to :controller => "blacklists", :action => "show", :id => params[:blacklistterm][:blacklist_id]
  end
  
  def destroy
    term = Blacklistterm.find params[:id]
    if term.destroy
      flash[:notice] = "Term has been removed from overview blacklist."
    else
      flash[:error] = "Could not remove term from overview blacklist."
    end
    redirect_to :controller => "blacklists", :action => "show", :id => params[:blacklist_id]
  end
end
