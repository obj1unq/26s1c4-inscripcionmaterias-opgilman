class Materia{
    var property nombre
    var property correlativas=[]
    var property cupo
    const inscriptos=[]
    const listaDeEspera=[]

    method inscriptos() = inscriptos
    method listaDeEspera() = listaDeEspera

    method inscribir(legajo) {
        if (!legajo.puedeInscribirse(self))
            throw new Exception(message = "El estudiante no puede inscribirse a " + nombre)
        if (inscriptos.size() < cupo)
            self.confirmarInscripcion(legajo)
        else
            listaDeEspera.add(legajo)
    }

    method confirmarInscripcion(legajo) {
        inscriptos.add(legajo)
        legajo.agregarInscripcion(self)
    }

    method darDeBaja(legajo) {
        inscriptos.remove(legajo)
        legajo.quitarInscripcion(self)
        if (listaDeEspera.size() > 0) {
            const siguiente = listaDeEspera.first()
            listaDeEspera.remove(siguiente)
            self.confirmarInscripcion(siguiente)
        }
    }
}

class MateriaConNota{
    var property materia
    var property nota  
}