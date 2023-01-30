# Observateur d'événements

Savoir qu'elle compte à redémarrer le servuer :

```powershell
Get-WinEvent System | Where-Object {$_.id -eq 1074} | Select-Object -first 20 | Select TimeCreated, LogName, Level, LevelDisplayName, Id, ProviderName, Message | Out-GridView
```


## Sources

- [pourquoi-et-par-qui-un-serveur-a-ete-redemarre](https://deployadmin.com/2021/02/11/savoir-quand-comment-pourquoi-et-par-qui-un-serveur-a-ete-redemarre/)