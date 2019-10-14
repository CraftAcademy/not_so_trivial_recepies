class MembershipController < ApplicationController
  def index
    @memberships = Membership.all 
  end

  def show
  end
end
