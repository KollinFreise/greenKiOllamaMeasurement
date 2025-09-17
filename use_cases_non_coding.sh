#!/bin/bash

# Usage: ./runtime.sh [llm-model]
# Beispiel: ./runtime.sh llama3.2:1b

set -e  # Stop on error

echo "=== DEBUG: Script started at $(date) ==="
echo "DEBUG: Running as user: $(whoami)"
echo "DEBUG: Current directory: $(pwd)"
echo "DEBUG: Args: \$1='$1'"
echo "DEBUG: LLM_MODEL='${1:-llama3.2:1b}'"
echo "DEBUG: Checking ollama binary location..."
which ollama || { echo "ERROR: ollama not found in PATH!"; exit 1; }
echo "DEBUG: ollama version: $(ollama --version 2>&1)"
echo "DEBUG: Listing /var/greenkiollamamesurements:"
ls -l /var/greenkiollamamesurements || echo "WARN: Directory missing!"
echo "DEBUG: Listing /tmp/greenkiollamamesurements:"
ls -l /tmp/greenkiollamamesurements || echo "WARN: Directory missing!"

LLM_MODEL="${1:-llama3.2:1b}"

echo 'Start real test'

# Task: Prepare job interview (generate questions)
echo 'I would like to generate some questions for a Job Interview. The jobdescription is following: Please generate some example Questions and important skills I have to ask the applicants. Here the jobdescription:

      Senior Fullstack Entwickler - Java, Spring, Angular*

      Das erwartet dich bei uns:

      Du arbeitest in Beratungs- und Softwareentwicklungsprojekten bei Kunden wie AXA, BMW, ZDF und die Bahn

      Du gestaltest aktiv alle Phasen des Software-Engineerings mit agilen Methoden

      Du entwickelst hochwertigen, performanten und wartbaren Code

      Beispielprojekte findest du unter Success-Stories: https://accso.de/referenzen/success-stories



      Das zeichnet dich aus:

      Du hast einen Hochschulabschluss in Informatik oder in einer vergleichbaren Disziplin erfolgreich abgeschlossen

      Du bringst tiefgehende Kenntnisse in Frontend und Backend (u.a. in Java, Spring, Kotlin, Angular, VueJS, React) mit

      Du handelst proaktiv, pragmatisch und teamorientiert

      Du sprichst fließend Deutsch (mindestens C1 Level)



      Unser Angebot an dich:

      Fairer Umgang, Wertschätzung, flache Hierarchien und offene Kommunikation auf Augenhöhe

      12 Weiterbildungstage pro Jahr

      Interne Communities von Machine Learning, über Cloud bis IoT

      Familienfreundliche Arbeitszeiten

      New Work: hybrides Arbeiten im erstklassigen Büro mit individuell gestaltbarem Homeoffice-Anteil

      Natürlich gibts auch Jobrad, Gesundheitsprogramme, Altersvorsorge, etc.



      Das ist Accso:

      Wir sind digitale Maßschneider - Expert:innen für individuelles Softwareengineering & IT-Consulting.

      Mit unseren Softwareprojekten verfolgen wir dabei ein Ziel: Die Welt ein bisschen besser zu machen. Von der Förderung erneuerbarer Energie, der Verlagerung des Verkehrs auf die Schiene bis zur Unterstützung der Abwicklung der Organspende.

      Wir begeistern uns für anspruchsvolle Aufgaben und lösen diese am liebsten in einem partnerschaftlichen Miteinander, in das jede:r seine und ihre speziellen Stärken einbringt. So entstehen beste Ergebnisse auf eine für alle angenehme und inspirierende Art und Weise.

      Bei uns kannst du dich so einbringen wie du bist und dich stetig weiter entwickeln.


      Deine Bewerbung:

      Es ist uns nicht so wichtig, dass du die Stellenanforderungen zu 100% erfüllst, sondern dass du unser Team mit deinen Talenten, deinem Wissen und deiner Art bereicherst und wir gemeinsam wachsen.


      Werde Accsonaut:in

      *Für uns ist dein Talent entscheidend, nicht dein Geschlecht, deine Herkunft, Glaubensrichtung, sexuelle Orientierung oder eine eventuelle Behinderung.
' | ollama run "$LLM_MODEL"

