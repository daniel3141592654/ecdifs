#import "/.calepin/calepin.typ": *



#show raw.where(block: true, lang: "typ", theme: auto): it => _without-raw-chunk-transforms(() => it)
#show raw.where(block: true, lang: "typst", theme: auto): it => _without-raw-chunk-transforms(() => it)
#show raw.where(block: true, lang: "python", theme: auto): it => if _disable-raw-chunk-transforms.get() { it } else { chunk-from-raw-plain("python", it) }
#show raw.where(block: true, lang: "r", theme: auto): it => if _disable-raw-chunk-transforms.get() { it } else { chunk-from-raw-plain("r", it) }
#show raw.where(block: true, lang: "mermaid", theme: auto): it => if _disable-raw-chunk-transforms.get() { it } else { chunk-from-raw-plain("mermaid", it) }
#show raw.where(block: true, lang: "dot", theme: auto): it => if _disable-raw-chunk-transforms.get() { it } else { chunk-from-raw-plain("dot", it) }
#show raw.where(block: true, lang: "tikz", theme: auto): it => if _disable-raw-chunk-transforms.get() { it } else { chunk-from-raw-plain("tikz", it) }
#show raw.where(block: true, lang: "d2", theme: auto): it => if _disable-raw-chunk-transforms.get() { it } else { chunk-from-raw-plain("d2", it) }

// Paged theme
#import "/.calepin/snippets/typst/code-block.typ": code-block

#show raw.where(block: true): it => {
  if sys.inputs.at("calepin-target", default: "paged") == "html" {
    it
  } else if it.theme != auto {
    it
  } else {
    code-block(it)
  }
}

#include "/.calepin/new/source.typ"
