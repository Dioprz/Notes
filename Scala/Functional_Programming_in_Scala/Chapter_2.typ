#set page(margin: 1.75in)
// #set par(leading: 0.55em, first-line-indent: 1.8em, justify: true)
#set par(leading: 0.55em, justify: true)
#set text(font: "New Computer Modern")
#show par: set block(spacing: 1.4em)
#show heading: set block(above: 1.4em, below: 1em)

#show raw.where(block: false): box.with(
  fill: luma(220),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 0pt,
)


= Capítulo 2: Comenzando con la FP en Scala

== Conceptos y observaciones

/ Objects: En Java se suelen utilizar clases anónimas para crear rápidamente una instancia de una clase (la clase anónima) que implemente una interfaz. Este comportamiento se puede simular al que tienen los `object` en Scala. Estos `object` corresponden formalmente a un _tipo_ singleton, pero pueden entenderse como clases que tienen una única instancia.

#block(inset: 10pt)[_Nota_: Estos `object` permiten asemejar el comportamiento de la keyword `static` de Java, en Scala.]


- Conforme la complejidad de un proyecto crece, se hace inviable gestionar la compilación (scalac) y administración de cada uno de los archivos del proyecto. Para cubrir esta necesidad se suele usar el Scala Build Tool (_sbt_), que tras declarar y configurar su archivo, trackea y compila apropiadamente los archivos.

- Scala no tiene nociones especiales de _operadores_, y a efectos prácticos, *todo*  es un objeto (no hay primitivos como en Java, por ejemplo). Por lo tanto `2 + 1` no es más que azucar sintáctico para `2.+(1)`. 

- Los métodos unarios pueden usar notación infija. Si `abs` calcula el valor absoluto, `abs(42) == abs 42`.

- La noción de _namespace_ corresponde a ver cada nombre en la notación clásica de punto (`Object1.Object2.val`), como un espacio que almacena _miembros_. Así, en la expresión `Object1.Object2.val`, `Object2` tiene como _namespace_ `Object1` ya que es un miembro de él. Así mismo, `val` tiene como _namespace_ a `Object1.Object2` y es miembro de `Object2` (y, posiblemente, de `Object1` también).
  
  Un objeto cuya única finalidad es ser el namespace de un conjunto de miembros, es llamado _módulo_ (de aquí que tenga sentido llamar también módulo a los `object`).

- Es preferible hacer iteraciones mediante funciones recursivas que mediante loops o whiles. En Scala el performance de estos dos últimos es idéntico al obtenido por una función recursiva *cuando*  dicha función usa _tail recursion_. (Esto evita añadir llamados a la pila de llamadas (call stack)).

  El compilador de Scala es capaz de generar un error si una función que debería usar tail recursion, no la está haciendo. Para esto se usa la anotación (_annotation_) `@annotation.tailrec`.

== Conclusiones

- Los `object` de Scala son un 'shortcut' para crear una clase que se instancia inmediatamente.

- Las importaciones de un módulo completo usan la notación de variable anónima, por lo qué, para importar todos los miembros de un módulo, basta usar `import MyModule._`.
