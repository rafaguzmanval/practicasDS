
require_relative 'PrototipoCarrera'
class CarreraMontana < PrototipoCarrera

  def initialize
    super
    @porcentaje_bicis_a_retirar = 20
  end

  def retirarBicicletas

    (@bicis.size * @porcentaje_bicis_a_retirar / 100).times do |i|
      @bicis.at(i).retirar
    end

  end

end
