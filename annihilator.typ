#import "template.typ": *
// #import "@preview/mitex:0.2.6": mitex
// #import "@preview/cmarker:0.1.8"

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.

#show: project.with(
  title: "Notas: el operador aniquilador",
  authors: (
    "Daniel Pi",
  ),
  date: datetime.today().display("[day] / [month] / [year]"),
)

#outline()

#import "tasks.typ": *
// I made this module for pretty-typing my todo's


= Temas previos

== Ecuación homogénea

Una ecuación diferencial homogénea es aquella ecuación diferencial
de orden superior la cual es de la forma:

$
  a_n y^((n)) + a_(n-1) y^((n-1)) + dots + a_1 y' + a_0 y = 0
$ <homo>

... mientras que cualquier otra ecuación de orden superior
que mantenga igualdad con una expresión $g(x)$ es considerada
una ecuación diferencial _no homogénea_.

$
  a_n y^((n)) + a_(n-1) y^((n-1)) + dots + a_1 y' + a_0 y = g(x)
$ <no-homo>

Para poder resolver la ecuación diferencial en @no-homo es
necesario tomar su ecuación homogénea asociada en @homo.

Asimismo, es clave asumir siempre estas dos condiciones en
las soluciones de las ecuaciones diferenciales:

+ Todos los coeficientes función $a_(i) (x)$ y la $g(x)$ son
  continuas.
+ Que $a_(n) (x) eq.not 0$ para todo el intervalo.

@zill

#task(
  [=== Pendientes del 4.1.],
  [
    Definiciones conceptuales que debo continuar:

    + #todo Teorema 4.1.2
    + #todo Teoremas 4.1.6 y 4.1.7 (¿qué son y qué hacen?).
  ],
)

== El operador diferencial

Se le suele denotar en @zill al operador diferencial como la
derivada de una función dada, de forma que $(dif y)/(dif x)$
pasa a ser $D space y$. De forma general, este operador
puede denotar una $(dif^n y)/(dif x^n)$ como $D^n space y$.

Asimismo, definimos de forma generalizada a la forma polinomial
de la ecuación diferencial de orden $n$ como un operador lineal
$L$, o también, el operador _polinomial_.

$
  L = a_n D^n + a_(n-1) D^(n-1) + dots + a_1 D + a_0
$

=== El operador $L$ es *lineal*
Un operador $L$ se dice que es un operador lineal si se puede
probar que conserva la operación bajo las condiciones de suma
y de producto por un escalar, lo que en esencia es que
la operación se conserva bajo la operación con una combinación
lineal.

Invocamos la combinación lineal $v = alpha f(x) + beta g(x)$ y
hacemos la operación con $L$. Al operarlos obtenemos que hay
que probar $L [ alpha f(x) + beta g(x) ] = alpha L [ f(x) ] + beta L [g (x) ]$.

Dado que sabemos que $D$ tiene las propiedades:
$D [f + g (x) ] = D space f (x) + D space g (x)$ y
$D [c dot f(x) ] = c dot D space f(x)$,
entonces se puede probar que $L$ también hereda las propiedades,
y por ende es un operador lineal @zill.

#task(
  [=== Pendientes del operador lineal],
  [
    Conceptos específicos al operador lineal que puede que
    necesite.

    + #done Factorización del operador diferencial.
    + #done Probar que el operador $n$-diferencial es lineal.
    + #done Probar/deducir el aniquilador.
      - Conceptualmente definido, es una idea _simple_.
  ],
)

=== Ejemplos del operador $D$
Tomemos las siguientes ecuaciones diferenciales homogéneas
para construir un operador lineal dado para cada caso.

+ $y'' + 7 y' + 6 y = 0$
+ $y'' − 8 y' + 16 y = 0$
+ $y'' − 8 y' + 20 y = 0$
+ $y'' + 2 y = 0$
+ $y'' + 2 y' = 0$
+ $y'' − 2 y' + 37 y = 0$
+ $y'' − 2 y' + 2 y = 0$

Para construir cada caso observamos el grado de cada una de las
derivadas y respetando los coeficientes que acompaña cada término.
Entonces factorizamos los operadores:

+ $D^2 + 7 D + 6$
+ $D^2 − 8 D + 16$
+ $D^2 − 8 D + 20$
+ $D^2 + 2$
+ $D^2 + 2 D$
+ $D^2 − 2 D + 37$
+ $D^2 − 2 D + 2$

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

// Estoy usando el *editor* helix. Usando el servidor de Tinymist,
// que hace la edición de archivos .typ mucho mas sencilla.
// 
// Hasta aquí volví a llegar yo.

== Funciones generales $g(x)$

Estas funciones que suelen aparecer en el lado derecho de la
ecuación diferencial no homogéna también tienen un operador
$L$ que corresponde con ser su aniquilador.

=== Regla para polinomios
Todos los polinomios de grado $m < n$ son aniquilados por el
operador $D^n$, con $(m,n) in NN$.

Vemos que si tenemos el polinomio
$c_0 + c_1 x + dots + c_(n-1) x^(n-1)$, cada orden del operador D
aniquila uno de los términos. Es decir, $D$ es aniquilador para
$c_0$, $D^2$ lo es para $c_1 x$ y se puede generalizar que
$D^n$ es aniquilador del término $c_(n-1) x^(n-1)$. Asimismo,
recordamos que $D^n$ aniquila a todos los $k x^m$ cuyo $m < n$,
de forma que $D^n$ por su linearidad es aniquilador también de
la combinación lineal del conjunto de funciones de las que es
aniquilador.

$
  c_0 +& c_1 x +& c_2 x^2 +& dots +& c_(n-1) space x^(n-1)
  \
  D  quad& D^2  quad& D^3  quad& dots quad& D^n  
$

Esto significa que cualquier polinomio $P^n (x)$ puede ser
eliminado por un operador diferencial $D^(m)$ en que $m>n$, con
$(m,n) in NN$.

==== Función lineal
La función lineal es el caso particular de un polinomio de
grado 1, dada por la epxresión general $g(x) = a_0 + a_1 x$.
Su aniquilador es entonces $D^2$.

#bibliography("zill.yaml")
