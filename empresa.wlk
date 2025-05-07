import mensajeros.*
object empresaDeMensajeria {
  const property mensajeros = []
  const property enviados = []
  const property pendientes = []

  //Contratar
  method contratarMensajero(mensajero) {
    mensajeros.add(mensajero)
  }

  //Despedir
  method despedirMensajero(mensajero) {
    mensajeros.remove(mensajero)
  }

  //Despedir a todos
  method despedirATodosLosMensajeros() {
    mensajeros.clear()
  }
  
  //Mensajeria es grande
  method esGrande() = mensajeros.size() > 2
  
  //Puede entregar el paquete el primer mensajero
  method puedeEntregarElPrimerMensajero() = paquete.puedeSerEntregado(mensajeros.first())
  
  //Peso del ultimo mensajero
  method pesoDelUltimoMensajero() = mensajeros.last().peso()
  
  //TerceraParte
  //Al menos un mensajero puede entregar el paquete
  method puedeEntregar(unPaquete) = mensajeros.any{m => unPaquete.puedeSerEntregado(m)}

  //Quienes pueden entregar el paquete dado
  method quienesPuedenEntregar(unPaquete) = mensajeros.filter{m => unPaquete.puedeSerEntregado(m)}

  //Mensajeria con sobrepeso
  method pesoTotal() = mensajeros.sum{m => m.peso()}
  method tieneSobrepeso() = (self.pesoTotal() / mensajeros.size()) > 500

  //Empresa envia un paquete
  method enviar(unPaquete) {
    if(self.puedeEntregar(unPaquete)) {
      enviados.add(unPaquete)
    }
    else {
      pendientes.add(unPaquete)
    }
  }

  //Facturacion por todos los paquetes enviados
  method facturacion() = enviados.sum{p => p.precio()}

  //Enviar el conjunto de paquetes dados
  method enviarTodos(paquetesAEnviar) {
    paquetesAEnviar.forEach{p => self.enviar(p)}
  }

  //Encontrar el paquete pendiente mas caro y enviarlo
  method pendienteCaro() = pendientes.max{p =>p.precio()}
  method reenviarPendienteCaro() {
    const pendienteCaro = self.pendienteCaro()
    self.enviar(pendienteCaro)
    pendientes.remove(pendienteCaro)
  }
}