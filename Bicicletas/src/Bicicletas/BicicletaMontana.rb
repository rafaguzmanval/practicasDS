require_relative 'PrototipoBicicleta'

class BicicletaMontana < PrototipoBicicleta

  def initialize
    super
  end

  def mensajeFinalizar
    puts "La bicicleta de montana #{@identificador} ha terminado"
  end

  def mensajeRetirarse
    puts "La bicicleta de montaña #{@identificador} se ha retirado antes de terminar"
  end
end
