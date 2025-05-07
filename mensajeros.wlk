//Primera parte
//Lugares
object paquete {
  var destino = puenteDeBrooklyn
  var pagado = true
  method puedeSerEntregado(mensajero) = self.estaPago() && destino.dejarPasar(mensajero)
  method estaPago() = pagado
  method noEstaPago() {
    pagado = false
  }
  method destino(nuevo) {
    destino = nuevo
  }
  method precio() = 50
}
object puenteDeBrooklyn {
  method dejarPasar(mensajero) = mensajero.peso() < 1000
}
object laMatrix {
  method dejarPasar(mensajero) = mensajero.puedeLlamar()
}

//Mensajeros
object roberto {
  var property vehiculo = bicicleta
  const peso = 90
  method peso() = peso + vehiculo.peso()
  method viajaEn(algo){
    vehiculo = algo
  }
  method puedeLlamar() = false
}
object chuckNorris {
  method peso() = 80
  method puedeLlamar() = true 
}
object neo {
  var tieneCredito = false
  method hablar() {
    tieneCredito = true
  }
  method noHablar() {
    tieneCredito = false
  }
  method peso() = 0
  method puedeLlamar() = tieneCredito
}


//Vehiculos
object bicicleta {
  method peso() {
    return 5
  }
}
object camion {
  var property acoplados = 1
  method peso() = acoplados * 500
  method agregarAcoplado() {
    acoplados = acoplados + 1
  }
}

//Tercera parte
object paquetito {
  method puedeSerEntregado(mensajero) = true
  method estaPago() = true
  method precio() = 0
}
object paquetonViajero {
  const destinos = [laMatrix, puenteDeBrooklyn]
  var property pagado = 0
  method puedeSerEntregado(mensajero) = self.estaPago() && self.puedePasarPorTodos(mensajero)
  method estaPago() = pagado >= self.precio()
  method puedePasarPorTodos(mensajero) = destinos.all{d => d.dejarPasar(mensajero)}
  method precio() = destinos.size() * 100
  method pagar(importe) {
    pagado = pagado + importe
  }
}

//Agregado de punto 9
object jackSparrow {
  method peso() = 85
  method puedeLlamar() = false
}
object mensajeEnBotella {
  method puedeSerEntregado(mensajero) = true
  method estaPago() = true
  method precio() = 0
}