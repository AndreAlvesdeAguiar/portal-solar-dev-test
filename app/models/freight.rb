require 'correios-frete'


class Freight < ApplicationRecord
  validates :state, :weight_min, :weight_max, :cost, presence: true

# RETIRADO DE https://github.com/prodis/correios-frete
# endereço portal solar R. Barão do Triunfo, 612 - Brooklin, São Paulo - SP, 04602-002


  def calculate_ship(cep_destino)
    frete = Correios::Frete::Calculador.new :cep_origem => "04602-002", :cep_destino => params[:zipcode]
    
    servicos = frete.calcular :sedex, :pac
    @pac = servicos[:pac].valor
    @sedex = servicos[:sedex].valor
    sedex = frete.calcular :sedex
    pac = frete.calcular :pac
    render 'checkout'
  end

end
