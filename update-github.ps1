# Parametro obbligatorio per il messaggio di commit
param(
    [Parameter(Mandatory=$true)]
    [string]$CommitMessage
)

# Directory del progetto
$projectDir = $PSScriptRoot

try {
    # Vai alla directory del progetto
    Set-Location $projectDir
    
    # Mostra lo stato
    Write-Host "Stato Git:" -ForegroundColor Cyan
    git status
    
    # Aggiungi i file
    Write-Host "Aggiungendo i file..." -ForegroundColor Cyan
    git add .
    
    # Commit
    Write-Host "Creando il commit..." -ForegroundColor Cyan
    git commit -m $CommitMessage
    
    # Push
    Write-Host "Pushing su GitHub..." -ForegroundColor Cyan
    git push
    
    Write-Host "Completato!" -ForegroundColor Green
    
} catch {
    Write-Host "Errore durante l'aggiornamento: $_" -ForegroundColor Red
    exit 1
}
