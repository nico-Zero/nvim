return{
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    event = "VeryLazy",
    config = function()
        require('luasnip').setup({})
        -- local ls = require("luasnip")
        -- local s = ls.snippet
        -- local sn = ls.snippet_node
        -- local isn = ls.indent_snippet_node
        -- local t = ls.text_node
        -- local i = ls.insert_node
        -- local f = ls.function_node
        -- local c = ls.choice_node
        -- local d = ls.dynamic_node
        -- local r = ls.restore_node
        -- local events = require("luasnip.util.events")
        -- local ai = require("luasnip.nodes.absolute_indexer")
        -- local extras = require("luasnip.extras")
        -- local l = extras.lambda
        -- local rep = extras.rep
        -- local p = extras.partial
        -- local m = extras.match
        -- local n = extras.nonempty
        -- local dl = extras.dynamic_lambda
        -- local fmt = require("luasnip.extras.fmt").fmt
        -- local fmta = require("luasnip.extras.fmt").fmta
        -- local conds = require("luasnip.extras.expand_conditions")
        -- local postfix = require("luasnip.extras.postfix").postfix
        -- local types = require("luasnip.util.types")
        -- local parse = require("luasnip.util.parser").parse_snippet
        -- local ms = ls.multi_snippet
        -- local k = require("luasnip.nodes.key_indexer").new_key
        -- ______________________________________________________________________________________

        local ls = require "luasnip"
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local f = ls.function_node
        local fmt = require("luasnip.extras.fmt").fmt


        ls.add_snippets("all", {
            s("curtime",
            f(function()
                return os.date "%D - %H:%M"
            end)
            ),
            s("name" ,{
                t('Yuvraj Mahilange')
            }),
        })
        ls.add_snippets("lua",{
            s("hello" ,{
                t('print("Hello, World!!!")')
            }),
        })
        ls.add_snippets("python", {
            s("def",
            fmt(
            [[
            def {} () -> {} :
                return {}
            ]],
            {
                i(1, "testname"),
                i(2, "None"),
                i(0, "None"),
            })
            ),
        })


    end,

}
