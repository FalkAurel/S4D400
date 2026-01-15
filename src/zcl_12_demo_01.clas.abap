CLASS zcl_12_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_demo_01 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

**********************************************************************
* Hello World
**********************************************************************
    DATA text TYPE string.

    text = 'Hello World'. "Deklaration

*Ausgabe
    out->write( text ).

**********************************************************************
* Datentypen und Datenobjekte
**********************************************************************

    "Standardtyp
    DATA age TYPE i. "Ganze Zahlen
    DATA salary_in_euro TYPE p LENGTH 16 DECIMALS 2 . "Kommazahlen als gepackte Zahlen
    DATA first_name TYPE c LENGTH 40 . " Zeichenkette fester Länge
    DATA matriculation_number TYPE n LENGTH 7. " Ziffernfolge
    DATA flag TYPE abap_boolean .
    DATA christmas TYPE d. "Datumsangabe
    DATA noon TYPE t. " Zeitangabe

    " Datenelement
    DATA carrier_id TYPE /dmo/carrier_id .

***************************************************************
* Wertzuweisungen
**********************************************************************

    age = 42.
    salary_in_euro = '6000.52'.
    first_name = 'Julius'.
    matriculation_number = '1234567' .
    christmas = '20251224'.
    noon = '120000'.

    flag = 'X'.
    clear flag .


    DATA last_name TYPE c LENGTH 40 VALUE 'Korbjuhn'.
    DATA(size_in_cm) = 179.
    size_in_cm = '234'.

    IF NOT ( flag = 'X' ).
      out->write( 'Hallo Welt 2' ).
    ENDIF.


  ENDMETHOD.

ENDCLASS.
