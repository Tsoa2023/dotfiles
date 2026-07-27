# ==============================================
# PLUGIN FZF POUR RANGER
# ==============================================

import os
import ranger.api
from ranger.api.commands import Command

old_hook_init = ranger.api.hook_init

def hook_init(fm):
    old_hook_init(fm)
    fm.execute_console("map <C-f> fzf_select")

ranger.api.hook_init = hook_init

class fzf_select(Command):
    """
    :fzf_select
    
    Utilise FZF pour une sélection rapide et intelligente des fichiers.
    Supporte la recherche floue, multi-sélection et prévisualisation.
    """
    
    def execute(self):
        import subprocess
        import tempfile
        
        if self.arg(1):
            if self.arg(1) == 'locate':
                command = "locate home media | grep -v cache"
                fzf = self.fm.execute_command("fzf --multi", stdout=subprocess.PIPE, universal_newlines=True)
            else:
                command = self.arg(1)
                fzf = self.fm.execute_command("fzf --multi", stdout=subprocess.PIPE, universal_newlines=True)
        else:
            hidden = ('--hidden' if self.fm.settings.show_hidden else '')
            command = f"fd --color=always --type f {hidden} . {self.fm.thisdir.path}"
            fzf = self.fm.execute_command(
                "fzf --ansi --multi --preview 'bat --color=always --style=header,grid --line-range :300 {}'",
                stdout=subprocess.PIPE, 
                universal_newlines=True
            )
        
        env = os.environ.copy()
        env['FZF_DEFAULT_COMMAND'] = command
        env['FZF_DEFAULT_OPTS'] = '--height=80% --layout=reverse --info=inline --border --margin=1 --padding=1'
        
        fzf = subprocess.Popen(
            ['fzf', '--multi', '--ansi',
             '--preview', 'bat --color=always --style=header,grid --line-range :300 {}',
             '--preview-window', 'right:50%:wrap'],
            stdout=subprocess.PIPE,
            universal_newlines=True,
            env=env
        )
        
        stdout, stderr = fzf.communicate()
        
        if fzf.returncode == 0:
            fzf_file = tempfile.NamedTemporaryFile(delete=False)
            fzf_file.write(stdout.encode('utf-8'))
            fzf_file.close()
            
            self.fm.execute_console("bulkrename " + fzf_file.name)
            os.unlink(fzf_file.name)
