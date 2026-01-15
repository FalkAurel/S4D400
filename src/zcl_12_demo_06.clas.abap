CLASS zcl_12_demo_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_demo_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE z12_connection.

    connection-carrier_id = '232'.
    connection-connection_id = 'JFK'.

    out->write( connection-carrier_id ).
    out->write( connection-connection_id ).


    DATA flight_info TYPE z12_flight_info.
    flight_info-carrier_id = 'LH'.
    flight_info-connection_id = '0400'.
    flight_info-flight_date = '20220101'.

    DATA flight_extended TYPE z12_flight_extended.
    flight_extended = CORRESPONDING #( base ( flight_extended ) flight_info ).
    flight_extended-airport_from_id = 'FRA'.
    flight_extended-airport_to_id = 'JFK'.


  ENDMETHOD.
ENDCLASS.
