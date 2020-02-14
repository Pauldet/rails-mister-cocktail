class DosesController < ApplicationController

  def create
    @dose = Dose.new(params_doses)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@dose.cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

private

  def params_doses
    params.require(:dose).permit(:description, :ingredient_id, :quantity)
  end
end
