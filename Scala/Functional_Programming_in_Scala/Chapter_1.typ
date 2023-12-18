#set page(margin: 1.75in)
// #set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
#set par(leading: 0.55em, justify: true)
#set text(font: "New Computer Modern")
#show raw: set text(font: "New Computer Modern Mono")
#show par: set block(spacing: 1.4em)
#show heading: set block(above: 1.4em, below: 1em)


= Capítulo 1: Qué es programación funcional?

== Conceptos y observaciones

/ Expresión transparente referencialmente: Decimos que una expresión $e$ tiene, cumple o satisface _transparencia referencial (RT)_ si, para todo programa $p$, todas las ocurrencias de $e$ en $p$ pueden ser reemplazadas por el resultado de evaluar $e$ sin afectar el significado de $p$.

/ Función pura : Una función $f$ es pura si la expresión $f(x)$ es RT para toda expresión $x$ RT.

== Conclusiones

El diseño funcional permite que los programas sean pensados y diseñados de una forma mucho más modular y local gracias a la transparencia referencial. Cuando una función debe ser modificada o símplemente comprendida, no es necesario simular mentalmente secuencias de actualizaciones de estado. El entendimiento se limita a un _razonamiento local_ en donde todo lo que importa es la entrada y salida de la función. Además de esto, y gracias a que el código no tiene efectos laterales, el código se limita a ser una serie de composiciones.

Garantizar tales cosas hacen que las labores de testeo, revisión y modificación del código se vuelvan radicalmente más sencillas, aumentando la mantenibilidad y vida del código.
