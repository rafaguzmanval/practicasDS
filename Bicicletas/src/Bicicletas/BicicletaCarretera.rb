
require_relative 'PrototipoBicicleta'

class BicicletaCarretera < PrototipoBicicleta

  def initialize
    super
  end

  def finalizar
    super
    puts "La bicicleta de carretera #{@identificador} ha terminado"
  end

  def retirarse
    super
    puts "La bicicleta de carretera #{@identificador} se ha retirado antes de terminar"
  end

end