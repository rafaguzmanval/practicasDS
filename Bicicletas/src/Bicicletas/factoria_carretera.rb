
require_relative 'FactoriaCarreraYBicicleta'
require_relative 'CarreraCarretera'
require_relative 'BicicletaCarretera'

class FactoriaCarretera < FactoriaCarreraYBicicleta

  def crearCarrera
    return CarreraCarretera.new
  end

  def crearBicicleta
    return BicicletaCarretera.new
  end

end
