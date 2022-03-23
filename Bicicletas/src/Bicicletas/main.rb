require_relative 'factoria_carretera'
require_relative 'factoria_montana'

factoriaCarretera = FactoriaCarretera.new
factoriaMontana = FactoriaMontana.new

biciCarretera = factoriaCarretera.crearBicicleta
carreraCarretera = factoriaCarretera.crearCarrera

biciMontana = factoriaMontana.crearBicicleta
carreraMontana = factoriaMontana.crearCarrera

N = rand(30) + 10

puts "N es #{N}"

for i in 1..N
  biciCarretera.setId(i)
  carreraCarretera.addBici(biciCarretera.clone)
end

for i in N+1..N+N
  biciMontana.setId(i)
  carreraMontana.addBici(biciMontana.clone)
end

puts "Empiezan las carreras"

hebraCCarretera = Thread.new do
  carreraCarretera.EmpezarCarrera
end

hebraCMontana = Thread.new do
  carreraMontana.EmpezarCarrera
end

hebraCCarretera.join
hebraCMontana.join

puts "finalizan las carreras"



