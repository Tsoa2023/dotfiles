local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')
local vcs = require('galaxyline.providers.vcs')
local diagnostic = require('galaxyline.providers.diagnostic')
local fileinfo = require('galaxyline.providers.fileinfo')
local colors = {
  bg = '#282c34',
  fg = '#abb2bf',
  line_bg = '#353644',
  lbg = '#2c2f3a',
  green = '#98c379',
  orange = '#d19a66',
  purple = '#c678dd',
  magenta = '#ff80ff',
  blue = '#61afef',
  red = '#e06c75',
  yellow = '#e5c07b',
}

-- Left side
gls.left[1] = {
  RainbowRed = {
    provider = function() return '▊ ' end,
    highlight = {colors.blue, colors.line_bg}
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      local mode_color = {
        n = colors.red, i = colors.green,v=colors.blue,
        [''] = colors.blue,V=colors.blue,
        c = colors.magenta,no = colors.red,s = colors.orange,
        S=colors.orange,[''] = colors.orange,
        ic = colors.yellow,R = colors.purple,Rv = colors.purple,
        cv = colors.red,ce=colors.red, r = colors.cyan,
        rm = colors.cyan, ['r?'] = colors.cyan,
        ['!']  = colors.red,t = colors.red,
        c  = colors.orange,
      }
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return '  '
    end,
    highlight = {colors.red, colors.line_bg, 'bold'},
  },
}

gls.left[3] = {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.line_bg}
  }
}

gls.left[4] = {
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.providers.fileinfo').get_file_icon_color, colors.line_bg},
  },
}

gls.left[5] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.line_bg, 'bold'}
  }
}

gls.left[6] = {
  LineInfo = {
    provider = 'LineColumn',
    highlight = {colors.fg, colors.line_bg},
  },
}

gls.left[7] = {
  PerCent = {
    provider = 'LinePercent',
    highlight = {colors.fg, colors.line_bg, 'bold'},
  }
}

gls.left[8] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red, colors.line_bg}
  }
}

gls.left[9] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow, colors.line_bg},
  }
}

gls.left[10] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.cyan, colors.line_bg},
  }
}

gls.left[11] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue, colors.line_bg},
  }
}

-- Right side
gls.right[1] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    highlight = {colors.fg, colors.line_bg, 'bold'}
  }
}

gls.right[2] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    highlight = {colors.fg, colors.line_bg, 'bold'}
  }
}

gls.right[3] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.yellow, colors.line_bg, 'bold'},
  }
}

gls.right[4] = {
  DiffAdd = {
    provider = vcs.diff_add,
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green, colors.line_bg},
  }
}

gls.right[5] = {
  DiffModified = {
    provider = vcs.diff_modified,
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.orange, colors.line_bg},
  }
}

gls.right[6] = {
  DiffRemove = {
    provider = vcs.diff_remove,
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red, colors.line_bg},
  }
}

gls.right[7] = {
  RainbowBlue = {
    provider = function() return ' ▊' end,
    highlight = {colors.blue, colors.line_bg}
  },
}

-- Short line left
gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    highlight = {colors.blue, colors.line_bg, 'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider = 'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg, colors.line_bg, 'bold'}
  }
}

-- Short line right
gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg, colors.line_bg}
  }
}
