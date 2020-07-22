class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.all
    
    if params[:keyword].present?
    
    @power_generators = PowerGenerator.procurar(params[:keyword])
    end
  end

  def show
    @power_generators = PowerGenerator.find(params[:id])
  end
end