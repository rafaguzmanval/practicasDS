
require_relative 'PrototipoBicicleta'
require_relative 'PrototipoCarrera'

class FactoriaCarreraYBicicleta

  def initialize
  end

  def crearPrototipoBicicleta
    return PrototipoBicicleta.new
  end

  def crearPrototipoCarrera
    return PrototipoCarrera.new
  end


end