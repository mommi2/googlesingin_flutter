# Google Sign In - Flutter

### Firebase
Primo step: creare un progetto, con account di default Google Analytics per Google Analytics.
Secondo step: Registrare l'applicazione Android/iOS. Cliccare sull'icona dell'OS in alto all'inizio della dashboard e seguire gli step di Firebase. (Passaggio importante) Per ottenere la chiave SHA, recarsi sul terminale e inserire il seguente comando:
keytool -list -v -keystore "USERPROFILE.android\debug.keystore" e inserire la password "android".
Terzo step: andare su "Authentication" -> "Metodo di accesso" e abilitare provider di accesso Google.
IMPORTANTE
applicationId dell'applicazione deve corrispondere con il packages su Firebase. Per vedere l'applicationId sull'App, aprire il file build.gradle livello app 

### Applicazione (Android)
Aggiungere il pacchetto:
pubspec.yaml:
  google_sign_in: ^4.0.7

### Pacchetti Flutter
pub.dev (per vedere specifiche pacchetto): [google_sing_in](https://pub.dev/packages/google_sign_in#-readme-tab-)
