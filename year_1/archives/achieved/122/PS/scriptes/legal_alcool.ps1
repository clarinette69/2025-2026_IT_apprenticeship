[int] $age = Read-Host "Entrez votre âge "

if ($age -ge 18)
{
Write-Host "Vous pouvez consommer du vin, de la bière, des alcool for et des spiritueux"
}

Elseif ($age -lt 18 -gt 16)
{
 Write-Host "Vous pouvez consommer de la bière ou du vin mais aucun alcool fort"
}

else
{
 Write-Host "Vous ne pouvez consommer aucun alcool, de la limonade vous attend au bar"
}