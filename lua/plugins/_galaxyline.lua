local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','dbui'}

local colors = {
    bg = '#282c34',
    yellow = '#fabd2f',
    cyan = '#008080',
    darkblue = '#081633',
    green = '#608B4E',
    orange = '#FF8800',
    purple = '#5d4d7a',
    magenta = '#d16d9e',
    grey = '#c0c0c0',
    blue = '#569CD6',
    red = '#D16969'
}

local has_file_type = function()
    local f_type = vim.bo.filetype
    if not f_type or f_type == '' then
        return false
    end
    return true
end

local buffer_not_empty = function()
    if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
        return true
    end
    return false
end

gls.left[2] = {
    ViMode = {
        provider = function()
            -- auto change color according the vim mode
            local mode_color = {n = colors.purple, 
                i = colors.green,
                v = colors.blue,
                [''] = colors.blue,
                V = colors.blue,
                c = colors.purple,
                no = colors.magenta,
                s = colors.orange,
                S = colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.red,
                Rv = colors.red,
                cv = colors.red,
                ce=colors.red, 
                r = colors.cyan,
                rm = colors.cyan, 
                ['r?'] = colors.cyan,
                ['!']  = colors.red,
                t = colors.red}
            vim.api.nvim_command('hi GalaxyViMode guibg='..mode_color[vim.fn.mode()])
            return '   '
        end,
        separator = ' ',
        separator_highlight = {colors.yellow,function()
            if not buffer_not_empty() then
                return colors.bg
            end
            return colors.bg
        end},
        highlight = {colors.grey,colors.bg,'bold'},
    },
}
-- gls.left[3] ={
--   FileIcon = {
--     separator = ' ',
--     provider = 'FileIcon',
--     condition = buffer_not_empty,
--     highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
--   },
-- }
-- gls.left[4] = {
--   FileName = {
--     provider = {'FileSize'},
--     condition = buffer_not_empty,
--     separator = ' ',
--     separator_highlight = {colors.purple,colors.bg},
--     highlight = {colors.magenta,colors.bg}
--   }
-- }

gls.left[3] = {
    GitIcon = {
        provider = function() return ' ' end,
        condition = buffer_not_empty,
        highlight = {colors.orange,colors.bg},
    }
}
gls.left[4] = {
    GitBranch = {
        provider = 'GitBranch',
        separator = ' ',
        separator_highlight = {colors.purple,colors.bg},
        condition = buffer_not_empty,
        highlight = {colors.grey,colors.bg},
    }
}

local checkwidth = function()
    local squeeze_width  = vim.fn.winwidth(0) / 2
    if squeeze_width > 40 then
        return true
    end
    return false
end

gls.right[1] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = checkwidth,
        icon = '  ',
        highlight = {colors.green,colors.bg},
    }
}
gls.right[2] = {
    DiffModified = {
        provider = 'DiffModified',
        condition = checkwidth,
        icon = '  ',
        highlight = {colors.blue,colors.bg},
    }
}
gls.right[3] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = checkwidth,
        -- separator = ' ',
        -- separator_highlight = {colors.purple,colors.bg},

        -- separator = ' | ',
        -- separator_highlight = {colors.darkblue, colors.bg},
        icon = '  ',
        highlight = {colors.red,colors.bg},
    }
}
gls.right[4] = {
    LeftEnd = {
        provider = function() return ' ' end,
        separator = ' ',
        separator_highlight = {colors.purple,colors.bg},
        highlight = {colors.purple,colors.bg}
    }
}
gls.right[5] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red,colors.bg}
    }
}
gls.right[6] = {
    Space = {
        provider = function () return '' end
    }
}

gls.right[7] = {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.yellow,colors.bg},
    }
}
gls.right[8] = {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '   ',
        highlight = {colors.blue,colors.bg},
    }
}
gls.right[9] = {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '   ',
        highlight = {colors.orange,colors.bg},
    }
}
gls.right[10] = {
    FileIcon = {
        provider = 'FileIcon',
        icon = '',
        condition = buffer_not_empty,
        highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.NameColor},
    },
}

gls.right[11] = {
    ScrollBar = {
        provider = 'ScrollBar',
        -- separator = ' | ',
        -- separator_highlight = {colors.darkblue, colors.bg},
        highlight = {colors.yellow,colors.purple},
    }
}

gls.short_line_left[1] = {
    LeftEnd = {
        provider = function() return ' ' end,
        separator = ' ',
        separator_highlight = {colors.purple,colors.bg},
        highlight = {colors.purple,colors.bg}
    }
}
