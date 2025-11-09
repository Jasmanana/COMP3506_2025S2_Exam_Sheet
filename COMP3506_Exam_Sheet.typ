// #import "@preview/codly:1.2.0": *
// #show: codly-init

// #import "@preview/codly-languages:0.1.8": *
// #codly(languages: codly-languages)

#import "@preview/algo:0.3.6": algo, i, d, comment, code
// #import "@preview/arborly:0.3.2": tree

#set page(paper: "a4", margin: (x: 20pt, y: 20pt), columns: 2)
#set text(font: "Cantarell", size: 8.5pt)
#set par(justify: true, spacing: 1em)
#set list(indent: 2em)
#set enum(indent: 2em)
#set table(align: horizon, stroke: 0.5pt)
#set grid(column-gutter: 2em, row-gutter: 0.5em, align: center)

// #set raw(lang: "java", theme: "latte.tmTheme")

#show raw: set text(font: "JetBrainsMono Nerd Font", size: 7.5pt)
#show heading: content => {
  set block(below: 8pt, above: 6pt)
  set align(center)
  set text(font: "Cabin", size: 9pt, weight: "extrabold", luma(75))
  line(length: 100%, stroke: 0.5pt + luma(100))
  smallcaps(content)
}

#show emph: set text(font: "Noto Sans")
#show table: set align(center)
#show table: set text(size: 7.5pt)
#show grid: set par(spacing: 0.25em)

