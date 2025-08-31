function la --wraps=ls --wraps='eza -lhbo -rs=date --icons --nopermissions -A' --wraps='eza -lhbo -rs=date --icons --no-permissions -A' --description 'alias la eza -lhbo -rs=date --icons --no-permissions -A'
  eza -lhbo -rs=date --icons --no-permissions -A $argv
        
end
