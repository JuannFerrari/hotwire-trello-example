class CardsController < ApplicationController
  before_action :set_card, only: %i[edit update destroy]

  def edit; end

  def create
    card = Card.new(card_params)
    if card.save
      render turbo_stream: turbo_stream.update("notifications-bar", partial: "shared/toast",
        locals: {message: "Card was successfully created."})
    else
      render turbo_stream: turbo_stream.update("notifications-bar", partial: "shared/toast",
        locals: {message: "Card could not be created."})
    end
  end

  def update
    if @card.update(card_params)
      render turbo_stream: turbo_stream.update("notifications-bar", partial: "shared/toast",
        locals: {message: "Card was successfully updated."})
    else
      render turbo_stream: turbo_stream.update("notifications-bar", partial: "shared/toast",
        locals: {message: "Card could not be updated."})
    end
  end

  def destroy
    @card.destroy!
    render turbo_stream: turbo_stream.update("notifications-bar", partial: "shared/toast",
      locals: {message: "Card was successfully destroyed."})
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :position, :column_id)
  end
end
