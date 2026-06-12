#import "template.typ": *
#import "@preview/mitex:0.2.6": mitex
#import "@preview/cmarker:0.1.8"

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.

#show: project.with(
  title: "Ecuaciones diferenciales",
  authors: (
    "Semicircle Daniel",
  ),
  date: "6 de junio, 2026",
)

#outline()

= Ecuaciones diferenciales de orden superior

Una ecuación diferencial ordinaria de orden
$n$ es aquella expresada de la forma:

$
  a_(n) y^((n)) + a_(n-1) y^((n-1)) + dots +
  a_1 y' + a_0 y = g(x)
$ <n-eqdiff>

Una de las principales de resolver este tipo
de ecuaciones diferenciales en su forma no
homogénea es con el método de coeficientes
indeterminados.

== Método de coeficientes indeterminados

Este método consiste en dos pasos principales:

#set enum(numbering: "i)")

+ Encontrar la función complementaria, $y_c$
+ Encontrar una solución particular (denotada $y_p$).

Entonces, la solución general de la ecuación diferencial
no homogénea @n-eqdiff es entonces denotada por
$y = y_c + y_p$, en un intervalo $I$.

Para encontrar una ecuación complementaria es necesario
primero construir una ecuación a la que se denomina
_auxiliar_ la cual está dada en términos de la ecuación
diferencial como:

$
  a_(n) m^(n) + a_(n-1) m^(n-1) + dots +
  a_1 m + a_0 = 0
$ <auxiliar>

La ecuación @auxiliar es esencialmente el polinomio
asociado al sistema, y este tiene entonces $n$
soluciones posibles, las cuales se expresan en
la ecuación de la solución complementaria como:

$
  y_c =
  sum_(i)^(n) c_i e^( m_i x )
$

Como tratamos una ecuación _no homogénea_, entonces
tenemos que definir la solución particular como una
generalización de los coeficientes presentes en la
función $g(x)$ a la derecha de la ecuación diferencial.

De esta forma tendríamos algo como:

$
  y_p = cal(G) (x)
$ <y_p>

En donde $g(x) = cal(G) (alpha_1, dots, x)$, es decir, que
$g$ es una forma particular de una familia de funciones,
denotada por $cal(G)$. Dicho esto, entonces
$vec(alpha_1, alpha_2, dots)$ es un _vector_ con los
coeficientes particulares de $g$.

Usamos entonces la expresión general definida en @y_p y
la reemplazamos en el lado izquierdo de @n-eqdiff para
encontrar los coeficientes $cal(G)$.

$
  a_(n) y_p^((n)) + dots + a_1 y'_(p) + a_0 y_(p) = g(x)
$ <ec_particular>

Solucionamos para los coeficientes de $y_p$ en la
@ec_particular y de esta manera tenemos la solución
particular de la ecuación diferencial no homogénea.

=== Ejemplo 1
Nos es dado el sistema no homogéneo a resolver:
$y'' + 4 y' - 2 y = 2 x^2 -3 x + 6$. Proponer una
solución usando el método de coeficientes
indeterminados.

Primero, es necesario solucionar la ecuación homogénea
asociada al sistema que tenemos, es decir
$y'' + 4 y' - 2 y = 0$.

De la ecuación homogénea obtenemos su ecuación auxiliar y
obtenemos sus raíces. Esta ecuación auxiliar es:
$m^2 + 4 m - 2 = 0$, y sus raíces son
$m_(1,2) = -(2 plus.minus sqrt(6) )$.

Se denota entonces su solución complementaria como
$y_c = c_1 e^( -2 - sqrt(6) ) + c_2 e^( -2 +sqrt(6) )$.

Luego tomamos $g(x) = 2 x^2 - 3 x + 6$ y lo reescribimos
como la función general $cal(G)(x) = A x^2 + B x + C$.
Siguiendo el procedimiento en @y_p, sabemos que esta
función general es entonces $y_p = A x^2 + B x + C$.
Seguido de esto, calculamos sus derivadas y las
introducimos en la ecuación diferencial. Las derivadas son
$y'_p = 2 A x + B$ y $y''_p = 2 A$.

La ecuación diferencial se ve como
$(2 A) + 4 (2 A x + B) - 2 ( A x^2 + B x + C ) =
2 x^2 - 3 x + 6$ una vez sustituimos los términos de la
solución particular. Esto se reduce a encontrar los valores
de la tupla $A, B , C$ al reducir los términos semejantes
cada una de las variables. Luego de reducir términos en el
lado izquierdo, este nos quedaría como
$(-2 A) x^2 + (8 A - 2 B) x + (2 A + 4 B - 2 C) =
2 x^2 - 3 x + 6$. La ecuación nos arroja 3 resultados,
los cuales nos determinan los resultados para los
coeficientes: $cases(-2 A = 2, 8 A - 2 B = -3,2 A + 4 B - 2 C = 6)$
Del primero, deducimos el valor de
$A = -1$, luego este lo usamos para calcular $B = -5/2$ y
finalmente $C = -9$.

Por lo tanto la solución particular es $y_p = -x^2 - 5/2 x - 9$

=== Ejemplo 2
Tomamos la ecuación diferencial $y'' - 2 y' - 3 y =
4 x - 5 + 6 x e^(2 x)$. Resolver por superposición de
funciones.

Primero se resuelve la solución complementaria, $y_c$, como se
planteó antes. Se crea la ecuación auxiliar $m^2 - 2 m - 3 = 0$
y sus raíces son $m_1 = -1$ y $m_2 = 3$. Entonces, su solución
complementaria es $y_c = c_1 e^(-x) + c_2 e^(3 x)$.

Por su parte, en la solución particular debemos partir por
separar la función actual en 2 funciones de diferente tipo,
una polinomial y una exponencial, de manera que tengamos
$g(x) = g_1 (x) + g_2(x)$.
