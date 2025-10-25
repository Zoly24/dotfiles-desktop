-- Essential LuaSnip Boilerplate
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

-- Start of the table containing all your snippets.
-- Remember to separate snippets with a comma (,)
return {
    -- Trigger: 'ali' (Aligned Display Math)
    s("ali", {
        t("\\["),
        t({ "", "    \\begin{aligned}" }),
        i(1, "Equation content & = ... \\\\ & = ..."),
        t({ "", "    \\end{aligned}" }),
        t({ "", "\\]" }),
        i(0),
    }),
    s("vect", {
        t("\\vec{"),
        i(1, "A"), -- Placeholder for the vector name
        t("}"),
        i(0), -- Final cursor position
    }),
    s("bm", {
        t("\\begin{bmatrix}"),
        t({ "", "    " }), -- New line and indent
        i(1, "element1 & element2 \\\\ element3 & element4"), -- Generic content placeholder
        t({ "", "\\end{bmatrix}" }),
        i(0), -- Final cursor position
    }),
    s("tx", {
        t("\\text{"),
        i(1, "Text content"), -- Placeholder for the text you want to insert
        t("}"),
        i(0), -- Final cursor position
    }),
    s("2dplane", {
        t("\\begin{figure}[h!]"),
        t({ "", "    \\centering" }),
        t({ "", "    \\begin{tikzpicture}[" }),
        t({ "", "        scale=" }),
        i(3, "1.0"), -- Placeholder for custom scale
        t(","),
        t({ "", "        >=Stealth," }),
        t({ "", "        axis/.style={->, thick, gray!60}," }),
        t({ "", "        grid line/.style={dashed, gray!30, thin}" }),
        t({ "", "    ]" }),
        t({ "", "" }),

        -- Draw the Grid
        t({ "", "    \\draw[grid line] (-4.5,-3.5) grid (4.5,3.5);" }),

        -- Draw the Axes
        t({ "", "    \\draw[axis] (-4.5,0) -- (4.5,0) node[right] {$x$};" }),
        t({ "", "    \\draw[axis] (0,-3.5) -- (0,3.5) node[above] {$y$};" }),
        t({ "", "" }),

        -- Main Content Insertion Point (for your vectors)
        i(1, "\\fill (0,0) circle (2pt) node[below left] {$O$};"),

        t({ "", "    \\end{tikzpicture}" }),
        t({ "", "    \\caption{" }),
        i(2, "Visualization of 2D vectors."), -- Placeholder for caption
        t({ "}", "    \\label{fig:" }),
        i(4, "vectors_2d"), -- Placeholder for label
        t({ "}" }),
        t({ "", "\\end{figure}" }),
        t({ "", "" }),
        i(0), -- Final cursor position
    }),
    s("vecarrow", {
        t("\\draw[->, thick, "),
        i(1, "blue"), -- Placeholder for color or style
        t("] ("),
        i(2, "0,0"), -- Start coordinates (e.g., 0,0)
        t(") -- ("),
        i(3, "2,3"), -- End coordinates (e.g., 2,3)
        t(") node["),
        i(4, "above"), -- Node position (e.g., above, right)
        t("] {$"),
        i(5, "\\vec{v}"), -- Label (e.g., \vec{v})
        t("$};"),
        i(0), -- Final cursor position
        t({ "", "" }),
    }),
    s("augmat", {
        t("\\left[\\begin{array}{"),
        i(1, "ccc|c"), -- Column format: 3 columns, then a vertical line, then 1 column
        t("}"),
        t({ "", "    " }),
        i(2, "1 & 2 & 3 & 4 \\\\"), -- Row 1
        t({ "", "    5 & 6 & 7 & 8 \\\\" }, ""), -- Row 2
        t({ "", "    9 & 10 & 11 & 12" }), -- Row 3 (no \\ at end)
        t({ "", "\\end{array}\\right]" }),
        i(0), -- Final cursor position
    }),
}
