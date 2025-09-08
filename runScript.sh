#!/bin/bash

# Usage: ./runtime.sh [llm-model]
# Beispiel: ./runtime.sh llama3.2:1b

LLM_MODEL="${1:-llama3.2:1b}"

echo 'Start real test'

<<<<<<< HEAD
# Task: Code Refactoring
=======
>>>>>>> 6f42db5 (init)
echo 'gib mir Tipps, wie man die nachfolgende Funktion refactoren kann:

def validierePruefziffer(in_):
    pre = int(in_[:3])
    if pre != 978:
       return False
    postStr = in_[4:]
    if len(postStr) != 10:
        return False
    post = int(postStr)
    sum_ = 38
    for x in range(0, 10, 2):
       sum_ += (ord(postStr[x]) - 48) * 3 + (ord(postStr[x + 1]) - 48)
    if sum_ % 10 == 0:
        return True
    return False" | ollama run "$LLM_MODEL"

<<<<<<< HEAD
# Task: Code Quality (Code Review)
=======
>>>>>>> 6f42db5 (init)
echo "You are an experienced software engineer and my coding mentor. Please perform a thorough code review and tell me what to improve without giving me a complete solution.

class ISBNChecksumValidator:
    VALID_ISBN13_PREFIX = 978
    CHECKSUM_OF_PREFIX = 38
    VALID_ISBN_LENGTH = 10

    def isISBN13(self, in_):
        return self.refactoredIsISBN13(in_)

    def oldIsISBN13(self, in_):
        pre = int(in_[:3])
        if pre != self.VALID_ISBN13_PREFIX:
            return False
        postStr = in_[4:]
        if len(postStr) != self.VALID_ISBN_LENGTH:
            return False
        post = int(postStr)
        sum_ = self.CHECKSUM_OF_PREFIX
        for x in range(0, 10, 2):
            sum_ += (ord(postStr[x]) - ord('0')) * 3 + (ord(postStr[x + 1]) - 48)
        if sum_ % 10 == 0:
            return True
        return False

    # Here we could also throw an error if the char is not a digit a.k.a. ![0-9]
    def parseCharToInt(self, c):
        return ord(c) - ord('0')

    def refactoredIsISBN13(self, isbn13):
        prefix = int(isbn13[:3])
        if prefix != self.VALID_ISBN13_PREFIX:
            return False
        # Separate the prefix from the rest of the ISBN after the '-' TODO: Unnecessary?
        isbn = isbn13[4:]
        if len(isbn) != self.VALID_ISBN_LENGTH:
            return False
        checksum = self.CHECKSUM_OF_PREFIX
        for i in range(len(isbn)):
            digit = self.parseCharToInt(isbn[i])
            if i % 2 == 0:
                checksum += digit * 3
            else:
                checksum += digit
        return checksum % 10 == 0' | ollama run "$LLM_MODEL"

<<<<<<< HEAD
# Task: Documentation
=======
>>>>>>> 6f42db5 (init)
echo 'Kommentiere den Code. Ein Block-Kommentar je Funktion, bitte, sowie in-line Kommentare bei besonders komplizierten Stellen. Vermeide Kommentare, die nur erklären, was sowieso aus dem Code ersichtlich ist.

package aufgabe1;

public class RomanNumeralCalculator {

    public static int romanToInt(String roman) {
        if (roman == null || roman.isEmpty()) return -1;
        roman = roman.toUpperCase();
        int[] values = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
        String[] numerals = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};
        int i = 0, result = 0;
        while (roman.length() > 0 && i < numerals.length) {
            if (roman.startsWith(numerals[i])) {
                result += values[i];
                roman = roman.substring(numerals[i].length());
            } else {
                i++;
            }
        }
        if (!roman.isEmpty()) return -1;
        return result;
    }

    public static String intToRoman(int number) {
        if (number < 1 || number > 3999) return null;
        int[] values = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
        String[] numerals = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < values.length; i++) {
            while (number >= values[i]) {
                number -= values[i];
                sb.append(numerals[i]);
            }
        }
        return sb.toString();
    }

    public static boolean isValidRoman(String roman) {
        return romanToInt(roman) > 0;
    }

    public static String addRomans(String r1, String r2) {
        int n1 = romanToInt(r1);
        int n2 = romanToInt(r2);
        if (n1 < 1 || n2 < 1 || n1 + n2 >= 3999) return null;
        return intToRoman(n1 + n2);
    }

    public static String subtractRomans(String r1, String r2) {
        int n1 = romanToInt(r1);
        int n2 = romanToInt(r2);
        if (n1 < 1 || n2 < 1 || n1 - n2 < 1) return null;
        return intToRoman(n1 - n2);
    }
}
' | ollama run "$LLM_MODEL"

