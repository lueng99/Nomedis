#!/bin/bash
history -r ~/.bash_history

INSTALL_DIR="$HOME/Nomedis_shell"

# Función para instalar archivos y directorios
install() {
    echo "Instalando..."
    mkdir -p "$INSTALL_DIR"    
    touch "$INSTALL_DIR/archivo1.txt"
    touch "$INSTALL_DIR/archivo2.txt"
    echo "Instalación completada en $Nomedis_LIB"
}

# Función para desinstalar
uninstall() {
    echo "Desinstalando..."
    rm -rf "$INSTALL_DIR"
    echo "Desinstalación completada."
}

# Mostrar fecha y hora
show_date() {
    echo "Fecha y hora actual: $(date)"
}

# Mostrar ASCII Art
Nomedis_logo() {
cat << "EOF"
 .  . .  .  . .  .  . .  .  . .  .  . .  .  . .  .  . .  .  . .  .  . .  .  .  
   .       .       .       .       .       .       .       .       .       .   .
     .  .    .  .    .  .    .  .    .  .    .  .    .  .    .  .    .  .    .  
 .       .       .       .       .       .       .       .       .       .      
   .  .    .  .    .  .    .  .    .  .    .  .    .  .    .  .    .  .    .  . 
  .    .  .    .  .    .  .    .  .    .  .    .  .    .  .    .  .    .  .     
    .       .       .       .       .       .       .       .       .       . . 
  .   . .    .  .    .  .    .  .    .  .    .  .    .  .    .  .    .  .       
    .     .    .  .    .  .    .  .    .  .    .  .    .  .    .  .    .  . .  .
  .    .   .   ..  .... .. .... ....... .....  .. .... . . .       .            
     .   .  ...% 8        XStXXXSS%tttt;;:.  : ;       SStt.. . .    .  .  . .  
  .    .   . ;S. .:::...:.;@               ..  8.......   :8:.    ..   .       .
    .    . ;8S .8 S;.:.: t8X               ..  88tt:..t8 ;:.XX:. .   .   .  .   
  .   . . 88 . S    . . ..  ..             ..X .   ..    .;t:.St.  .      .   . 
    .   . :  @ .  .     .. X..             ..  . .    .  : :.. @ .    . .       
  .    . @: X% .     .....  ::.     8X;    ..S .. ..      .:@  S.. .       . .  
     . . S  @ .  . . %;;:t X..     8@8     ..  8 .:.X . . . 8. X; .  .  .      .
  .    . S  @  .   . % . @ S ..    @8S     ..  8 .. . .   . .  8.         .  .  
    .  . S  @ . .  . S :.8 % .    ;@@X     ..  8 ::.: ..  : S  %;. . . .    .   
  .   . .SSX  .   .  ;8888 S .. ..8X88     ..S 8;SS%% . . . @%X. .       .    . 
    .  .  88888888888888888;..   .888%     ..t%8@@@@XXXSXXXXXS8t .   .  .  .    
  .   . tS           ........  . 8@@8X      .. .  .. ..  ... . . . .         .  
      . tS            . . ..   . 88@88                       . ...   .  . .    .
  . .   tS                  :.. 8@888@    88         .  .    . . .    .     .   
      . ;S       ......:::.XX8%:@8@:@8   t@@8        8X8:.   . ... .     .    . 
  .  .  tS     8@88@8@S@88888XS88@;t8@  .@8;XXX@XXXX8@8@Xt:  . ...   .  .  .    
      . ;S    .:@8X8XXSX%@%@.%@@88 %88  88%SS%ttt%%tS8@88t.. . :.. .         .  
  . . . ;S     . .;;:::.:.:   8X@;.%88 .88X.:.....:.::88%:.  . :..   . .  .    .
        ;S        . .          S@; ;@% 8@8:.   .   . .::..   . ;.. .        .   
  .  .. ;S                      :. ;@X@8@8:.           .     . ;..    . . .   . 
    .   ;X ...... .........       .:@8888%:   ......... .   .. ... .        .   
  .   . .@t%%@@@@@@@@@8@8@8  .     :88@8t     8%ttttX@8888888.t8 .   .  .      .
       . S  :X :...: S.S.@ X .     :@@88;  ..8 % .. : :...: 8:.S . .      .  .  
  . .  : 8 .;S .  .. @ ..8 S .     cX888:. ..8 ; .. t .   . @;.  .    . .   .   
      .. 8 .;S .   . 8XtS. S ..    :88Xt.  . 8.X 8S%8..   . @::     .     .    .
  .    . S .:@ . .       . S .     :@88 .  . 8.     .   . . @..    .   .     .  
    .  ..t ... .   . .  .. S ..    :88     . 8 .  .      ..  ..8 .   .   .  .   
  .   . .   .X@...  . . .. S .             . 8 : . .. ....8...t8 . .          . 
    .   . Xt:.:: .       : S ..            . @ .       . ;: ... .     . . .     
  .      . 8;.. 8 X88SS X ;@ .             . @ XX@@@@@8 8 ..@. . .  .       .  .
    . .   ..:X; ;S;;;..:::88 ...           ..@ : ...  .:X;88 .        .  .   .  
  .     .    .  .  ;%@8888::%%t%%t%t%%t%%%SStX ;8888888S.. .  . . . .      .    
     .    .    . . . ....  ... .. . .. . .. .    .... .  .             . .    . 
  .    .    .            .                    .         .  . .  .  .  .     .   
   .  .  .    .  .  . .      .  . .  . .  .     .  . .                   .    . 
 .         .    .       . .   .     .      . .    .    .  .  . . . . .  .  .    
    .  .  .  .    . .       .    .     . .     .     .     .                 .  
  .   .        .      . .      .   .        .    .  .   .    .  .  .  .  .  .   
EOF
}

# Abrir ayuda en Lynx
show_help() {
    lynx https://sites.google.com/view/nomedis/index
}


# Shell interactiva con soporte para todos los comandos de Linux
interactive_shell() {
    bind '"\e[A": history-search-backward'  # Flecha arriba busca en el historial
    bind '"\e[B": history-search-forward'   # Flecha abajo
    while true; do
        read -e -r -p "$USER@Nomedis_shell > " input
        if [[ "$input" == "exit" ]]; then
            echo "Saliendo..."
            break
        elif [[ "$input" == "install" ]]; then
            install
        elif [[ "$input" == "uninstall" ]]; then
            uninstall
        elif [[ "$input" == "show-date" ]]; then
            show_date
        elif [[ "$input" == "Nomedis-logo" ]]; then
            Nomedis_logo
        elif [[ "$input" == "help" ]]; then
            show_help
        else
            eval "$input"
        fi
        history -s "$input"  # Agregar comando al historial
    done
}
# Modo argumentos o interactivo
if [[ $# -gt 0 ]]; then
    case "$1" in
        "install") install ;;
        "uninstall") uninstall ;;
        "show-date") show_date ;;
        "Nomedis-logo") Nomedis_logo ;;
        "help") show_help ;;
        *) eval "$@" ;;  # Ejecuta cualquier comando de Linux pasado como argumento
    esac
else
    interactive_shell
fi

