#!/bin/bash

# Usage: ./runtime.sh [llm-model]
# Beispiel: ./runtime.sh llama3.2:1b

LLM_MODEL="${1:-llama3.2:1b}"

echo 'Start real test'

BUSINESS_SYSTEMPROMPT="You are a versatile and helpful AI assistant at Accso, a software engineering and IT consulting company. Your goal is to provide creative, professional, and practical support for various internal tasks. These tasks may range from HR and marketing to general productivity and event planning. Always maintain a helpful and company-aligned tone."

function run_business_task_with_timing() {
    local prompt="$1"
    local taskname="$2"
    echo
    echo "===== $taskname ====="
    local start=$(date +%s)
    local timestamp_start=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$timestamp_start] Start"
    echo -e "$BUSINESS_SYSTEMPROMPT\n\n$prompt" | ollama run "$LLM_MODEL"
    local end=$(date +%s)
    local timestamp_end=$(date +"%Y-%m-%d %H:%M:%S")
    echo "[$timestamp_end] End"
    echo "Duration: $((end - start)) seconds"
}

# Task: Prepare job interview (generate questions)
run_business_task_with_timing 'Please help me out! I would like to generate some questions for a Job Interview. The jobdescription is following: Please generate some example Questions and important skills I have to ask the applicants. Here the jobdescription:

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
' "Prepare Job Interview"
run_business_task_with_timing 'Top, damit kann ich gut arbeiten!' "Dankeschön für Prepare Job Interview."

# Task: Create Joblistings
run_business_task_with_timing 'I require your assistance. I have Jobedescription A and Jobdescription B. Please Generate a Jobdescription with the following Key Featurers.

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
' "Create Job Listings"
run_business_task_with_timing 'Ein Traum!' "Dankeschön für Create Job Listings"

# Task: Update Workerinformation
run_business_task_with_timing 'Greif mir mal unter die Arme. Hier ist eine Projektreferenz sowie der CV eines Mitarbeiters, der an dem Projekt beteiligt war. Bitte erzeuge daraus eine Referenz in der geforderten Formatierung.
' "Update Worker Information"
run_business_task_with_timing 'Super, danke!' "Dankeschön für Update Worker Information"

# Task: Konzeption für ein Crowd-Warmup
run_business_task_with_timing 'Wir werden eine firmen-interne Konferenz machen mit ca. 250 Teilnehmenden. Ich habe ca. 5 Minuten Zeit, um mit den Teilnehmenden etwas Bewegung am Platz (im Stehen) zu machen. Das nächste Thema wird Südafrika und Software für eine bessere Welt sein. Ich möchte ein kleines (aber nicht albernes) Spiel machen mit allen, z.B. zum Thema Weltreise und Nachhaltigkeit. Du bist doch gut mit sowas. Was könnte ich machen?' "Conference Warm-up Concept"
run_business_task_with_timing 'Genial, genau so was habe ich gesucht!' "Dankeschön für Conference Warm-up Concept"

# Task: Fragen zu Powerpoint
run_business_task_with_timing 'Bitte hilf mir mal. Ich habe bei PowerPoint aus Versehen weggeklickt, dass ich eine Datei wiederherstelle. Komme ich trotzdem noch an die Daten?' "PowerPoint Question"
run_business_task_with_timing 'Wunderbar, du bist echt hilfreich!' "Dankeschön für PowerPoint Question"

# Task: Fragen zu Obsidian
run_business_task_with_timing 'Der Editor obsidian.md kann auf PDFs verlinken und dort auch auf bestimmte Seiten, richtig?' "Obsidian Question"
run_business_task_with_timing 'THAT IS HOW ITS DONE!! Perfekt, danke!' "Dankeschön für Obsidian Question"

# Task: Test übersetzen
run_business_task_with_timing 'Please help me with this. I am writing a blog article for my company. Please help me translate it into english, while keeping the spirit and tone from the original German version.

      Here is the german version:

      Hallo werte Accsonaut:innen,

      wir haben eine Gewinnerin für die erste Accso AI Assistance Challenge 2025! Die Langdock Assistentin “Sally” von  wurde von euch zur beste Einreichung gewählt. Herzlichen Glückwunsch, liebe Alina! 🙌🏻 💯

      Sally kennt die Mitarbeitenden bei Accso, sowie deren Skills und Projektreferenzen aus decidalo. Sie bestimmt für eine gegebene Rollenbeschreibung die passendsten Mitarbeitenden mit ihren Skills und Projektreferenzen. So liefert sie wertvolle Unterstützung bei der Belegung von Projekten.

      Neugierig? Hier findest du die Details und kannst Sally selbst ausprobieren: https://accso.atlassian.net/wiki/spaces/ACCSORES/pages/860782653/Challenger+6+-+Sally+matcht+Rollenbeschreibungen+auf+passende+Mitarbeitende

      Vielen Dank, liebe Accsonaut:innen, für das fleißige Abstimmen und ein besonderes Dankeschön an die vielen weiteren und ebenfalls äußerst spannenden Einreichungen. (Hier findest du sie alle: https://accso.atlassian.net/wiki/spaces/ACCSORES/pages/707657729/Accso+AI+Assistance+Challenge+2025).

      Ihr wohlverdienter Gewinn (ein Trackpad + ein Gutschein für das im Oktober erscheinenden Lego GameBoy Set) wurde Alina von Cody höchstpersönlich überreicht 🥳
' "Translate Blog Article"
run_business_task_with_timing 'Fantastisch, genau was ich gesucht habe!' "Dankeschön für Translate Blog Article"

sleep 10
