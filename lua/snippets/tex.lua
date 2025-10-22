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

  s("blfr", fmt([[
    \begin{{frame}}{{{}}}
      \begin{{block}}{{{}}}
        {}
      \end{{block}}
    \end{{frame}}
  ]], { i(1, "Title"), i(2, "Block Title"), i(3, "Content") })),

  s("slide", fmt([[
    \begin{{frame}}{{{}}}
      \begin{{block}}{{{}}}
        \begin{{itemize}}
          \item<2->{}
          \item<3->{}
          \item<4->{}
        \end{{itemize}}
      \end{{block}}
    \end{{frame}}
  ]], { i(1, "Title"), i(2, "Block Title"), i(3, "Item"), i(4, "Item"), i(5, "Item") })),

  s("ita", fmt([[
    \begin{{itemize}}
      \item<2->{}
      \item<3->{}
      \item<4->{}
    \end{{itemize}}
    ]], { i(1, "Item"), i(2, "Item"), i(3, "Item") })
  ),

  s("it", fmt([[
    \begin{{itemize}}
      \item {}
      \item {}
      \item {}
    \end{{itemize}}
    ]], { i(1, "Item"), i(2, "Item"), i(3, "Item") })
  ),

  s("cl", fmt([[
    \begin{{columns}}
      \begin{{column}}{{0.50\textwidth}}
        {}
      \end{{column}}
      \begin{{column}}{{0.50\textwidth}}
        {}
      \end{{column}}
    \end{{columns}}
    ]], { i(1, "Left"), i(2, "Right") })
  ),

  s("bl", fmt([[
  \begin{{block}}{{{}}}
    {}
  \end{{block}}
  ]], { i(1, "Title"), i(2, "Content") })
  ),

  s("o", fmt([[
    \onslide<{}->{{{}}}
  ]], { i(1, "2"), i(2, "Content") })
  ),

  s("ig", fmt([[
    \begin{{figure}}[h]
      \centering
      \includegraphics[width=0.8\linewidth]{{./assets/{}}}
    \end{{figure}}
  ]], { i(1, "") })),
}