#let customAlgo(title, params, body) = {
  let small-params = params.map(p => text(font: "Cabin", size: 8pt)[#p])
  // let monoFont = "JetBrainsMono NF"
  // show math.equation: set text(font: monoFont)
  algo(
    title: [
      #set text(font: "Cabin", size: 9pt)
      #smallcaps("Algorithm " + title)
    ],
    parameters: small-params,
    comment-prefix: [#sym.triangle.stroked.r ],
    // comment-styles: (fill: rgb(100%, 0%, 0%), font: monoFont, size: 7pt),
    line-numbers: false,
    indent-size: 10pt,
    indent-guides: 0.5pt + luma(200),
    row-gutter: 5pt,
    column-gutter: 4em,
    inset: 4pt,
    // stroke: 0pt,
    // main-text-styles: (font: monoFont, size: 8pt),
    block-align: center,
    body
  )
}

// COLOUR THEME !
#let cTheme = (
  c1: rgb("#1E3A8A"),
  c2: rgb("#4B3FB3"),
  c3: rgb("#7B3FB3"),
  c4: rgb("#B23A8A"),
  c5: rgb("#1F6F5F"),
  c6: rgb("#2ba5bb")
)

= #text(fill: cTheme.c1)[Algorithmic Analysis]

#text("Big O:", weight: "bold", fill: cTheme.c1) 
$f(n) in O(g(n)) <--> exists c in RR, n_0 in ZZ^(>=0) text("s.t.") forall n >= n_0, f(n) <= c dot g(n)$

#text("Big " + $Omega$ + ":", weight: "bold", fill: cTheme.c1)
$f(n) in Omega(g(n)) <--> exists c in RR, n_0 in ZZ^(>=0) text("s.t.") forall n >= n_0, f(n) >= c dot g(n)$

#text("Big " + $Theta$ + ":", weight: "bold", fill: cTheme.c1) $f(n) in Theta(g(n)) <--> f(n) in O(g(n)) and f(n) in Omega(g(n))$

$ <--> exists c_1, c_2 in RR, n_0 in ZZ^(>=0) text("s.t.") forall n >= n_0, c_1 dot g(n) <= f(n) <= c_2 dot g(n) $

#text("Growth Rates:", weight: "bold", fill: cTheme.c1) $1 -> log(n) -> n -> n log(n) -> n^2 -> n^3 -> c^n -> n!$

= #text("Recursion Analysis", fill: cTheme.c2)

#text("Case 1: ", weight: "bold", fill: cTheme.c2) work per call follows pattern - $T(n) = T(n-1) + O(1)$\
#text("Case 2: ", weight: "bold", fill: cTheme.c2) work per level is the same - $T(n) = 2 T(n / 2) + O(n)$\
#text("Case 3: ", weight: "bold", fill: cTheme.c2) work per call is the same - $T(n) = 2 T(n - 1) + O(1)$

= #text(fill: cTheme.c3)[Sorting Algorithms]

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

= #text(fill: cTheme.c4)[Basic Data Structures]

#text("Amortisation: ", weight: "bold", fill: cTheme.c4) $T(n) div n$, where $n =$ no. of operations

#table(
  columns: 5,
  [],
  [#text(emph("SPACE"), fill: cTheme.c4)],
  [#text(emph("get"), fill: cTheme.c4)],
  [#text(emph("add"), fill: cTheme.c4)],
  [#text(emph("remove"), fill: cTheme.c4)],

  [#text("Dynamic Array", weight: "bold", fill: cTheme.c4)], [$O(n)$], [$O(1)$], [$O(n)$\*], [$O(n)$], 
  [#text("Linked List", weight: "bold", fill: cTheme.c4)], [$O(n)$], [$O(1)$], [$O(n)$], [$O(n)$], 

  // STACK
  [#text("Stack - LIFO", weight: "bold", fill: cTheme.c4)],
  table.cell(colspan:2, text(emph("SPACE: "), fill: cTheme.c4) + $O(n)$), [$O(1)^1$], [$O(1)$], 
  
  // QUEUE
  [#text("Queue - FIFO", weight: "bold", fill: cTheme.c4)],
  table.cell(colspan:2, text(emph("SPACE: "), fill: cTheme.c4) + $O(n)$), [$O(1)$], [$O(1)$], 
  
  // table notes
  table.cell(colspan: 5, align: left, inset: 3pt, emph(text(super("1") + " amortised if array-based implementation")))
)

= #text("Binary Trees", fill: cTheme.c5)

#text("Proper Binary Tree: ", weight: "bold", fill: cTheme.c5) internal nodes have exactly 2 children \
#text("Complete Binary Tree: ", weight: "bold", fill: cTheme.c5) levels $0 -> h - 1$ full, level $h$ left-most

#table(
  columns: 3,
  table.header(
    [#text("Pre-Order", weight: "bold", fill: cTheme.c5)],
    [#text("In-Order", weight: "bold", fill: cTheme.c5)],
    [#text("Post-Order", weight: "bold", fill: cTheme.c5)],
  ),
  [self $->$ left $->$ right], [left $->$ self $->$ right], [left $->$ right $->$ self]
)

#text("Properties:", weight: "bold", fill: cTheme.c5)
- Full level $l$ has $2^l$ nodes (note $l >= 0$)
- Max no. of nodes = $2^(l_"MAX") - 1$, max internal nodes = $2^(l_"MAX" - 1) - 1$
- $h$ = no. of edges from lowest leaf = $floor(log_2 n)$\
  \u{26A0} _care with null leaves in implementation vs. conceptual tree_
- $l$ & $d$ use 0-based index.

= #text(fill: cTheme.c6)[Heaps & Priority Queues]

#text("Binary Heap: ", weight: "bold", fill: cTheme.c6) complete binary tree with heap property order
#align(center, text($k e y (n o d e) <= k e y ( p a r e n t (n o d e))$ + " OR " + $k e y (n o d e) >= k e y ( p a r e n t (n o d e))$))

#text("Insertion: ", weight: "bold", fill: cTheme.c6) insert at last node location then *upHeap* - 
1. Check $k < p a r e n t and k != r o o t$
2. Swap $k <--> p a r e n t_text("greater than current")$
3. Repeat until $k >= p a r e n t or k = r o o t --> O(log n)$

#text("RemoveMin: ", weight: "bold", fill: cTheme.c6) swap root $<-->$ last node then *downHeap* - 
1. Check $k > c h i l d_text("left or right")$
2. Swap $k <--> c h i l d_text("less than current")$
3. Repeat until $k > c h i l d_text("both") or k = l e a f --> O(log n)$

#text("Array-Based: ", weight: "bold", fill: cTheme.c6) left child @ $2i+1$ & right child @ $2i+2$

#text("Heap Sort: ", weight: "bold", fill: cTheme.c6) for $a$ in $A ->$ add to heap $->$ removeMin back to $A$

#text("Bottom Up Heap Construction: ", weight: "bold", fill: cTheme.c6) get $l_text("MAX") = floor(log_2 n) ->$ get no. of leaves on bottom level (fill remaining with nulls) $->$ add nodes to merge heaps

= #text(fill: cTheme.c1)[Maps - Hash Tables]

#text("General Summary: ", weight: "bold", fill: cTheme.c1) pre-hash $->$ compress $->$ handle collisions $->$ rehash

#text("Complexities: ", weight: "bold", fill: cTheme.c1) $O(1)$ expectation, $O(n)$ worst-case

#text("Pre-hash to " + emph("Hash Code") + ": ", weight: "bold", fill: cTheme.c1) 
- Component sum: e.g. sum of all char in string (collision risk)
- Polynomial accumulation: $p(z) = a_0 z^0 + a_1 z^1 + ... space z in ZZ$
- Cyclic shift: replace $z$ with bit-shifted version (e.g. $z << 5$)

#text("Compress to " + emph("Hash Value") + ": ", weight: "bold", fill: cTheme.c1) fow below, $N =$ table size $ and N in ZZ^(text("prime"))$
- Division: $h(k) = k mod N$
- MAD: $h(k) = ((a k + b) mod p) mod N$\
  $p > N and p in ZZ^(text("prime")), a in [1, p - 1], b in [0, p - 1]$

#text("Collision Handling: ", weight: "bold", fill: cTheme.c1) separate chaining vs. open addressing
- Probe idx computed as $(h(k) + f(i)) mod N$ for $i = 0, 1, 2...$
- 1st probe is just $h(k)$ hence $i=0$ for open addressing, below:
#table(
  columns: 4,
  table.header(
    [],
    [#text("Linear", weight: "bold", fill: cTheme.c1)],
    [#text("Quadratic", weight: "bold", fill: cTheme.c1)],
    [#text("Double Hash", weight: "bold", fill: cTheme.c1)],
  ),
  [#text(fill: cTheme.c1)[$f(i)$]],
  [$i$],
  [$i^2$],
  [$i times d(k)$]
)

#text(weight: "bold", fill: cTheme.c1)[Load Factor $alpha = n / N$] $-> 0.8 <= alpha <= 1$ chaining & $alpha < 2/3$ open addressing

- Expected no. of probes = $1 / (1 - alpha)$

= #text(fill: cTheme.c2)[Search Trees]

#text(weight: "bold", fill: cTheme.c2)[BST: ] $O(log n)$ expected get, add, remove (in-order traversal), $O(n)$ worst
#align(center, rect(image("images/BST_Deletion.jpg", width: 65%), stroke: 1pt, inset: 0.5pt))

#text(weight: "bold", fill: cTheme.c2)[AVL Trees:] BST that doesn't degrade to $O(n)$
- Insertion: re-balance at *first* unbalanced node from bottom
- Deletion: after BST deletoin, re-balance upwards from bottom
- Tri-node inputs: parent, child + grandchild of greater height
#align(center, rect(image("images/AVL_Double_Rotation.jpg"), stroke: 1pt, inset: 0.5pt))

#text(weight: "bold", fill: cTheme.c2)[Splay Trees:] $O(n)$ worst, $<O(log n)$ best (popular nodes), $O(log n)^*$
- `get(K)` - splay found node, or last accessed node before null leaf
- `insert(K,V)` - splay inserted/updated node
- `remove(K)` - splay original parent of removal node

// #table(
//   columns: 2,
//   table.header(
//     [#text("Method", weight: "bold", fill: cTheme.c2)],
//     [#text("Splay", weight: "bold", fill: cTheme.c2)],
//   ),
//   [get(K)], [#align(left)[Found node, or the last accessed node before null leaf)]],
//   [insert(K, V)], [#align(left)[Inserted/updated node]],
//   [remove(K)], [#align(left)[Original parent of removal node]]
// )
#align(center, rect(image("images/Splay_ZIG.png", width: 55%), stroke: 1pt, inset: 0.5pt))
#align(center, rect(image("images/Splay_ZIGZIG.png", width: 70%), stroke: 1pt, inset: 0.5pt))
#align(center, rect(image("images/Splay_ZAGZIG.png", width: 70%), stroke: 1pt, inset: 0.5pt))


#pagebreak()

= #text("ADT Methods", fill: cTheme.c1)


#grid( //  STACK
  columns: (15%, auto, auto, auto),
  grid.cell(rowspan: 2, text("Stack", weight: "bold", fill: cTheme.c1), align: left + horizon),
  [`push(V)`], [`pop()`], [`top()` or `peek()`]
)

#grid( //  QUEUE
  columns: (15%, auto, auto, auto),
  grid.cell(rowspan: 2, text("Queue", weight: "bold", fill: cTheme.c1), align: left + horizon),
  [`enqueue(V)`], [`dequeue()`], [`front()` or `peek()`]
)

#grid( //  PQ
  columns: (15%, auto, auto, auto),
  grid.cell(rowspan: 2, text("Priority Q", weight: "bold", fill: cTheme.c1), align: left + horizon),
  [`insert(K, V)`], [`removeMin()`], [`min()`]
)

#grid( //  Entry
  columns: (15%, auto, auto, auto),
  grid.cell(rowspan: 2, text("Entry", weight: "bold", fill: cTheme.c1), align: left + horizon),
  [`getKey()`], [`getValue()`], [`compareTo(Entry)`]
)

#grid( // Map 
  columns: (15%, auto, auto, auto),
  grid.cell(rowspan: 2, text("Map", weight: "bold", fill: cTheme.c1), align: left + horizon),
  [`get(K)`], [`put(K, V)`], [`remove(K)`],
  [`entrySet()`], [`keySet()`], [`values()`]
)



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