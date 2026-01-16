CLASS zcl_12_carrier DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA name TYPE string READ-ONLY.
    DATA airplanes TYPE z12_airplanes READ-ONLY.

    METHODS:
      constructor
        IMPORTING
          name TYPE string,
      add_plane
        IMPORTING
          airplane TYPE REF TO zcl_12_airplane,
      get_biggest_cargo_plane
        RETURNING VALUE(cargo_plane) TYPE REF TO zcl_12_cargo_plane
        RAISING zcx_abap_no_data .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_carrier IMPLEMENTATION.
  METHOD add_plane.
    APPEND airplane TO airplanes.
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.


  METHOD get_biggest_cargo_plane.
    DATA biggest TYPE i VALUE 0.

    DATA temp_cargo_plane TYPE REF TO zcl_12_cargo_plane.

    " Greedy-Search
    LOOP AT me->airplanes INTO DATA(airplane).
      IF airplane IS INSTANCE OF zcl_12_cargo_plane.
        temp_cargo_plane = CAST #( airplane ).

        DATA(current) = temp_cargo_plane->get_total_weight_in_tons(  ).

        IF current > biggest.
          biggest = current.
          cargo_plane = temp_cargo_plane.
        ENDIF.
      ENDIF.
    ENDLOOP.


    IF cargo_plane IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = 'Z12_CARRIER' value = 'Kein Cargo-Flugzeug' field = 'Leere Zeile' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