# Task: Create Joblistings
echo 'I have Jobedescription A and Jobdescription B. Please Generate a Jobdescription with the following Key Featurers.

      Jobdescription A:

      Das erwartet dich bei uns:

            Du arbeitest in Beratungs- und Softwareentwicklungsprojekten bei Kunden wie AXA, BMW, ZDF und die Bahn

            Du gestaltest aktiv alle Phasen des Software-Engineerings mit agilen Methoden

            Du entwickelst hochwertigen, performanten und wartbaren Code

            Beispielprojekte findest du unter Success-Stories: https://accso.de/referenzen/success-stories



            Das zeichnet dich aus:

            Du hast einen Hochschulabschluss in Informatik oder in einer vergleichbaren Disziplin erfolgreich abgeschlossen

            Du bringst tiefgehende Kenntnisse in Frontend und Backend (u.a. in Java, Spring, Kotlin, Angular, VueJS, React) mit

            Du handelst proaktiv, pragmatisch und teamorientiert

            Du sprichst fließend Deutsch (mindestens C1 Level)



            Unser Angebot an dich:

            Fairer Umgang, Wertschätzung, flache Hierarchien und offene Kommunikation auf Augenhöhe

            12 Weiterbildungstage pro Jahr

            Interne Communities von Machine Learning, über Cloud bis IoT

            Familienfreundliche Arbeitszeiten

            New Work: hybrides Arbeiten im erstklassigen Büro mit individuell gestaltbarem Homeoffice-Anteil

            Natürlich gibts auch Jobrad, Gesundheitsprogramme, Altersvorsorge, etc.



            Das ist Accso:

            Wir sind digitale Maßschneider - Expert:innen für individuelles Softwareengineering & IT-Consulting.

            Mit unseren Softwareprojekten verfolgen wir dabei ein Ziel: Die Welt ein bisschen besser zu machen. Von der Förderung erneuerbarer Energie, der Verlagerung des Verkehrs auf die Schiene bis zur Unterstützung der Abwicklung der Organspende.

            Wir begeistern uns für anspruchsvolle Aufgaben und lösen diese am liebsten in einem partnerschaftlichen Miteinander, in das jede:r seine und ihre speziellen Stärken einbringt. So entstehen beste Ergebnisse auf eine für alle angenehme und inspirierende Art und Weise.

            Bei uns kannst du dich so einbringen wie du bist und dich stetig weiter entwickeln.


            Deine Bewerbung:

            Es ist uns nicht so wichtig, dass du die Stellenanforderungen zu 100% erfüllst, sondern dass du unser Team mit deinen Talenten, deinem Wissen und deiner Art bereicherst und wir gemeinsam wachsen.


            Werde Accsonaut:in

            *Für uns ist dein Talent entscheidend, nicht dein Geschlecht, deine Herkunft, Glaubensrichtung, sexuelle Orientierung oder eine eventuelle Behinderung.
' | ollama run "$LLM_MODEL"

# Task: Update Workerinformation
echo 'Hier ist eine Projektreferenz sowie der CV eines Mitarbeiters, der an dem Projekt beteiligt war. Bitte erzeuge daraus eine Referenz in der geforderten Formatierung.
' | ollama run "$LLM_MODEL"

# Task: Konzeption für ein Crowd-Warmup
echo 'Wir werden eine firmen-interne Konferenz machen mit ca. 250 Teilnehmenden. Ich habe ca. 5 Minuten Zeit, um mit den Teilnehmenden etwas Bewegung am Platz (im Stehen) zu machen. Das nächste Thema wird Südafrika und Software für eine bessere Welt sein. Ich möchte ein kleines (aber nicht albernes) Spiel machen mit allen, z.B. zum Thema Weltreise und Nachhaltigkeit. Was könnte ich machen?' | ollama run "$LLM_MODEL"

# Task: Fragen zu Powerpoint
echo 'Ich habe bei PowerPoint aus Versehen weggeklickt, dass ich eine Datei wiederherstelle. Komme ich trotzdem noch an die Daten?' | ollama run "$LLM_MODEL"

# Task: Fragen zu Obsidian
echo 'Der Editor obsidian.md kann auf PDFs verlinken und dort auch auf bestimmte Seiten, richtig?' | ollama run "$LLM_MODEL"

# Task: Test übersetzen
echo 'I am writing a blog article for my company. Please help me translate it into english, while keeping the spirit and tone from the original German version.

      Here is the german version:

      Hallo werte Accsonaut:innen,

      wir haben eine Gewinnerin für die erste Accso AI Assistance Challenge 2025! Die Langdock Assistentin “Sally” von  wurde von euch zur beste Einreichung gewählt. Herzlichen Glückwunsch, liebe Alina! 🙌🏻 💯

      Sally kennt die Mitarbeitenden bei Accso, sowie deren Skills und Projektreferenzen aus decidalo. Sie bestimmt für eine gegebene Rollenbeschreibung die passendsten Mitarbeitenden mit ihren Skills und Projektreferenzen. So liefert sie wertvolle Unterstützung bei der Belegung von Projekten.

      Neugierig? Hier findest du die Details und kannst Sally selbst ausprobieren: https://accso.atlassian.net/wiki/spaces/ACCSORES/pages/860782653/Challenger+6+-+Sally+matcht+Rollenbeschreibungen+auf+passende+Mitarbeitende

      Vielen Dank, liebe Accsonaut:innen, für das fleißige Abstimmen und ein besonderes Dankeschön an die vielen weiteren und ebenfalls äußerst spannenden Einreichungen. (Hier findest du sie alle: https://accso.atlassian.net/wiki/spaces/ACCSORES/pages/707657729/Accso+AI+Assistance+Challenge+2025).

      Ihr wohlverdienter Gewinn (ein Trackpad + ein Gutschein für das im Oktober erscheinenden Lego GameBoy Set) wurde Alina von Cody höchstpersönlich überreicht 🥳
' | ollama run "$LLM_MODEL"

sleep 10
