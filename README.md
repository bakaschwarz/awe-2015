# Sensorüberwachung

## Beschreibung

Dieses Projekt wurde im Rahmen des *Agile Webentwicklung* Moduls
des Jahres 2015 entwickelt.
Das Ziel war es, dass eine Website erstellt wird, die Daten visualisiert,
die über JSON Files in POST Requests an die Seite gesendet werden.
Diese Daten beinhalten Messwerte von Sensoren, die selbst widerum Stationen
zugeordnet sind.

Diese Daten können in Diagrammen dargestellt werden und die Messwerte können
untereinander verglichen werden.

Stationen haben eine eindeutige *Node Number*, über die sie identifiziert werden;
Sensoren werden eindeutig über ihre *Abbreviation* und die zugeordnete
Station zugeordnet.

Um POST Requests zu authentifizieren wird ein API Token im Body des JSON Objekts
mitgesendet.

*(Sollte es gewünscht sein,dass das Token lieber im Header zu senden, muss die Datei <code>app/controllers/weather_update_controller.rb</code>
bearbeitet werden und in ihr die Methode <code>create</code>)*

Eine Beispiel JSON Datei könnte wie folgt aussehen:

    {
      "s_d": [
        {
          "_n": 1,
          "_t": 123543332,
          "tsn": 24.03,
          "hsn": 63.11,
          "psn": 1024.30,
          "lsn": 143,
          "isn": 103,
          "uvn": 0
        },
        {
          //Weitere Einträge wie oben
        },
        {
          //Weitere Einträge wie oben
        }
        //...
      ],
      "api_token": "asdasdasdasd"
    
    }

Das JSON Objekt enthält direkt Elemente. Das erste ist ein Array, auf welchen
mit dem String <code>s_d</code> gezeigt wird. Dieses Array enthält einen oder mehrere
Timestamp Hashes. Diese Hashes enthalten immer <code>_n</code> und <code>_t</code>.
Ersteres steht für die Stations Nummer, die *Node Number*. Zweites ist der Timestamp, angegeben als
UNIX Timestamp.

Alle weiteren Einträge sind Kürzel (*Abbreviations*) von Sensoren und ihre Werte zu diesem Timestamp.
Es ist nicht nötig, die Einträge für die Stations Nummer zuerst auf der Seite anzulegen, denn wenn
eine Stations Nummer erkannt wird, die es noch nicht gibt, wird diese neu angelegt.
Selbiges gilt für Sensoren. Existiert für diese Station ein mitgesendeter Sensor noch nicht,
wird dieser neu angelegt.

## Einrichten

### Abhängigkeiten
+ bundler >= 1.10.6
+ nodejs >= 0.10.25

### Installation

    > bundle
## Lizenz