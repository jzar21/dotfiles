#!/bin/bash

# Nombre de la salida
OUTPUT="eDP"

# Obtener el brillo actual
CURRENT_BRIGHTNESS=$(xrandr --verbose | grep -i "$OUTPUT connected" -A 20 | grep -i brightness | cut -f2 -d ' ')

# Incremento del brillo (puede ser positivo o negativo)
INCREMENT=$1

# Calcular el nuevo brillo
NEW_BRIGHTNESS=$(echo "$CURRENT_BRIGHTNESS + $INCREMENT" | bc)

# Limitar el brillo entre 0.1 y 1.0
if (( $(echo "$NEW_BRIGHTNESS < 0.2" | bc -l) )); then
  NEW_BRIGHTNESS=0.2
elif (( $(echo "$NEW_BRIGHTNESS > 1.3" | bc -l) )); then
  NEW_BRIGHTNESS=1.3
fi

# Aplicar el nuevo brillo
xrandr --output $OUTPUT --brightness $NEW_BRIGHTNESS

