CLASS zcl_12_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_demo_08 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    " SELECT [Spalten] FROM [Datenbankquelle] WHERE [Bedingung]

    DATA connection TYPE /dmo/connection.

    SELECT SINGLE FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = 'LH' AND connection_id = '0400'
      INTO @connection.
    out->write( connection ).


    DATA connections TYPE TABLE OF /dmo/connection.
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = 'LH'
      INTO TABLE @connections.


    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, distance, distance_unit
      WHERE carrier_id = 'LH' AND connection_id = '0400'
      INTO CORRESPONDING FIELDS OF @connection.

    out->write( connection ).

    " INNER JOIN
    SELECT FROM /dmo/connection
      INNER JOIN /dmo/carrier ON /dmo/connection~carrier_id = /dmo/carrier~carrier_id
      FIELDS
        /dmo/connection~carrier_id,
        /dmo/connection~connection_id,
        /dmo/carrier~name
      INTO TABLE @DATA(connections2).

    out->write( connections2 ).
  ENDMETHOD.
ENDCLASS.
