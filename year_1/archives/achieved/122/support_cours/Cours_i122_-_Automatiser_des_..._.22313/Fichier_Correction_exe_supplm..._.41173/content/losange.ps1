do{

[int]$nombre = Read-Host "Taille du losange"
}
while($nombre%2 -eq 0)

# le +1 est pour arrondir à l'entier suppérieur
[int]$milieu = ($nombre+1)/ 2

#echo $milieu

# lignes
for($i = 1; $i -le $nombre; $i++){

    #on est pas au milieu des lignes on fait que grandir nos delims
    if($i -le $milieu)
    {
        $delim = $i-1
    }
    # on diminue la valeur du délimiteur après le milieu
    else
    {
       $delim--
    }

    #Colonnes
    for($j = 1; $j -le $nombre; $j++){
        if($j -ge ($milieu - $delim) -and $j -le ($milieu + $delim)){
            Write-Host -NoNewline "*"
        }
        else{
            Write-Host -NoNewline "-"
        }
    }
    #retour à la ligne
    Write-host 

}