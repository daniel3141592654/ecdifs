#import "template.typ": *
#import "@preview/mitex:0.2.6": mitex
#import "@preview/cmarker:0.1.8"

// Take a look at the file `template.typ` in the file panel
// to customize this template and discover how it works.

#show: project.with(
  title: "Problemas: ecuaciones diferenciales",
  authors: (
    "Daniel Pi",
  ),
  date: datetime.today().display("[day] / [month] / [year]"),
)

#outline()

#import "tasks.typ": *
// I made this module for pretty-typing my todo's

#task(
  [= Problemas],
  [
    Resuelve la siguiente ecuación diferencial por coeficientes
    indeterminados:

    + #done $y'' + 7 y' + 6 y = 18$
    + #done $y'' − 8 y' + 16 y = 24 x + 7$
    + #todo $y'' − 8 y' + 20 y = 200 x^2 − 65 x e^x$
    + #done $y'' + 2 y = − 18 x^2 e^(2 x)$
    + #todo $y'' + 2 y' = 2 x + 7 − e^(−2 x)$
    + #todo $y'' − 2 y' + 37 y = e^x cos(6 x)$
    + #todo $y'' − 2 y' + 2 y = e^(2 x) (cos x − 4 sin x)$
  ],
)

#let table1 = ```
|            $g(x)$ | Forma de $y_p$                 |
| ----------------- | ------------------------------ |
|         Constante | $A$                            |
|         $5x + 7$  | $Ax + B$                       |
|        $3x^2 - 2$ | $Ax^2 + Bx + C$                |
|       $x^3 -x +1$ | $Ax^3 + Bx^2 + Cx + D$         |
|       $\sin 4 x$  | $A \cos 4x +B \sin 4x$         |
|       $\cos 4 x$  | ...                            |
|       $e^{5x}$    | $A e^{5x}$                     |
|    $(9x-2)e^{5x}$ | $(Ax+B)e^{5x}$                 |
|    $x^2 e^{5x}$   | $(Ax^2 +Bx +C)e^{5x}$          |
|  $e^{3x} \sin 4x$ | $e^{3x}(A \cos 4x +B \sin 4x)$ |
|  $5x^2 \sin 4x$   | $(Ax^2+Bx+C)\cos 4x + (Dx^2 + Ex + F)\sin 4x$ |
| $x e^{3x}\cos 4x$ | $(Ax+B)e^{3x}\cos 4x + (Cx+D)e^{3x}\sin 4x$ |
```

#figure(
  cmarker.render(table1, math: mitex),
  caption: [Lista de funciones solución. Puede ser de ayuda.],
) <funciones>


= Soluciones

1.- Vamos a tratar de resolver esta ecuación con
mucha fe y confianza.

Nuestra ecuación diferencial está dada por:
$
  y'' + 7 y' + 6 y = 18
$ <primera>

Vemos que esta ecuación @primera tiene una forma _no homogénea_
en la que la función derecha es $g(x) = 18$, es decir, es
constante. De esta manera, su solución particular es
$y_p = A$, como todas sus derivadas son nulas, hacemos la
relación: $6 y_p = 18$ lo que implica que $y_p = 3$.

Para encontrar la solución complementaria, tomamos la ecuación
homogénea asociada y hallamos la ecuación auxiliar:

$
  m^2 + 7 m + 6 = 0
$ <aux1>

De esta hallamos sus raíces con _chicharronera_ y probamos que
la solución complementaria de @aux1 es $m_(1,2) = cases(-6, -1)$.
Por consiguiente, su solución complementaria es
$y_c = c_1 e^(-6 x) + c_2 e^(-x)$.

Por lo tanto la solución general es
$y = c_1 e^(-6 x) + c_2 e^(-x) + 3$.

2.- La ecuación diferencial a resolver es una no homogénea con
una lineal del lado derecho, expresada como:

$
  y'' − 8 y' + 16 y = 24 x + 7
$ <segunda>

Encontramos la ecuación auxiliar de esta ecuación @segunda y
la expresamos como $m^2 - 8 m + 16 = 0$, la cual tiene las
raíces $m_1 = m_2 = 4$. Como las raíces están repetidas,
la solución complementaria es de la forma $c_1 e^(m x) +
c_2 x e^(m x)$, por lo que sustituyendo las raíces esta
es $y_c = c_1 e^(4 x) + c_2 x e^(4 x)$.

Para la solución particular pasamos con la forma general de
la lineal, $y_p = A x + B$, de la cual calculamos sus
derivadas $y'_p = A$ y $y''_p = 0$.

Reemplazamos esto en la ecuación diferencial original, que nos
va a quedar en $-8 A + 16 A x + 16 B = 24 x + 7$. Agrupamos los
términos semejantes y obtenemos la expresión

$
  16 A x + 16 B - 8 A = 24 x + 7
$ <part2>

De @part2 deducimos que $16 A = 24$ y que por lo tanto el valor
de $A = 3/2$, también se deduce que $16 B - 8 A = 7$ y
sustituyendo $A$ en la expresión tenemos $B = 19/16$.
La solución particular es $y_p = 3/2 x + 19/16$

Por lo tanto la solución general es
$y = c_1 e^(4 x) + c_2 x e^(4 x) + 3/2 x + 19/16$

3.- La ecuación diferencial que ahora concierne resolver requiere
el uso de la superposición de funciones para poder expresar el
lado derecho de la igualdad. Esta ecuación es dada por:

$
  y'' − 8 y' + 20 y = 200 x^2 − 65 x e^x
$ <tercera>

Tomamos la ecuación auxiliar asociada a @tercera, la cual es
$m^2 - 8 m + 20 = 0$, sus raíces son _complejas_ y están dadas
por $m_(1,2) = 4 plus.minus 2 i$

De un corolario raro del Zill tenemos que para cualquier
solución complementaria compleja denotada por la forma
$y = C_1 e^(alpha + i beta) + C_2 e^(alpha - i beta)$ esta
se puede simplificar a una forma real, escrita como

$
  y = e^(alpha x) ( c_1 cos beta x + c_2 sin beta x )
$ <solreal>

Entonces con la fórmula de @solreal tenemos que la solución
complementaria de esta ecuación diferencial está dada en la
forma
$
  y_c = e^(4 x) ( c_1 cos 2 x + c_2 sin 2 x )
$ <complex_y>

Desde la @funciones podemos tomar las definiciones para la
solución particular compuesta con las funciones superpuestas,
puesto que agrupamos $g_1 (x) = 200 x^2$ y $g_2 (x) = -65 x e^x$
podemos escribir dicha solución particular como
$y_p = A x^2 + B x + C + e^x (D x + E)$.

...

4.- La cuarta ecuación diferencial está presentada como:

$
  y'' + 2 y = − 18 x^2 e^(2 x)
$ <cuarta>

Primero obtenemos su solución complementaria usando la ecuación
auxiliar asociada al sistema: $m^2 + 2 = 0$. Como vemos en la
ecuación, las raíces son $m_(1,2) = plus.minus sqrt(2) i$.
Entonces la solución complementaria es
$y_c = c_1 cos ( sqrt(2) x ) + c_2 sin ( sqrt(2) x )$.

Por su parte, la solución particular estará dada de tomar la
@funciones y encontrar la forma general para $g(x)$. Esta
función es $y_p = (A x^2 + B x + C) e^(2 x)$. Usamos esto
y sacamos sus derivadas.

$
  cases(
    y'_p = 2 A x^2 e^(2 x) + 2 A x e^(2 x) + 2 B x e^(2 x)
    + B e^(2 x) + 2 C e^(2 x),
    y''_p = 4 A x^2 e^(2 x) + 8 A x e^(2 x) + 4 B x e^(2 x)
    + 2 A e^(2 x) + 4 B e^(2 x) + 4 C e^(2 x)
  )
$ <derivadas4>

De @derivadas4 solamente necesitamos $y''_p$ y lo tomamos para
escribir la ecuación diferencial nuevamente
$4 A x^2 e^(2 x) + 8 A x e^(2 x) + 4 B x e^(2 x)
+ 2 A e^(2 x) + 4 B e^(2 x) + 4 C e^(2 x) +
2 e^(2 x) (A x^2 + B x + C) = -18 x^2 e^(2 x)$.
Reducimos los términos y tenemos la expresión:
$[6 A x^2 + (8 A + 6 B)x + 2 A + 4 B + 6 C] e^(2 x) = -
18 x^2 e^(2 x)$. Esta última tiene las igualdades
$cases(
  6 A = -18,
  8 A + 6 B = 0,
  2 A + 4 B + 6 C = 0
)$.
De aquí deducimos que $A = -3$, $B = 4$ y $C = -5/3$.

Por lo tanto la solución general es:
$
  y = c_1 cos(sqrt(2) x) + c_2 sin(sqrt(2) x)
  + (-3 x^2 + 4 x - 5/3 ) e^(2 x)
$

5.- Resolver la ecuación diferencial denotada por:

$
  y'' + 2 y' = 2 x + 7 − e^(−2 x)
$ <quinta>

Partimos de la ecuación @quinta para buscar primero su solución
complementaria por medio de su ecuación auxiliar asociada
$m^2 + 2 m = 0$. De esta hallamos las raíces factorizando $m$,
de modo que la ecuación queda como $m(m+2) = 0$. Las raíces
para $m$ son $m_1 = -2$ y $m_2 = 0$. Por lo tanto, la solución
complementaria es $y_c = c_1 e^(-2 x) + c_2$

Reescribirmos la función como una superposición de funciones en
su forma generalizada como $g_1 (x) = 2 x + 7$ y $g_2 (x) = -e^(-2 x)$.
De esta manera, tenemos la solución particular denotada por
$y_p = A x + B + C e^(-2 x)$.

! _Advertencia_: No sé resolver *esto*.
...

6.- Resolver la ecuación diferencial dada por:
$
  y'' − 2 y' + 37 y = e^x cos(6 x)
$ <six>

De la ecuación @six buscamos la solución complementaria con la
ecuación auxiliar asolciada. Esta es denotada por
$m^2 - 2 m + 37 = 0$. De esta cuadrática encontramos las raíces,
que son complejas y conjugadas, tal que $m_(1,2) = 1 plus.minus 6 i$.

Tomando de nuevo el resultado de la ecuación @solreal, escribimos la
solución complementaria como:

$
  y_c = e^(x) [ c_1 cos(6 x) + c_2 sin(6 x) ]
$

Tomamos la forma general de $g(x)$ lo que nos deja en la forma
$e^x [A cos(6 x) + B sin(6 x) ]$.

#task(
  [== Por hacer],
  [
    Será necesario bajar al Zill con tal de hallar:

    + #todo Solucionar los problemas 5 y 67.
    + #done ¿Qué hacer si se repiten varios términos
      de la solución particular con la complementaria?
      - RE: Usar el operador _aniquilador_.
    + #todo Solucionar este caso exacto.

  ],
)

Tengo más bien pocos ánimos de abrir ese *excelente* libro.

