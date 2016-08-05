class DosesController < ApplicationController

  before_action :find_cocktail, only: [:new, :create, :cocktail]
  before_action :set_dose, only: [:destroy]

  def create

    @dose = @cocktail.doses.new(dose_params)

    if @dose.save
      redirect_to edit_cocktail_path(@cocktail)
    else
      render 'cocktails/edit'
    end
  end

  def destroy
    @dose.destroy
    redirect_to edit_cocktail_path(@dose.cocktail)
  end


  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])

  end

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
