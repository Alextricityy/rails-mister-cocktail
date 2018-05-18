class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @ingredients = Ingredient.all

  end

  def update
    @cocktail = set_cocktail
    @cocktail.update(params_cocktail)
    if @cocktail.save
    redirect_to cocktails_path
  else
    render "update"
  end
  end

  def edit
    @cocktail = set_cocktail
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render "new"
    end
  end

  def destroy
    set_cocktail
    @cocktail.destroy
    redirect_to cocktails_path
  end

  def show
    @cocktail = set_cocktail
    @doses = Dose.where(cocktail_id: params[:id]).all
  end
  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def params_cocktail
    params.require(:cocktail).permit(:name, :photo)
  end

end
