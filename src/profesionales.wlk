// esta clase está completa, no necesita nada más
class ProfesionalAsociado {
	var universidad
	
	method universidad() { 
		return universidad
	}
	
	method universidad(univ) { 
		universidad = univ
	}
	
	method provinciasDondePuedeTrabajar() {
		return #{"Entre Ríos", "Corrientes", "Santa Fe"}
	}
	
	method honorariosPorHora() {
		return 3000
	}
}

class Universidad {
	var property provincia
	var property honorariosPorHora
}

class ProfesionalVinculado {
	var universidad
	
	method universidad() { 
		return universidad
	}
	
	method universidad(univ) { 
		universidad = univ
	}
	
	method provinciasDondePuedeTrabajar() {
		return [universidad.provincia()].asSet()
	}
	
	method honorariosPorHora() {
		return universidad.honorariosPorHora()
	}
}

class ProfesionalLibre {
	var universidad
	const provincia = #{}
	var property honorariosPorHora
	
	method universidad() { 
		return universidad
	}
	
	method universidad(univ) { 
		universidad = univ
	}
	
	method agregarProvincia(prov) {
		provincia.add(prov)
	}
	
	method eliminarProvincia(prov) {
		provincia.remove(prov)
	}
	
	method provinciasDondePuedeTrabajar() {
		return provincia
	}
}

class Empresa {
	const profesionales = []
	var honorarioReferencia
	
	method cuantosEstudiaronEn(universidad) {
		return profesionales.count({profesional => profesional.universidad() == universidad})
	}
	
	method profesionalesCaros() {
		return profesionales.filter({profesional => profesional.honorariosPorHora() > honorarioReferencia})
	}
	
	method universidadesFormadoras() {
		return profesionales.map({profesional => profesional.universidad()}).asSet()
	}
	
	method profesionalMasBarato() {
		return profesionales.min({profesional => profesional.honorariosPorHora()})
	}
	
	method esDeGenteAcotada() {
		return profesionales.all({profesional => profesional.provinciasDondePuedeTrabajar().size() < 3})
	}
}