class DosesController < ApplicationController

  before_action :find_cocktail, only: [:new, :create]
  before_action :set_dose, only: [:destroy]

  def new
    @doses = @cocktail.doses
    @dose = Dose.new
  end

  def create
    @doses = []
    @cocktail.doses.select do |dose|
      @doses << dose if dose.id.present?
    end

    @dose = @cocktail.doses.build(dose_params)

    if @dose.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.destroy
    redirect_to @dose.cocktail
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