<<<<<<< HEAD
# Task: Find Bugs
=======
>>>>>>> 6f42db5 (init)
echo 'Ich bekomme Compile-Fehler bei dem folgenden Code. Außerdem stimmt die Funktionalität noch nicht. Bitte überarbeite den Code

package aufgabe3;

import javaIch bekomme Compile-Fehler bei dem folgenden Code. Außerdem stimmt die Funktionalität noch nicht. Bitte überarbeite den Code

package aufgabe3;

import java.util.*;
import java.util.stream.*;

/**
 * Diese Klasse demonstriert einige Fehler im Umgang mit Listen und Streams.
 * Sie enthält eine Methode, die Wörter verarbeitet und dabei einige unerwartete
 * Ergebnisse liefert.
 */
public class MysteryError {

    public static void processWords(List<String> words, char forbidden) {
        List<?> filtered = words;
        for (String word : words) {
            if (word.indexOf(forbidden) >= 0) {
                filtered.remove(word);
            }
        }

        String suffix = "!";
        words.forEach(w -> {
            w = w.toUpperCase() + suffix;
            System.out.println(w);
        });

        Stream<String> stream = filtered.stream();
        stream.forEach(System.out::println);
        stream.forEach(System.out::println);
    }

    public static void main(String[] args) {
        List<String> words = new ArrayList<>(Arrays.asList("java", "lambda", "stream", "error", "generics"));
        processWords(words, 'a');
    }
}

.util.*;
import java.util.stream.*;

/**
 * Diese Klasse demonstriert einige Fehler im Umgang mit Listen und Streams.
 * Sie enthält eine Methode, die Wörter verarbeitet und dabei einige unerwartete
 * Ergebnisse liefert.
 */
public class MysteryError {

    public static void processWords(List<String> words, char forbidden) {
        List<?> filtered = words;
        for (String word : words) {
            if (word.indexOf(forbidden) >= 0) {
                filtered.remove(word);
            }
        }

        String suffix = "!";
        words.forEach(w -> {
            w = w.toUpperCase() + suffix;
            System.out.println(w);
        });

        Stream<String> stream = filtered.stream();
        stream.forEach(System.out::println);
        stream.forEach(System.out::println);
    }

    public static void main(String[] args) {
        List<String> words = new ArrayList<>(Arrays.asList("java", "lambda", "stream", "error", "generics"));
        processWords(words, 'a');
    }
}
' | ollama run "$LLM_MODEL"

<<<<<<< HEAD
# Task: Explain Code
=======
>>>>>>> 6f42db5 (init)
echo 'Was passiert hier? 

private infix fun BookingSystem.buche(reservation: Reservation) {
    this.booktable(reservation.tableNumber.toInt(), reservation.persons, reservation.occasion.toString(), null, reservation.customer?.customerId ?: 0)
}
' | ollama run "$LLM_MODEL"

echo 'was passiert hier: 

package org.accso.kafka.streams.praktikum.model.episode.processor; 
import org.accso.kafka.streams.praktikum.helper.KafkaConsumerDescriber; 
import org.accso.kafka.streams.praktikum.model.episode.stream.AbstractKafkaStreamEpisode; 
import org.accso.kafka.streams.praktikum.model.episode.stream.KafkaStreamEpisodeRating; 
import org.apache.kafka.common.serialization.DoubleDeserializer; 
import org.apache.kafka.common.serialization.StringDeserializer; 
import static org.accso.kafka.streams.praktikum.helper.Constants.TOPIC_EPISODE_RATING_VALUE; 
public class EpisodeRatingProcessor extends AbstractEpisodeProcessor<String, Double> { 
public EpisodeRatingProcessor(AbstractKafkaStreamEpisode episodeStream, KafkaConsumerDescriber<String, Double> describer) {
 super(episodeStream, describer); 
 } 
 
 public static void main(String[] args) throws InterruptedException {
  final EpisodeRatingProcessor processor = new EpisodeRatingProcessor( 
  new KafkaStreamEpisodeRating(), 
  new KafkaConsumerDescriber<>( TOPIC_EPISODE_RATING_VALUE, new StringDeserializer(), new DoubleDeserializer() ) ); 
  processor.start("Rating of episode"); } }' | ollama run "$LLM_MODEL"

