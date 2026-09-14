object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos() {
	  return 1
	}

	method efectoDeCarga() {
	  
	}
}

object arenaAGranel {
	var peso = 0

	method peso() {
	  return peso
	}

	method peso(_peso) {
	  peso = _peso
	}

	method nivelPeligrosidad() {
	  return 1
	}

	method bultos() {
	  return 1
	}

	method efectoDeCarga() {
	  peso = peso + 20
	}
}

object bumblebee {
  var property estaTransformadoEnAuto = true //cambiarlo a un objeto sea robot o auto
  method peso() {
	return 800
  }

  method nivelPeligrosidad() { if (estaTransformadoEnAuto) return 15 else return 30 } //si esta transformado en auto, devuelve 15 de peligrosidad, en caso contrario 30

  method transformar() {
	estaTransformadoEnAuto = not estaTransformadoEnAuto //si esta en modo auto, pasa a robot y viceversa.
  }

  method bultos() {
	  return 2
	}

	method efectoDeCarga() {
	  estaTransformadoEnAuto = false
	}
}

object paqueteDeLadrillos {
	var cantLadrillos = 0
	method peso() {
	  return cantLadrillos * 2 //por cada ladrillo, pesa 2kg
	}

	method nivelPeligrosidad() {
	  return 2
	}

	method cantLadrillos(_cantLadrillos) {
	  cantLadrillos = _cantLadrillos
	}

	method bultos() {
	  if (cantLadrillos <= 100) return 1 else if (cantLadrillos <= 300) return 2 else return 3
	}

	method efectoDeCarga() {
	  if (cantLadrillos < 12) cantLadrillos = 0 else cantLadrillos = cantLadrillos - 12
	}

	method cantLadrillos() {
	  return cantLadrillos
	}
}

object bateríaAntiaérea {
	var tieneMisiles = true
	method peso() { if (tieneMisiles) 300 else 200 } //si tiene misiles, devuelve 300 de peso, en caso contrario 200 de peso

	method hayMisiles() {
	  tieneMisiles = not tieneMisiles
	}

	method nivelPeligrosidad() { if(tieneMisiles) return 100 else return 0 } //si tiene misiles, devuelve 100 de peligrosidad, en caso contrario 0

	method bultos() {
	  if (tieneMisiles) return 2 else return 1
	}

	method efectoDeCarga() {
	  tieneMisiles = false
	}

	method tieneMisiles() {
	  return tieneMisiles
	}
}

object residuosRadiactivos {
	var peso = 0
	method peso() {
	  return peso
	}

	method peso(_peso) {
	  peso = _peso
	}

	method nivelPeligrosidad() {
	  return 200
	}

	method bultos() {
	  return 1
	}

	method efectoDeCarga() {
	  peso = peso + 15
	}
}

object contenedorPortuario {
	const contenedor = #{}

	method peso() {
	  return 100 + self.pesoDeCosas()
	}

	method pesoDeCosas() {
	  return contenedor.sum({unaCosa => unaCosa.peso()})
	}

	method nivelPeligrosidad() {
	  if (self.hayCosas()) return self.cosaMasPeligrosa().nivelPeligrosidad() else return 0
	}

	method hayCosas() {
	  return not contenedor.isEmpty()
	}

	method cosaMasPeligrosa() {
	  return contenedor.max({unaCosa => unaCosa.nivelPeligrosidad()})// devuelve la cosa mas peligrosa
	}

	method agregarCosa(unaCosa) {
	  contenedor.add(unaCosa)
	}

	method bultos() {
	  return 1 + contenedor.sum({unaCosa => unaCosa.bultos()})
	}

	method efectoDeCarga() {
	  contenedor.forEach({unaCosa => unaCosa.efectoDeCarga()})
	}
}

object embalajeDeSeguridad {
	var property embalado = arenaAGranel

  method peso() {
	return embalado.peso()
  }

  method nivelPeligrosidad() {
	return embalado.nivelPeligrosidad() / 2
  }

  method bultos() {
	  return 2
	}

	method efectoDeCarga() {
	  
	}
}

object auto {

}

object robot {
	
}

