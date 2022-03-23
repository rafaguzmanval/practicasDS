require_relative 'PrototipoCarrera'

class CarreraCarretera < PrototipoCarrera

  def initialize
    super
    @porcentaje_bicis_a_retirar = 10
  end

  def retirarBicicletas

    (@bicis.size * @porcentaje_bicis_a_retirar / 100).times do |i|
      @bicis.at(i).retirar
    end

  end

end
