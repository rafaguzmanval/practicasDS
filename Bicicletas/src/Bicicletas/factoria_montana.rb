
require_relative 'FactoriaCarreraYBicicleta'
require_relative 'carrera_montana'
require_relative 'BicicletaMontana'

class FactoriaMontana

  def crearCarrera
    return CarreraMontana.new
  end

  def crearBicicleta
    return BicicletaMontana.new
  end

end
