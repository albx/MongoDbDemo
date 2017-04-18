# MongoDbDemo
test di utilizzo mongodb con .NET.

MongoDB viene gestito in due modalità:
- Installato come Windows Service in un una macchina Windows Server 2012 R2 gestita tramite [**Vagrant**](#Vagrant)
- Installato tramite [**Docker**](#Docker)

Il progetto gira sul **.NET Framework v4.6.1**.

## Vagrant

### Prerequisiti
- **Vagrant**: https://www.vagrantup.com/downloads.html
- **Virtualbox**: https://www.virtualbox.org/wiki/Downloads

### Installazione
Aprire terminale nella cartella vagrant che si trova sotto la root del progetto e digitare:
```
vagrant up
```
questo installa la macchina virtuale e lancia lo script powershell per l'installazione di mongodb

### Fonti
Lo script powershell per l'installazione di mongodb è stato preso da: https://gist.github.com/serdarb/5102848

## Docker

### Prerequisiti
Con **Windows 10 Professional**:
- **Docker**: [https://docs.docker.com/engine/getstarted/step_one/#docker-for-windows](https://docs.docker.com/engine/getstarted/step_one/#docker-for-windows)
- **Hyper-V** abilitato

Con altri Windows (Win. 10 Home o precedenti):
- **Docker toolbox**: [https://www.docker.com/products/docker-toolbox](https://www.docker.com/products/docker-toolbox)
- **Virtualbox**: https://www.virtualbox.org/wiki/Downloads

### Installazione
Con **Windows 10 Professional** segui la procedura di installazione descritta sul sito di [Docker](https://docs.docker.com/docker-for-windows/install/).

Con altri Windows segui la procedura di installazione di [Docker Toolbox](https://docs.docker.com/toolbox/toolbox_install_windows/#what-you-get-and-how-it-works).

Se utilizzi docker toolbox avvia il **Docker Quickstart terminal** e dirigiti nella cartella **docker** del progetto.

Una volta installato Docker apri un terminale nella cartella docker del progetto e lancia semplicemente uno degli script:
- [**docker-run.ps1**](docker/docker-run.ps1) se sei su windows 10 professional (powershell).
- [**docker-run.sh**](docker/docker-run.sh) se utilizzi Docker Toolbox (shell linux).

Questi script avviano (e scaricano se non presente nel sistema) l'immagine di MongoDB e la configurano.

Per stoppare il container creato sempre usando un terminale puoi eseguire i seguenti script:
- [**docker-stop.ps1**](docker/docker-stop.ps1) se sei su windows 10 professional (powershell).
- [**docker-stop.sh**](docker/docker-stop.sh) se utilizzi Docker Toolbox (shell linux).

Una volta stoppato il container deve essere cancellato per poter eseguire di nuovo il run.
Per eliminare il container usa gli script
- [**docker-remove.ps1**](docker/docker-remove.ps1) se sei su windows 10 professional (powershell).
- [**docker-remove.sh**](docker/docker-remove.sh) se utilizzi Docker Toolbox (shell linux).

**Se usi Docker Toolbox** devi fare un ulteriore step.
Apri **Virtualbox** -> tasto destro sulla macchina virtuale **default** 
- Impostazioni 
- Rete
- Inoltro delle porte
- Aggiungi una regola "mongo" (o il nome che preferisci) lasciando bianco IP host e IP guest e settando le porte host e guest a 27017.

### Fonti
Per una guida su come configurare MongoDB con Docker toolbox vedi il link [http://codehangar.io/mongodb-image-instance-with-docker-toolbox-tutorial/](http://codehangar.io/mongodb-image-instance-with-docker-toolbox-tutorial/).