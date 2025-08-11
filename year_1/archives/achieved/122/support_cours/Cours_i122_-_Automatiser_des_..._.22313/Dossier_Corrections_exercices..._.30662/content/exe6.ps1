$cg = Get-WmiObject win32_VideoController

echo "étape 1 le nom de la CG : " $cg.Name


echo "étape 2 la version du driver : " $cg.DriverVersion

echo "étape 3 la résolution : " $cg.CurrentHorizontalResolution "x" $cg.CurrentVerticalResolution

echo "étape 4 le GPU : " $cg.VideoProcessor