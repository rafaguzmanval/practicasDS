
require_relative 'FactoriaCarreraYBicicleta'

class PrototipoBicicleta

  attr_reader :compitiendo

  private
  def initialize
    @identificador
    @compitiendo = true
  end

  public
  def setId(identificador)
    @identificador = identificador
  end

  def competir
      while(@compitiendo)

      end
  end

  def finalizar
    @compitiendo = false
  end

  def retirarse
    @compitiendo = false
  end

end