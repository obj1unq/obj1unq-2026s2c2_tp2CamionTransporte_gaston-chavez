## 4 Reflexionar sobre los conceptos

* Realizar un diagrama estático del sistema de objetos
Link diagrama estatico (descargar la imagen para mejor visualizacion): https://imgur.com/a/TlRGUWB


* Describir los polimorfismos asociados a las colecciones: 

   - ¿Qué nombre tiene el tipo de los objetos polimórficos?
      -Los nombres que tienen los objetos polimorfismos, son: Cosa, Modo, Camino

   - ¿Qué mensajes componen ese tipo?
      -El tipo "Cosa" compone los mensajes: peso(),nivelPeligrosidad(), bultos(), efectoDeCarga()
      -El tipo "Modo" compone los mensajes: nivelPeligrosidad(), transformar(), esAuto()
      -El tipo "Camino" compone los mensajes: puedeTransitar(vehiculo)
      -El tipo "Estado" compone los mensajes: peso(), nivelPeligrosidad(), bultos(), cargar(), descargar()

   - ¿Qué objetos son los emisores de los mensajes polimórficos?
      -Los objetos emisores son Camion, bumblebee Y bateriaAntiAerea

