class CongressController < ApplicationController

  def index
    @state = params[:state]
    @members = CongressFacade.members(@state)

    render "welcome/index"
  end

  def search
    @member = CongressFacade.senate_search(params[:search])

    render "welcome/index"
  end
end
