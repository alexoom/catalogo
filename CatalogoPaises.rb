#Catalogo de Paises

require 'pp'

class CatalogoPaises
	attr_accessor :catalogoGeneral
	def initialize()
		@catalogoGeneral = Hash.new
	end

	def agregarCatalogo(codigoPais, catalogo)
		#pp codigoPais
		@catalogoGeneral[:codigoPais=>codigoPais] = catalogo
	end

	def imprimirCatalogo()
		pp @catalogoGeneral.keys
	end

	def mostrarProductos(codigoPais)
		pp @catalogoGeneral[:codigoPais=>codigoPais].catalogo[0]
	end

end

class Pais
	attr_accessor :nombre
	def initialize(nombre)
		@nombre = nombre
	end
end

class Producto
	attr_accessor :nombre
	def initialize(nombre)
		@nombre = nombre
	end
end

class Catalogo
	#GT, cafe, true
	#GT, azucar,true
	#SV, cafe, false
attr_accessor :catalogo
	def initialize(nombre_pais)
		@nombre_pais = nombre_pais
		@catalogo = []
	end

	def ingresarRegistro(producto, disponibilidad)
		@catalogo << [producto, disponibilidad]
	end		

	#metodo que busque verdaderos en disponibildiad e imprima
	def buscarProductoPorDisponibilidad(disponibilidad)
			@catalogo.each do |a|
				if a[1] == disponibilidad
					pp a[0].nombre
				end
			end
	end

	def banearProducto(baneado)
		@catalogo.each do |a|
			if a[0].nombre == baneado
				a[1] = false
			end
		end	
	end

	def mostrarProductos
		@catalogo.each do |a|
			pp a[0].nombre
		end	
	end
end

#instanciando catalogo general
catalogoGeneral = CatalogoPaises.new

#instanciando paises
guate = Pais.new('Guatemala')
elSalvador = Pais.new('El Salvador')
elSalvador = Pais.new('Mexico')

#instanciando catalogos
catalogoGT = Catalogo.new('Guatemala')
catalogoGeneral.agregarCatalogo('GT', catalogoGT)
catalogoSV = Catalogo.new('El Salvador')
catalogoGeneral.agregarCatalogo('SV', catalogoSV)
catalogoMX = Catalogo.new('Mexico')
catalogoGeneral.agregarCatalogo('MX', catalogoMX)


#instanciando productos
cafe = Producto.new('cafe')
azucar = Producto.new('azucar')

#ingresando registros
catalogoGT.ingresarRegistro(cafe, true)
catalogoGT.ingresarRegistro(azucar, true)
catalogoSV.ingresarRegistro(azucar, true)

#pp catalogoGT

pp '------'
catalogoGeneral.mostrarProductos('SV')
#pp 'Mostrar catalogo'
#pp catalogoGeneral.imprimirCatalogo
#catalogoGT.banearProducto('cafe') 
#catalogoGT.buscarProductoPorDisponibilidad(true)
#pp 'productos para catalogo gt'
#catalogoGT.mostrarProductos


#falta:
#metodo para buscar disponibles dentro del catalogo de x pais
#baneo de un producto de x pais
#metodo para crear pais nuevo
#metodo para crear producto nuevo
#metodo para crear catalogo nuevo