<<<<<<< HEAD
# Task: Simplify Code -> Java to Kotlin
=======
>>>>>>> 6f42db5 (init)
echo '
Kannst du mir dieses File in Kotlin übersetzen. Bitte achte auf die Vorteile von Kotlin von lesbar und möglichst kompakten selbst sprechenden Code. 
Bitte nutze wenn möglich features von Kotlin auch wenn sie im vorherigen Java Code "aufwändiger" gelöst wurden weil java dafür vermutlich keine oder unzureichende Werkzeuge bietet: 
package de.accso.flexinale.core.domain.services;

import de.accso.flexinale.core.domain.dao.KontingentDao;
import de.accso.flexinale.core.domain.dao.TicketDao;
import de.accso.flexinale.core.domain.dao.VorfuehrungDao;
import de.accso.flexinale.core.domain.model.*;
import de.accso.flexinale.shared_kernel.UUIDGenerator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

public class TicketService {

    private static final Logger LOGGER = LoggerFactory.getLogger(TicketService.class);

    private final TicketDao ticketDao;

    private final VorfuehrungDao vorfuehrungDao;

    private final KontingentDao kontingentDao;

    public TicketService(final TicketDao ticketDao, final VorfuehrungDao vorfuehrungDao,
                         final KontingentDao kontingentDao) {
        this.ticketDao = ticketDao;
        this.vorfuehrungDao = vorfuehrungDao;
        this.kontingentDao = kontingentDao;
    }

    public void loeseGutscheineOnlineFuerVorfuehrungEin(final String vorfuehrungId, final Besucher besucher, final int anzahlGutscheine) {
        loeseGutscheineFuerVorfuehrungEin(vorfuehrungId, besucher, anzahlGutscheine, Ticket.VerkaufsKanal.ONLINE);
    }

    @SuppressWarnings("SameParameterValue")
    private void loeseGutscheineFuerVorfuehrungEin(final String vorfuehrungId, final Besucher besucher,
                                                   final int anzahlGutscheine,
                                                   final Ticket.VerkaufsKanal verkaufsKanal) {
        Vorfuehrung vorfuehrung = vorfuehrungDao.findById(vorfuehrungId).get();
        vorfuehrung.verkaufeTickets(verkaufsKanal, anzahlGutscheine);

        for (int i = 0; i < anzahlGutscheine; i++) {
            Ticket ticket = new Ticket(UUIDGenerator.createID(), vorfuehrung.film, vorfuehrung, besucher, verkaufsKanal);
            ticketDao.save(ticket);
        }

        // save reduction of the Kontingent reduction
        kontingentDao.save(vorfuehrung.kontingent);

        LOGGER.info(anzahlGutscheine + " Ticket/Tickets gekauft für die Vorführung " + vorfuehrung.id
                + ", Besucher " + besucher.login + " auf dem Verkaufskanal " + verkaufsKanal);
    }

    public int gesamtZahlDerTicketsFuer(final Besucher eingeloggterBesucher) {
        return ticketDao.gesamtZahlDerTicketsFuer(eingeloggterBesucher);
    }

    public List<Ticket> findByBesucherOrderByZeit(final Besucher eingeloggterBesucher) {
        return ticketDao.findByBesucherOrderByZeit(eingeloggterBesucher);
    }
}' | ollama run "$LLM_MODEL"

<<<<<<< HEAD
# Task: Generate code snippets
=======
>>>>>>> 6f42db5 (init)
echo 'Hilf mir, eine Methode zu implemeniteren, die prüft, ob ein gegebener Aufenthalt im Schengen-Raum gemäß der sogenannten 90/180-Regel zulässig ist.
Für Schengen-Visa gilt: Innerhalb eines beliebigen Zeitraums von 180 Tagen darf sich eine Person maximal 90 Tage im Schengen-Raum aufhalten. Die Regel funktioniert entsprechend dem Sliding-Window-Prinzip – jeder Tag eines geplanten Aufenthalts verschiebt das betrachtete Zeitfenster um einen Tag nach vorne.
Die Methode soll in Java implementiert werden und folgender Signatur entsprechen:
public static boolean isStayAllowed(List<DateInterval> previousStays, DateInterval plannedStay) {
  // TODO!
}' | ollama run "$LLM_MODEL"

