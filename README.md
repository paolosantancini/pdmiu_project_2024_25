## Paolo Santancini - matr. 334128
## Emulatore di Login


# Idea

Il progetto è stato sviluppato per mezzo del framework open-source Flutter. L'applicazione emula il login di un qualsiasi utente che vuol accedere a un servizio. Ogni tentativo di accesso è registrato in tempo reale all'interno di una struttura di dati volatile che, in un secondo momento, potrà essere esportata in un file di tipo csv.

# Esperienza utente

L'applicazione una volta eseguita si presenta con la pagina di "Login" all'interno della quale l'utente può inserire le proprie credenziali (e-mail, password). Successivamente può confermare l'immissione attraverso il tasto "Accedi". E' presente un menù di navigazione in basso con tre voci specifiche: "Login", "Mostra Login", "Esporta Login".

![image](https://github.com/user-attachments/assets/bdbc6715-c0a1-42e2-b565-15cbbb7f7e2b)

Ad ogni accesso l'applicazione mostra il numero di registrazione in un "Toast" in basso a destra.

![image](https://github.com/user-attachments/assets/fd967e09-0124-4220-9ab1-93a9df935d94)

Selezionando la voce di menù "Mostra Login" il sistema elenca tutti gli accessi effettuati fino a quel momento.

![image](https://github.com/user-attachments/assets/ad8e3671-5e45-48c5-a972-b3ab180a4766)

