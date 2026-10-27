#!/usr/bin/env bash
set -euo pipefail
shopt -s extglob

# ==========================================
# CONFIGURACIÓN
# ==========================================
# Ruta de origen (Ajusta si tu música está en otra carpeta)
SOURCE_DIR="$HOME/Music" 

# Ruta de destino (Carpeta plana en tu escritorio)
DEST_DIR="$HOME/Desktop/Musica_Para_Llevar"

# Modo simulación (1 = Solo muestra en pantalla, 0 = COPIA REALMENTE)
DRY_RUN=1  
VERBOSE=1  

# Colores
ROJO='\033[0;31m'
VERDE='\033[0;32m'
AMARILLO='\033[0;33m'
AZUL='\033[0;34m'
NC='\033[0m'

echo -e "${AZUL}Iniciando aplanado y limpieza de biblioteca musical...${NC}"
[[ $DRY_RUN -eq 1 ]] && echo -e "${ROJO}⚠️ MODO DRY-RUN ACTIVADO: Solo se simulará el proceso.⚠️${NC}\n"

# Crear la carpeta destino si no existe
[[ $DRY_RUN -eq 0 ]] && mkdir -p "$DEST_DIR"

# Buscar SOLO extensiones de audio comunes usando -print0 para seguridad con espacios
find "$SOURCE_DIR" -type f \( -iname "*.mp3" -o -iname "*.m4a" -o -iname "*.aac" -o -iname "*.alac" -o -iname "*.flac" -o -iname "*.wav" -o -iname "*.aiff" \) -print0 | while IFS= read -r -d '' file; do
    
    dir="${file%/*}"
    base="${file##*/}"
    
    clean_base="$base"
    
    # 1. Quitar espacios iniciales puros
    clean_base="${clean_base##+([[:space:]])}"
    
    # 2. Expresión regular para el formato de Apple Music: 
    # Detecta "01", "1-01", etc., seguidos de espacios, guiones o puntos.
    if [[ "$clean_base" =~ ^([0-9]+(-[0-9]+)?)[[:space:]\.\-]+(.*)$ ]]; then
        # Verificación de seguridad: Evitar que una canción llamada "1979.mp3" se convierta solo en "mp3".
        # Comprobamos que el resto del nombre capturado aún contenga la extensión (tenga un punto).
        if [[ "${BASH_REMATCH[3]}" == *"."* ]]; then
            clean_base="${BASH_REMATCH[3]}"
        fi
    fi
    
    # 3. Limpieza final de espacios residuales
    clean_base="${clean_base##+([[:space:]])}"
    [[ -z "$clean_base" ]] && clean_base="$base" # Fallback por seguridad

    dest_file="$DEST_DIR/$clean_base"
    
    # Verificar colisiones en la carpeta destino plana
    if [[ -f "$dest_file" ]]; then
        # Comprobar si es exactamente el mismo archivo (misma canción, mismo peso)
        if cmp -s "$file" "$dest_file"; then
            [[ $VERBOSE -eq 1 ]] && echo -e "${NC}[OMITIENDO] '$clean_base' (Ya está en la carpeta)${NC}"
            continue
        else
            # CONFLICTO: Diferente canción, mismo nombre (ej. "Intro.mp3").
            # Como Apple Music organiza en Música/Artista/Álbum/Canción:
            # Extraemos el Artista (2 niveles arriba) para agregarlo al nombre.
            album_dir="${dir##*/}"
            parent_dir="${dir%/*}"
            artist_dir="${parent_dir##*/}"
            
            filename="${clean_base%.*}"
            extension="${clean_base##*.}"
            
            # Nuevo nombre: Cancion (Artista).mp3
            new_clean_base="${filename} (${artist_dir}).${extension}"
            new_dest_file="$DEST_DIR/$new_clean_base"
            
            # Si a pesar de agregar el artista SIGUE habiendo conflicto (múltiples "Intro" del mismo artista en distintos álbumes), añadimos el álbum.
            if [[ -f "$new_dest_file" ]]; then
                new_clean_base="${filename} (${artist_dir} - ${album_dir}).${extension}"
                new_dest_file="$DEST_DIR/$new_clean_base"
            fi
            
            [[ $VERBOSE -eq 1 ]] && echo -e "${AMARILLO}[CONFLICTO RESUELTO]${NC} '$base' -> '${new_clean_base}'"
            [[ $DRY_RUN -eq 0 ]] && cp -p "$file" "$new_dest_file"
        fi
    else
        [[ $VERBOSE -eq 1 ]] && echo -e "${VERDE}[COPIANDO]${NC} '$base' -> '$clean_base'"
        # Usamos cp -p para conservar la fecha original del archivo y sus permisos
        [[ $DRY_RUN -eq 0 ]] && cp -p "$file" "$dest_file"
    fi
done

echo -e "\n${AZUL}Proceso finalizado. Puedes revisar tu carpeta en: $DEST_DIR${NC}"
