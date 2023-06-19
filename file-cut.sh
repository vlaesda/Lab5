#!/bin/bash

# Comentario ingenioso: Para evitar que se repitan los comentarios explicativos en el archivo de salida correspondiente a este script, el bloque de código dentro del if [ "$SLURM_PROCID" == "0" ] se ejecutará solo en la primera instancia del script, mientras que las instancias posteriores no ejecutarán ese bloque de código. Esto garantiza que los comentarios solo se impriman una vez en la salida, independientemente de la cantidad de instancias que se estén ejecutando en paralelo. Mas explicaciones en el informe.

# Verificar si es la primera instancia
if [ "$SLURM_PROCID" == "0" ]; then

   echo "Obtener el número de alumno"
   alumno_number="06"  # Reemplazar con el número de alumno. No valido para alumno 01
   echo
   
   # Cambia al directorio donde se encuentran los .fastq
   cd  ./Lab5
   
   echo "Obtener la lista de archivos .fastq"
   files=$(ls *.fastq)
   echo
   # Itera sobre los archivos y guarda la fraccion correspondiente del archivo .fastq
   for file in $files; do
       echo "Procesando archivo $file"
       # Obtener el número de líneas del archivo
       num_lines=$(wc -l < "$file")
   
       # Calcular el número de líneas a cortar
       lines_to_cut=$((num_lines / alumno_number))
       
       # Cortar la parte superior del archivo y sustituir archivo original
       head -n "$lines_to_cut" "$file" > "/home/alumno06/lab5_23/cut/$file"
       echo "Corte de $file completado."
       echo
   done
   echo
   echo "Corte de archivos completado."
   
   # Par facilitar la realizacion de las comprobaciones, he preferido guardar los nuevos archivos recortados en una carpeta adicional para sustituirlos por los originales una vez finalizadas las modificaciones.
   # Sustituir archivos completos en la carpeta Lab5
   cp /home/alumno06/lab5_23/cut/*.fastq .
fi