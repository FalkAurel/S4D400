CLASS zcl_12_main_vehicles DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_main_vehicles IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA vehicle TYPE REF TO zcl_12_vehicle.
    DATA vehicles TYPE TABLE OF REF TO zcl_12_vehicle.

    vehicle = NEW #(  ).
    vehicle->set_make( 'WV' ).
    vehicle->set_model( 'Tiguan' ).
    vehicle->set_speed_in_kmh( 0 ).

    APPEND vehicle TO vehicles.



    vehicle = NEW #(  ).
    vehicle->set_make( 'Skoda' ).
    vehicle->set_model( 'Octavia' ).
    vehicle->set_speed_in_kmh( 0 ).

    APPEND vehicle TO vehicles.


    TRY.
        vehicle->accelerate( 3000 ).
      CATCH zcx_12_value_too_high.
        out->write( 'Value too high' ).
    ENDTRY.


    LOOP AT vehicles INTO DATA(ref).
      out->write( |{ ref->get_make( ) } { ref->get_model(  ) }| ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
