class ChargesController < ApplicationController
  def new
    @membership = Membership.find(params[:id])
  end

  def create
    membership = Membership.find(params[:membership_id]) 
  end
end