<<<<<<< HEAD
# Task: archGenerate Code for less known programming languages
=======
>>>>>>> 6f42db5 (init)
echo '
Ich habe folgende API mit der ich mir berechnen kann wann ein Task carbon aware also mit so grünem Strom wie möglich asugeführt werden kann. 
Ich möchte nun in Homeassistant diese API nutzen um mit den Variablen einfach für verschiedene Tasks in Automationen den besten Zeitpunkt ab zu fragen zudem meine Anwendung laufen kann. 
/emissions/forecasts/current Get the best execution time with minimal grid carbon intensity Get the best execution time with minimal grid carbon intensity. 
A time intervall of the given duration within the earliest and latest execution time with the most renewable energy in the power grid of the location Parameters 
Try it out NameDescription location* array[string] (query) Comma seperated list of named locations (de,fr) or multiple location (location=fr & location=de) Examples: 
GermanyAustria and FranceAzure francecentralAWS eu-west-3GCP europe-west9 dataStartAt string($date-time) (query) 
Start time boundary of forecasted data points. Ignores current forecast data points before this time. 
Defaults to the earliest time in the forecast data. Examples: NowIn one hour dataEndAt string($date-time) (query) End time boundary of forecasted data points. 
Ignores current forecast data points after this time. Defaults to the latest time in the forecast data. Examples: 
In five hoursIn ten hours windowSize integer($int32) (query) The estimated duration (in minutes) of the workload. 
Defaults to 5 Minutes (This is different from GSF SDK which default to the duration of a single forecast data point).'| ollama run "$LLM_MODEL"

<<<<<<< HEAD
# Task: Software Architektur
=======
>>>>>>> 6f42db5 (init)
echo 'Berate mich als erfahrener SW Architekt mit Betriebserfahrung. 
Ich habe ein System bestehend aus circa 10 eigenständigen Services. 
Davon sind fünf in einem Code-Repo, drei in eigenen Repos und zwei sind Dienste, die als komplette Docker-Images übernommen werden. 
Bisher haben alle Komponenten in Jira eigene Versionen - die Images haben wrapper, die sie versionieren. 
Jetzt hat sich die Betriebsorganisation geändert und Releases sind sehr langsam und schwierig. Welche Optionen hat man, mit den Versionsnummern umzugehen?
 Was spricht dafür, alle eigene Software im Gleichschritt zu versionieren?' | ollama run "$LLM_MODEL"

echo 'Vervollständige den BookingSystemTest.

package de.accso.praktikum.reservationsystem.de.accso.praktikum.reservationsystem

import de.accso.praktikum.reservationsystem.BookingSystem
import de.accso.praktikum.reservationsystem.Occasion
import de.accso.praktikum.reservationsystem.Reservation
import de.accso.praktikum.reservationsystem.SimpleDatabase
import io.mockk.*
import org.assertj.core.api.Assertions.assertThat
import org.assertj.core.api.Assertions.assertThatThrownBy
import org.junit.jupiter.api.Test

internal class ReservationTest {
/**
 * Erstelle für die Datenbank einen Mock und das Buchungssystem einen Spy.
 * Die Datenbank soll für beliebige Aufrufe der Funktion getCustomer null zurückliefern und die angefragte customerId
 * unter customerId speichern.
 *
 * Für Aufrufe der Funktion booktable mit tableNr = 0 soll eine RuntimeException geworfen werden.
 *
 * Schreibe einen assert für die CustomerId und ein verify für getCustomer.
 *
 * Hinweise:
 * * slot<Int> kann mit einem capture() zusammen verwendet werden um Daten abzufangen und per assert zu testen
 * * Hilfe findest du unter: <https://mockk.io/>
 */
@Test
fun `Buchungssystem Test`() {
    // arrange
    val database = TODO()
    val system = TODO()
    val customerId = slot<Int>()
    TODO("getCustomer soll null zurückliefern")
    TODO("booktable mit Tischnummer 0 soll eine Exception werfen")

    // act
    assertThatThrownBy { system.booktable(0, 5, "Other", null, 5) }.isInstanceOf(RuntimeException::class.java)
    system.booktable(1, 2, "Other", null, 1)

    // assert
    TODO()
    TODO()

}

/**
 * Überlege dir wie man möglichst natürlichsprachig einen Testfall aufsetzen kann, der Tisch Nummer 4 für 8 Personen auf einen Namen reserviert.
 *
 * Beispiel:
 *
 * val `eine Reservierung` = ReservationBuilder()
 *
 *  system buche (
 *      `eine Reservierung` fuerTisch 4 fuer 8 `auf Name` "Jon Snow" `Wohnhaft in`
 *          "the North" Telefonnummer "014352 32 23" bitte "sehr"
 *  )
 *
 */
@Test
fun foo() {
    val database = mockk<SimpleDatabase>()
    every { database.getCustomer(any()) } returns null
    val system = BookingSystem(database)

    TODO("Versuche möglichst natürlichsprachig einen Testfall zu erstellen, der unten genanntes Assert erfüllt")

    assertThat(system.myList).containsExactly(Reservation(4, 8, Occasion.Other, null))
}

}' | ollama run "$LLM_MODEL"
#echo " " | ollama run "$LLM_MODEL"
#echo " " | ollama run "$LLM_MODEL"
sleep 10