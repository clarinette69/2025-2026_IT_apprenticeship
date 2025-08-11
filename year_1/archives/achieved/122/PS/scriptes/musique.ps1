# Définir la fréquence et la durée pour chaque note (notes simplifiées)
$notes = @(
    @{Frequency=523.25; Duration=100},  # C
    @{Frequency=554.37; Duration=500},  # C# / Db
    @{Frequency=587.33; Duration=500},  # D
    @{Frequency=622.25; Duration=500},  # D# / Eb
    @{Frequency=659.26; Duration=5000},  # E
    @{Frequency=698.46; Duration=500},  # F
    @{Frequency=739.99; Duration=50000},  # F# / Gb
    @{Frequency=523.25; Duration=100},  # C
    @{Frequency=554.37; Duration=500},  # C# / Db
    @{Frequency=587.33; Duration=500},  # D
    @{Frequency=622.25; Duration=500},  # D# / Eb
    @{Frequency=659.26; Duration=5000},  # E
    @{Frequency=698.46; Duration=500},  # F
    @{Frequency=622.25; Duration=500},  # D# / Eb
    @{Frequency=0; Duration=250},       # Silence de 250 ms
    @{Frequency=659.26; Duration=5000},  # E
    @{Frequency=698.46; Duration=500},  # F
    @{Frequency=659.26; Duration=5000},  # E
    @{Frequency=698.46; Duration=500},  # F
    @{Frequency=0; Duration=250},       # Silence de 250 ms
    @{Frequency=659.26; Duration=500},  # E
    @{Frequency=698.46; Duration=500},  # F
    @{Frequency=659.26; Duration=500},  # E
    @{Frequency=698.46; Duration=50},  # F
    @{Frequency=659.26; Duration=500},  # E
    @{Frequency=698.46; Duration=500},  # F
    @{Frequency=783.99; Duration=250},  # G
    @{Frequency=659.26; Duration=5000},  # E
    @{Frequency=698.46; Duration=500},  # F
    @{Frequency=739.99; Duration=500},  # F# / Gb
    @{Frequency=783.99; Duration=250},  # G
    @{Frequency=830.61; Duration=500},  # G# / Ab
    @{Frequency=880.00; Duration=500},  # A
    @{Frequency=932.33; Duration=500},  # A# / Bb
    @{Frequency=987.77; Duration=500}   # B
    @{Frequency=0; Duration=250},       # Silence de 250 ms
    @{Frequency=0; Duration=500}      # Silence de 500 ms
)

# Jouer chaque note
foreach ($note in $notes) {
    [Console]::Beep($note.Frequency, $note.Duration)
}