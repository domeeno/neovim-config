local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Figure environment
  s("fig", fmt([[
    \begin{{figure}}[h]
      \centering
      \includegraphics[width=\linewidth]{{{}}}
      \caption{{{}}}
      \label{{fig:{}}}
    \end{{figure}}
  ]], { i(1, "image.png"), i(2, "caption"), i(3, "label") })),

  -- Beamer frame
  s("fr", fmt([[
    \begin{{frame}}{{{}}}
      {}
    \end{{frame}}
  ]], { i(1, "Title"), i(2, "Content") })),
}
