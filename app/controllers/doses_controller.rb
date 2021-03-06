class DosesController < ApplicationController
  before_action :set_dose, only: :destroy

  def new
    @ingredients = Ingredient.all
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(cocktail_id: @cocktail)
    # @cocktail = Cocktail.find(params[:id])

  end
  def create

    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(params_dose)
    @ingredient = Ingredient.find(params[:dose][:ingredient].to_i)
    @dose.ingredient = @ingredient
    @dose.cocktail_id = @cocktail.id
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
  end

  def destroy
    cocktail = @dose.cocktail
    @dose.delete
    redirect_to cocktail_path(cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def params_dose
    params.require(:dose).permit(:description)
  end
end
