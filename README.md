## Paolo Santancini - matr. 334128
## Emulatore di Login


# Idea
<div align="justify">
Il progetto è stato sviluppato per mezzo del framework open-source Flutter. L'applicazione emula il login di un qualsiasi utente che vuol accedere a un servizio. Ogni tentativo di accesso è registrato in tempo reale all'interno di una struttura di dati volatile che, in un secondo momento, potrà essere esportata in un file di tipo csv.
</div>

# Esperienza utente
<div align="justify">
L'applicazione una volta eseguita si presenta con la pagina di "Login" all'interno della quale l'utente può inserire le proprie credenziali (e-mail, password). Successivamente può confermare l'immissione attraverso il tasto "Accedi". E' presente un menù di navigazione in basso con tre voci specifiche: "Login", "Mostra Login", "Esporta Login".

<p align=center><img width="50%" alt="img01" src="https://github.com/user-attachments/assets/01beb8d6-131a-4035-abfb-3400297aca17" /></p>

Ad ogni accesso l'applicazione mostra il numero di registrazione in un "Toast" in basso a destra.

<p align=center><img width="50%" alt="img02" src="https://github.com/user-attachments/assets/22b3d0f1-0af5-4c50-b58c-853d3ffd94f6" /></p>

Selezionando la voce di menù "Mostra Login" il sistema elenca tutti gli accessi effettuati fino a quel momento.

<p align=center><img width="50%" alt="img03" src="https://github.com/user-attachments/assets/c6b6e03b-0819-4c51-8d75-58ddd41e56d1" /></p>

Selezionando la voce di menù "Esporta Login" il sistema elabora un file csv e lo scarica all'interno della cartella predefinita dal sistema operativo in utilizzo (in genere "Download").

<p align=center><img width="50%" alt="img04" src="https://github.com/user-attachments/assets/2d811a4a-92c7-40f7-adb1-fb4a77a3d936" /></p>
</div>

# Tecnologia
<div align="justify">
In fase implementativa sono state utilizzare le seguenti librerie:

| Libreria | Descrizione |
| -------- | ----------- |
| material | Sistema di design sviluppato da Google |
| file_saver | Permette di salvare file nei dispositivi in uso |
| http | Permette di inviare richieste http (get, post ...). Utile per interfacciamento con API |
| fluttertoast | Messaggi "Toast" (notifiche) |
| csv | Legge e scrive file strutturati in formato csv |
| flutter_spinkit | "Loading spinners", animazioni di caricamento |
| crypto | Crittografia |

</div>
