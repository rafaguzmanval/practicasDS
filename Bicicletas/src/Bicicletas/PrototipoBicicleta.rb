
require_relative 'FactoriaCarreraYBicicleta'

class PrototipoBicicleta

  attr_reader :compitiendo

  private
  def initialize
    @identificador
    @compitiendo = true
    @retirado = false;
  end

  public
  def setId(identificador)
    @identificador = identificador
  end

  def competir
    while(@compitiendo)

    end

    if @retirado
      mensajeRetirarse
    else
      mensajeFinalizar
    end

  end



  def finalizar
    @compitiendo = false
  end

  def retirar
    @retirado = true;
    @compitiendo = false;
  end

  def mensajeFinalizar

  end

  def mensajeRetirarse

  end

end