require_relative 'PrototipoBicicleta'

class PrototipoCarrera

  private
  def initialize
    @bicis = []
    @porcentaje_bicis_a_retirar
    @tiempo_total_carrera = 60
  end

  public

  def addBici(bicicleta)
    @bicis << bicicleta
  end


  def EmpezarCarrera
    primeraEspera = rand(@tiempo_total_carrera)

    hebrasBicicletas = []

    @bicis.size.times do |i|
      hebrasBicicletas << Thread.new {@bicis.at(i).competir}
    end

    sleep(primeraEspera)

    retirarBicicletas

    sleep(@tiempo_total_carrera - primeraEspera)

    for i in @bicis
      if i.compitiendo
      i.finalizar
      end
    end

  end

  def retirarBicicletas

  end






end

