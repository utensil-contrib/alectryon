Writing Alectryon documents for Lean 4 in Markdown with MyST
=============================================================

To compile this file, use the following command:

    $ alectryon literate_lean4_MyST.md # MyST → HTML, produces ‘literate_lean4_MyST.html’

Alectryon supports input files written in MyST (a Markdown variant) in addition to Lean 4 and reStructuredText.

```{raw} html
<style type="text/css"> .border { border: solid } </style>
```

In MyST, [Lean 4](https://github.com/leanprover/lean4) fragments are spelled as ```` ```{lean4} ````, with arguments on the same line and options below:

```{lean4}
/- Running Queries: -/

def x : Nat := 5
#reduce 5 + x

/- Documenting proofs: -/

theorem test (p q : Prop) (hp : p) (hq : q): p ∧ q ↔ q ∧ p := by
  apply Iff.intro
  . intro h
    apply And.intro
    . exact hq
    . exact hp
  . intro h
    apply And.intro
    . exact hp
    . exact hq
```

Or you can make use of the [`eval-rst`](https://myst-parser.readthedocs.io/en/latest/syntax/roles-and-directives.html#syntax-directives-parsing) directive:

```{eval-rst}
.. lean4::

   #eval Lean.versionString

   #eval Lean.versionStringCore

   #eval Lean.toolchain

   #eval Lean.origin

   #eval Lean.githash

```

Math is written either in Docutils math roles ({math}`e^{i\pi} = -1`) or in `$` signs with option ``dollarmath`` (see ``docutils.conf`` in this directory: $\cos(\pi) = -1$).  And unlike in reST, *built-in inline markup **nests**, including `code` and other roles like {lean4}`#eval Lean.versionString` or [links](https://myst-parser.readthedocs.io/en/latest/syntax/reference.html#extended-block-tokens)*.

Check below for more examples:

## Running queries

Alectryon captures the results of `#check`, `#eval`, and the like:

```{lean4}
def y : Nat := 5
#reduce 5 + y
```

By default, these results are folded and are displayed upon hovering or clicking.  We can unfold them by default using annotations or directives:

```{lean4}
#check Nat /- .unfold -/
```

```{lean4} unfold
#check Bool
#eval 1 + 1
```

Other flags can be used to control display, like ``.no-in``:

```{lean4}
#print Iff /- .unfold -/
```

```{lean4}
#print Iff /- .unfold .no-in -/
```

## Documenting proofs

Alectryon also captures goals and hypotheses as proofs progress:

```{lean4}
theorem test₂ (p q : Prop) (hp : p) (hq : q): p ∧ q ↔ q ∧ p := by
  apply Iff.intro
  . intro h
    apply And.intro
    . exact hq
    . exact hp
  . intro h
    apply And.intro
    . exact hp
    . exact hq
```



