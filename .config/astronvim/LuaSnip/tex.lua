return {
    s(
        { trig = "tt", snippetType = "autosnippet", dscr = "Insert typewriter text" },
        fmta("\\texttt{<>}", { i(1) })
    ),
    s(
        { trig = "bf", snippetType = "autosnippet", dscr = "Insert bold text" },
        fmta("\\textbf{<>}", { i(1) })
    ),
    s({ trig = "em", dscr = "Insert emphasized text" }, fmta("\\emph{<>}", { i(1) })),
    s({ trig = "sf", dscr = "Insert sans-serif text" }, fmta("\\textsf{<>}", { i(1) })),
    s({ trig = "it", dscr = "Insert italic text" }, fmta("\\textit{<>}", { i(1) })),
    s({ trig = "sc", dscr = "Insert small caps text" }, fmta("\\textsc{<>}", { i(1) })),
}
