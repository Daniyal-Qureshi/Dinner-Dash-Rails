# frozen_string_literal: true
class CategoriesController < ApplicationController
  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(params.require(:category).permit(:name))
    authorize @category
    if !@category.valid?
      flash[:alert] = @category.errors.full_messages.to_sentence
      redirect_to new_category_path
    else
      @category.save
      redirect_to items_path, flash: { notice: 'A new category has been added' }

    end
  end
end
