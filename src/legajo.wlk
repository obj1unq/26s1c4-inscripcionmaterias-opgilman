import src.estudiante.*

class Legajo {
  var estudiante
  var carrerasEnProceso = []
  
  method registrarAprobada(materia, nota) {
    self.materiaContenidaCarreraCursada(materia).registrarAprobada(
      materia,
      nota
    )
  }
  
  method materiaContenidaCarreraCursada(materia) = carrerasEnProceso.find(
    { cep => cep.carrera().listadoDeMaterias().contains(materia) }
  )
  
  method tieneAprobada(materia) = carrerasEnProceso.any(
    { cep => cep.tieneAprobada(materia) }
  )
  
  method cantidadMateriasAprobadas() = carrerasEnProceso.sum(
    { cep => cep.materiasAprobadas().size() }
  )
  
  method promedio() {
    const aprobadas = carrerasEnProceso.map(
      { cep => cep.materiasAprobadas() }
    ).flatten()
    return aprobadas.sum({ mcon => mcon.nota() }) / aprobadas.size()
  }
  
  method todasLasMaterias() = carrerasEnProceso.map(
    { cep => cep.carrera().listadoDeMaterias() }
  ).flatten()
  
  method estaInscripto(materia) = carrerasEnProceso.any(
    { cep => cep.estaInscripto(materia) }
  )
  
  method puedeInscribirse(materia) = ((self.perteneceACarrera(
    materia
  ) && self.noAprobada(materia)) && self.noInscripto(
    materia
  )) && self.tienePrevias(materia)
  
  method tienePrevias(materia) = materia.correlativas().all(
    { corr => self.tieneAprobada(corr) }
  )
  
  method noInscripto(materia) = !self.estaInscripto(materia)
  
  method noAprobada(materia) = !self.tieneAprobada(materia)
  
  method perteneceACarrera(materia) = self.todasLasMaterias().contains(materia)
  
  method agregarInscripcion(materia) {
    self.materiaContenidaCarreraCursada(materia).agregarInscripcion(materia)
  }
  
  method quitarInscripcion(materia) {
    self.materiaContenidaCarreraCursada(materia).quitarInscripcion(materia)
  }
  
  method materiasInscriptas() = self.todasLasMaterias().filter(
    { m => self.estaInscripto(m) }
  )
  
  method materiasEnEspera() = self.todasLasMaterias().filter(
    { m => m.listaDeEspera().contains(self) }
  )
  
  method materiasDisponiblesEn(carrera) {
    if (!carrerasEnProceso.any({ cep => cep.carrera() == carrera })) {
      throw new Exception(message = "El estudiante no cursa esa carrera")
    }
    return carrerasEnProceso.find(
      { cep => cep.carrera() == carrera }
    ).carrera().listadoDeMaterias().filter({ m => self.puedeInscribirse(m) })
  }
}