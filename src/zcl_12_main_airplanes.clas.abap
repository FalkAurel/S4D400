CLASS zcl_12_main_airplanes DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_main_airplanes IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA airplane TYPE REF TO zcl_12_airplane.
    DATA carrier TYPE REF TO zcl_12_carrier.

    carrier = NEW #( name = 'Lufthansa' ).


    TRY.
        airplane = NEW zcl_12_passenger_plane( empty_weight_in_tons = 1 id = '0400' number_of_seats = 3 plane_type = 'Boeing' ).
        carrier->add_plane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(e).
        out->write( e->get_text( ) ).
    ENDTRY.


    TRY.
        airplane = NEW zcl_12_cargo_plane( empty_weight_in_tons = 1 id = '0400' cargo_in_tons = 3 plane_type = 'Boeing' ).
        carrier->add_plane( airplane ).
      CATCH zcx_abap_initial_parameter INTO DATA(error).
        out->write( error->get_text( ) ).
    ENDTRY.


    TRY.
        DATA(biggest_cargo_plane) = carrier->get_biggest_cargo_plane(  ).
        out->write( |The biggest Cargo plane is { biggest_cargo_plane->id } with a capacity of { biggest_cargo_plane->get_total_weight_in_tons(  ) }| ).
      CATCH zcx_abap_no_data INTO DATA(error2).
        out->write( error2->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
