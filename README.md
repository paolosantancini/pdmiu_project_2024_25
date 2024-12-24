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

Selezionando la voce di menù "Esporta Login" il sistema elabora un file csv e lo scarica all'interno della cartella predefinita dal sistema operativo in utilizzo (in genere "Download").

![image](https://github.com/user-attachments/assets/534533aa-2b74-410a-bf66-5c931d7f89a9)

# Tecnologia

In fase implementativa sono state utilizzare le seguenti librerie:

| Libreria | Descrizione |
| -------- | ----------- |
| file_saver: ^0.1.0 | dsnlcsnclkds |
| http: ^0.13.3 | ----------- |
| fluttertoast: ^8.0.8 | --- |
| csv: ^5.0.0 | ---- |
| flutter_spinkit: ^5.1.0 | --- |
| crypto: ^3.0.1 | --- |
