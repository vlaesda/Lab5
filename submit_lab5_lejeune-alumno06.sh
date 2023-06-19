#!/bin/bash
#
#SBATCH -p hpc-bio-lejeune
#SBATCH --chdir=/home/alumno06/lab5_23/
#SBATCH -J file-cut
##SBATCH --job-name=file-cut
##SBATCH --exclusive
##SBATCH --cpus-per-task=1
##SBATCH --nodes=1
#SBATCH --ntasks-per-node=4

# Si utilizamos el comando srun -n 4 para ejecutar el script en paralelo con 4 procesos, no es necesario especificar #SBATCH --ntasks-per-node=4 en el encabezado del script SLURM.

# En srun -n 4 se solicita explícitamente 4 tareas para ejecutarse en paralelo. SLURM asignará los recursos necesarios para ejecutar esas 4 tareas, lo cual puede incluir múltiples nodos si es necesario. No hay restricción en la distribución de las tareas en los nodos.

# En SBATCH --ntasks-per-node=4 se establece la cantidad de tareas que se ejecutarán en cada nodo. Esto limita la ejecución de tareas solo a un solo nodo y distribuye las 4 tareas entre los recursos disponibles en ese nodo. Esto garantiza que las tareas se ejecuten en un solo nodo y no se distribuyan en varios nodos.

# En conclusion, si queremos ejecutar exactamente 4 tareas en paralelo sin importar la distribución en los nodos, podemos usar srun -n 4. Si queremos ejecutar 4 tareas en paralelo pero restringirlas a un solo nodo, puedes usar #SBATCH --ntasks-per-node=4.

# Ejecuta el script file-cut.sh en paralelo con 4 procesos
# srun -n 4 ./file-cut.sh
# srun --ntasks=4
srun ./file-cut.sh


