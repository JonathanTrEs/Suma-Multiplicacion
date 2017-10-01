#! /usr/local/rvm/rubies/ruby-2.0.0-p247/bin/ruby
data = File.open('datoss.dat').read

matriz1, matriz2 = data.split(/\n\s*\n+/)

def mapmap(matriz)
  matriz.map { |r|
   r.map { |e|
     yield e
   }
  }
end

def to_m(matriz)
  matriz = matriz.split(/\n/)
  matriz = matriz.map{ |r| r.split(/\s+/)}
  matriz = mapmap(matriz) { |x| x.to_f}
end

matriz1 = to_m(matriz1)
matriz2 = to_m(matriz2)

resultado = Array.new
m = matriz1.size
n = matriz1[1].size

for i in 0...m do
	resultado[i] = Array.new
	for j in 0...n do
		resultado[i][j] = 0
	end
end

for i in 0...m do
	for j in 0...n do
		resultado[i][j] = matriz1[i][j] + matriz2[i][j]
	end
end

puts "\n La matriz1 es ="
matriz1.each do |fila|
   puts fila.join(" ")
end

puts "\n La matriz2 es ="
matriz2.each do |fila|
   puts fila.join(" ")
end

puts "\n La suma de las dos matrices es = "
resultado.each do |fila|
   puts fila.join(" ")
end
  
