#import "template.typ": *
#import "@preview/mitex:0.2.6": mitex
#import "@preview/cmarker:0.1.8"

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.

#show: project.with(
  title: "Notas: el operador aniquilador",
  authors: (
    "Daniel Pi",
  ),
  date: datetime.today().display("[day] / [month] / [year]"),
)

// #outline()

#import "tasks.typ": *
// I made this module for pretty-typing my todo's


#task(
  [=== Por hacer],
  [
    Notas sobre el método del aniquilador.

    + #todo Teoremas 4.1.6 y 4.1.7 (¿qué son y qué hacen?).
    + #todo Probar la factorización del operador lineal
        y de la derivada.
    + #done Probar/deducir el aniquilador.
      - Conceptualmente definido, es una idea _simple_.
  ]
)

= El operador aniquilador

Si $L$ es un operador lineal diferencial y $f(x)$ una función
suficientemente diferenciable tal que $L[ f(x) ] = 0$, entonces
se dice que $L$ es un *aniquilador* de $f$.

Por ejemplo, la función constante $k$ es aniquilada con el
operador $D$ (una sola diferenciación) mientras que $y=x$
se aniquila con $D^2$.

Asimismo, se puede generalizar para un orden $n$ que $D^n$ es
aniquilador para las funciones:

$
  { 1, x, x^2, dots, x^(n-1) }
$ <set_fn>

Como consecuencia de lo anterior, podemos probar que el $D^n$
es de hecho aniquilador de una combinación lineal del conjunto
de funciones que tenemos en @set_fn, dicha combinación es
denotada como:

$
  c_0 + c_1 x + c_2 + x^2 + dots + c_(n-1) x^(n-1)
$

Como regla general, para una expresión polinomial se determina
el aniquilador con el mayor grado del polinomio. @zill

#quote(
[Hasta aquí llegué yo]
)

#bibliography("zill.yaml")

