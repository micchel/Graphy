class ReactionsController < ApplicationController
  before_action :authenticate_user!

  def create
    reaction = Reaction.find_or_initialize_by(photographer_id: params[:photographer_id], user_id: current_user.id)
    reaction.update_attributes(
      status: params[:reaction]
    )
  end
end
