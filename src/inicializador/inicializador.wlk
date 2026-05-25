import src.carrera.*
import src.materia.*

object derecho {
    const latin        = new Materia(nombre = "Latín", correlativas = [], cupo = 30)
    const romano       = new Materia(nombre = "Derecho Romano", correlativas = [], cupo = 30)
    const historia     = new Materia(nombre = "Historia del Derecho Argentino", correlativas = [], cupo = 30)
    const penal1       = new Materia(nombre = "Derecho Penal 1", correlativas = [], cupo = 30)
    const penal2       = new Materia(nombre = "Derecho Penal 2", correlativas = [penal1], cupo = 30)
    const laCarrera    = new Carrera(nombre = "Derecho", listadoDeMaterias = [latin, romano, historia, penal1, penal2])

    method carrera()  = laCarrera
    method latin()    = latin
    method romano()   = romano
    method historia() = historia
    method penal1()   = penal1
    method penal2()   = penal2
}

object programacion {
    const elementos    = new Materia(nombre = "Elementos de Programación", correlativas = [], cupo = 30)
    const matematica   = new Materia(nombre = "Matemática 1", correlativas = [], cupo = 30)
    const objetos1     = new Materia(nombre = "Objetos 1", correlativas = [], cupo = 30)
    const objetos2     = new Materia(nombre = "Objetos 2", correlativas = [objetos1, matematica], cupo = 30)
    const objetos3     = new Materia(nombre = "Objetos 3", correlativas = [objetos2], cupo = 30)
    const trabajoFinal = new Materia(nombre = "Trabajo Final", correlativas = [], cupo = 30)
    const baseDeDatos  = new Materia(nombre = "Bases de Datos", correlativas = [], cupo = 30)
    const laCarrera    = new Carrera(nombre = "Programación", listadoDeMaterias = [elementos, matematica, objetos1, objetos2, objetos3, trabajoFinal, baseDeDatos])

    method carrera()       = laCarrera
    method elementos()     = elementos
    method matematica()    = matematica
    method objetos1()      = objetos1
    method objetos2()      = objetos2
    method objetos3()      = objetos3
    method trabajoFinal()  = trabajoFinal
    method baseDeDatos()   = baseDeDatos
}

object medicicna {
    const quimica   = new Materia(nombre = "Química", correlativas = [], cupo = 30)
    const biologia1 = new Materia(nombre = "Biología 1", correlativas = [], cupo = 30)
    const biologia2 = new Materia(nombre = "Biología 2", correlativas = [biologia1], cupo = 30)
    const anatomia  = new Materia(nombre = "Anatomía General", correlativas = [], cupo = 30)
    const laCarrera = new Carrera(nombre = "Medicina", listadoDeMaterias = [quimica, biologia1, biologia2, anatomia])

    method carrera()   = laCarrera
    method quimica()   = quimica
    method biologia1() = biologia1
    method biologia2() = biologia2
    method anatomia()  = anatomia
}
