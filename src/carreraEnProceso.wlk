import src.materia.*

class CarreraEnProceso{
    var property carrera
    var property materiasAprobadas=[]
    var materiasInscriptas=[]

    method tieneAprobada(materia) = materiasAprobadas.any({ mcon => mcon.materia() == materia })

    method estaInscripto(materia) = materiasInscriptas.contains(materia)

    method agregarInscripcion(materia) {
        materiasInscriptas.add(materia)
    }

    method quitarInscripcion(materia) {
        materiasInscriptas.remove(materia)
    }

    method registrarAprobada(materia, nota) {
        if (self.tieneAprobada(materia))
            throw new Exception(message = "El estudiante ya tiene aprobada la materia " + materia.nombre())
        materiasAprobadas.add(new MateriaConNota(materia = materia, nota = nota))
    }
}
