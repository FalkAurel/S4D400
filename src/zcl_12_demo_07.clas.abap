CLASS zcl_12_demo_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_demo_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " Deklaration

    DATA connections TYPE z12_connections. "Tabellentyp
    DATA connections2 TYPE TABLE OF z12_connection. "Strukturtyp

    " Hinzufügen von Datensätzen

    connections = VALUE z12_connections(
    ( carrier_id = 'LH' connection_id = '0400' )
    ( carrier_id = 'UA' airport_from_id = 'FRA' )
    ( connection_id = '0401' airport_to_id = 'FRA' )
    ).


    " Anfügen von Datensätzen
    DATA(connection) = VALUE z12_flight_extended(
      carrier_id = 'AZ'
      connection_id = '0017'
    ).

    connections = value #( base connections ( connection ) ).
    APPEND connection TO connections.


    " Lesen von Einzelsätzen
    TRY.
        connection = connections[ 0 ]. " per Index
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.

    IF line_exists( connections[ connection_id = '0' ] ).
      connection = connections[ connection_id = '0400' ]. " per Schlüsselkomponente
    ENDIF.

    " Lesen von mehreren Datensätzen

    LOOP AT connections INTO connection WHERE NOT ( carrier_id IS INITIAL AND airport_from_id IS INITIAL AND airport_to_id IS INITIAL ).
      out->write( connection ).
      out->write( | { sy-tabix } { connection-carrier_id } | ).
    ENDLOOP.


    "Ändern von mehrerer Datensätze
    LOOP AT connections REFERENCE INTO DATA(ref) WHERE carrier_id IS NOT INITIAL.
      ref->carrier_id = 'JFK'.
    ENDLOOP.


    " Am schnellsten
    FIELD-SYMBOLS <ref_connection> TYPE z12_flight_extended.
    LOOP AT connections ASSIGNING <ref_connection>.
      <ref_connection>-airport_from_id = 'BER'.
    ENDLOOP.


    " Sortieren
    SORT connections BY carrier_id DESCENDING connection_id ASCENDING.

    " Löschen
    DELETE connections WHERE airport_from_id = 'BER'.
    DELETE connections FROM 1.
    CLEAR  connections.

    out->write( lines( connections ) ).

  ENDMETHOD.
ENDCLASS.
