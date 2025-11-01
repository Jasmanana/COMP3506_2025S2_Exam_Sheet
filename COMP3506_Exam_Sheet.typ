// #import "@preview/codly:1.2.0": *
// #show: codly-init

// #import "@preview/codly-languages:0.1.8": *
// #codly(languages: codly-languages)

#import "@preview/algo:0.3.6": algo, i, d, comment, code

#set page(paper: "a4", margin: (x: 20pt, y: 20pt), columns: 2)
#set text(font: "Cantarell", size: 8.5pt)
#set par(justify: true, spacing: 1em)
#set list(indent: 2em)
#set table(align: horizon)
// #set raw(lang: "java", theme: "latte.tmTheme")

// #show raw: set text(font: "JetBrainsMono Nerd Font")
#show heading: smallcaps
#show heading: set block(below: 8pt)
#show heading: set align(center)
#show heading: set text(font: "Cabin", size: 9pt, weight: "extrabold", luma(75))
#show emph: set text(font: "Noto Sans", fill: luma(125))
#show table: set align(center)
#show table: set text(size: 7.5pt)

#let strokeDict = (top: 1pt + luma(150)) // for section borders

#let customAlgo(title, params, body) = {
  let small-params = params.map(p => text(font: "Cabin", size: 8pt)[#p])
  let monoFont = "JetBrainsMono NF"
  show math.equation: set text(font: monoFont)
  algo(
    title: [
      #set text(font: "Cabin", size: 9pt)
      #smallcaps(title)
    ],
    parameters: small-params,
    comment-prefix: [#sym.triangle.stroked.r ],
    comment-styles: (fill: rgb(100%, 0%, 0%), font: monoFont, size: 7pt),
    line-numbers: false,
    indent-size: 10pt,
    indent-guides: 0.5pt + luma(200),
    row-gutter: 5pt,
    column-gutter: 0pt,
    inset: 4pt,
    stroke: 0pt,
    main-text-styles: (font: monoFont, size: 8pt),
    block-align: center,
    fill: luma(250),
    body
  )
}

// COLOUR THEME !
#let cTheme = (
  c1: rgb("#1E3A8A"),
  c2: rgb("#1F6F5F"),
  c3: rgb("#1F8E8F"),
  c4: rgb("#6A3FB3"),
  c5: rgb("#B23A8A"),
  c6: rgb("#A73636")
)

= #text("Algorithmic Analysis", fill: cTheme.c1)

#text("Big O:", weight: "bold", fill: cTheme.c1) 
$f(n) in O(g(n)) <--> exists c in RR, n_0 in ZZ^(>=0) text("s.t.") forall n >= n_0, f(n) <= c dot g(n)$

#text("Big " + $Omega$ + ":", weight: "bold", fill: cTheme.c1)
$f(n) in Omega(g(n)) <--> exists c in RR, n_0 in ZZ^(>=0) text("s.t.") forall n >= n_0, f(n) >= c dot g(n)$

#text("Big " + $Theta$ + ":", weight: "bold", fill: cTheme.c1) $f(n) in Theta(g(n)) <--> f(n) in O(g(n)) and f(n) in Omega(g(n))$

$ <--> exists c_1, c_2 in RR, n_0 in ZZ^(>=0) text("s.t.") forall n >= n_0, c_1 dot g(n) <= f(n) <= c_2 dot g(n) $

#text("Growth Rates:", weight: "bold", fill: cTheme.c1) $1 -> log(n) -> n -> n log(n) -> n^2 -> n^3 -> c^n -> n!$

#rect(width: 100%, height: 0%, stroke: strokeDict, inset: 0%, outset: 0%)

= #text("Recursion Analysis", fill: cTheme.c2)

#text("Case 1: ", weight: "bold", fill: cTheme.c2) work per call follows pattern - $T(n) = T(n-1) + O(1)$

#text("Case 2: ", weight: "bold", fill: cTheme.c2) work per level is the same - $T(n) = 2 T(n / 2) + O(n)$

#text("Case 3: ", weight: "bold", fill: cTheme.c2) work per call is the same - $T(n) = 2 T(n - 1) + O(1)$

#rect(width: 100%, height: 0%, stroke: strokeDict, inset: 0%, outset: 0%)

= #text("Sorting Algorithms", fill: cTheme.c3)

#table(
  columns: 4,
  table.header(
    [#text("Sort", weight: "bold", fill: cTheme.c3)],
    [#text("Worst", weight: "bold", fill: cTheme.c3)],
    [#text("Best", weight: "bold", fill: cTheme.c3)],
    [#text("Expected", weight: "bold", fill: cTheme.c3)],
  ),
  [Bubble $A[i] attach(<->, t: #par(emph(text("swap")), spacing: 0em)) A[i+1]$], [$O(n^2)$], [$O(n)$ _pre-sorted_], [$O(n^2)$],
  [Insertion _by next unsorted_], [$O(n^2)$], [$O(n)$ _pre-sorted_], [$O(n^2)$],
  [Selection _by smallest_], [$O(n^2)$], [$O(n)$ _pre-sorted_], [$O(n^2)$],
  [Merge], [$O(n log n)$], [$O(n log n)$], [$O(n log n)$],
  [Quick _3-partition_], [$O(n^2)$], [$O(n)$ _uniform list_], [$O(n log n)$],
  [Radix], [$O(d(n + N))$], [$O(d(n + N))$], [$O(d(n + N))$]
)

#rect(width: 100%, height: 0%, stroke: strokeDict, inset: 0%, outset: 0%)

= #text("Data Structures", fill: cTheme.c4)

#text("Amortisation: ", weight: "bold", fill: cTheme.c4) $T(n) div n$, where $n =$ no. of operations



#pagebreak()

= Other

test

// #customAlgo(text("BinarySearch", fill: cTheme.c2), ("A, l, r",), [
//     *Input:* a sorted array, $A$\
//     *Output:* whether $k$ exists between $A[l]$ and $A[r]$\
//     if $r < l$ then #i\
//       return false #d\
//     $m <- floor(text(l + r)) div 2$\
//     if $A[m] > k$ then #i\
//       return binarySearch($A, l, m - 1, k$) #d\
//     else if $A[m] < k$ then #i\
//       return binarySearch($A, m + 1, r, k$) #d\
//     else #i\
//       return true
//   ]
// )