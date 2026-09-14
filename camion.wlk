import cosas.*

object camion {
	const property cosas = #{}
	const tara = 1000
	const pesoMaximo = 2500
		
	method cargar(unaCosa) {
		self.validarPuedeCargar(unaCosa)
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
	  self.validarPuedeDescargar(unaCosa)
	  cosas.remove(unaCosa)
	}

	method validarPuedeCargar(unaCosa) {
	  if (self.estaEnElCamion(unaCosa)) {
		self.error("ya esta cargado")
	  }
	}

	method validarPuedeDescargar(unaCosa) {
	  if (not self.estaEnElCamion(unaCosa)){
		self.error("No esta cargado")
	  }
	}

	method estaEnElCamion(unaCosa) {
	  return self.cosas().contains(unaCosa)
	}

	method todoPesoEsPar() { //indica si todas las cosas del camion, tienen peso par
	  return cosas.all({unaCosa => self.esCosaConPesoPar(unaCosa)})
	}

	method esCosaConPesoPar(unaCosa) {
	  return unaCosa.peso().even()
	}

	method hayAlgunaQuePesa(cantKg) { //indica si hay una cosa del camion que pese exactamente la cantidad de kilogramos dada
	  return cosas.any({unaCosa => self.laCosaPesa(unaCosa,cantKg)})
	}

	method laCosaPesa(unaCosa,cantKg) {
	  return unaCosa.peso() == cantKg
	}

	method pesoDeCamionConCarga() {
	  return cosas.sum({unaCosa => unaCosa.peso()})
	}

	method pesoTotal() {
	  return tara + self.pesoDeCamionConCarga()
	}

	method estaExcedidoDePeso() {
	  return self.pesoTotal() > pesoMaximo
	}

	method hayUnaCosaConNivelPeligrosidadDe(nivelPeligrosidad) {
	  return cosas.find({unaCosa => self.esNivelDePeligrosidad(unaCosa,nivelPeligrosidad)})
	}

	method esNivelDePeligrosidad(unaCosa,nivelPeligrosidad) {
	  return unaCosa.nivelPeligrosidad() == nivelPeligrosidad
	}

	method cosasSuperanNivelPeligrosidad(nivelPeligrosidad) {
	  return cosas.filter({unaCosa => self.esMayorNivelPeligrosidad(unaCosa,nivelPeligrosidad)})
	}

	method esMayorNivelPeligrosidad(unaCosa,nivelPeligrosidad) {
	  return unaCosa.nivelPeligrosidad() > nivelPeligrosidad
	}

	method cosasMasPeligrosdasQue(otraCosa) {
	  return self.cosasSuperanNivelPeligrosidad(otraCosa.nivelPeligrosidad())
	}

	method puedeCircularEnRuta(nivelPeligrosidad) {
	  return not self.estaExcedidoDePeso() && not self.superaNivelPeligrosidadDeCarga(nivelPeligrosidad)
	}

	method superaNivelPeligrosidadDeCarga(nivelPeligrosidad) {
	  return self.nivelPeligrosidadDeCarga() > nivelPeligrosidad
	}

	method nivelPeligrosidadDeCarga() {
	  return cosas.sum({unaCosa => unaCosa.nivelPeligrosidad()})
	}

	method tieneUnaCosaQuePesaEntre(minimo,maximo) {
	  return cosas.any({unaCosa => self.pesaEntre(unaCosa,minimo,maximo)})
	}

	method pesaEntre(unaCosa,minimo,maximo) {
	  return unaCosa.peso() > minimo && unaCosa.peso() < maximo
	}

	method cosaMasPesada() {
	  self.validarSiHayCosas()//hace falta validar?
	  return cosas.max({unaCosa => unaCosa.peso()}) //devuelve la cosa mas pesada entre las cosas
	}

	method validarSiHayCosas() {
	  if (cosas.isEmpty()) self.error("No se puede calcular la cosa mas pesada")
	}

	method totalidadDePeso() {
	  return cosas.map({unaCosa => unaCosa.peso()})
	}

	method totalidadBultos() {
		return cosas.sum({unaCosa => unaCosa.bultos()})
	}

	method sufreAccidente() {
	  cosas.forEach({unaCosa => unaCosa.efectoDeCarga()})
	}
}
