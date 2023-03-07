# frozen_string_literal: true

# Resturant controller
# Resturant controller
class ResturantsController < ApplicationController
  def create
    @resturant = Resturant.new(params.require(:resturant).permit(:name, :location))
    authorize @resturant
    if !@resturant.valid?
      flash[:alert] = @resturant.errors.full_messages.to_sentence
      redirect_to new_resturant_path
    else
      @resturant.save
      redirect_to items_path, flash: { notice: 'A new resturant has been added' }

    end
  end

  def new
    @resturant = Resturant.new
    authorize @resturant
  end
end
