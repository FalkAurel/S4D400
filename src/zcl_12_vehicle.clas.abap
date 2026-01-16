CLASS zcl_12_vehicle DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS set_make
      IMPORTING
        make TYPE string.
    METHODS get_make
      RETURNING VALUE(make) TYPE string.
    METHODS: get_model RETURNING VALUE(r_result) TYPE string,
      set_model IMPORTING model TYPE string,
      get_speed_in_kmh RETURNING VALUE(r_result) TYPE i,
      set_speed_in_kmh IMPORTING speed_in_kmh TYPE i.

      METHODS accelerate
        IMPORTING speed TYPE i
        RAISING zcx_12_value_too_high.

       METHODS brake
        IMPORTING speed TYPE i.



  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA make TYPE string.
    DATA model TYPE string.
    DATA speed_in_kmh TYPE i.


ENDCLASS.



CLASS zcl_12_vehicle IMPLEMENTATION.
  METHOD set_make.
    me->make = make.
  ENDMETHOD.
  METHOD get_make.
    make = me->make.
  ENDMETHOD.

  METHOD get_model.
    r_result = me->model.
  ENDMETHOD.

  METHOD set_model.
    me->model = model.
  ENDMETHOD.

  METHOD get_speed_in_kmh.
    r_result = me->speed_in_kmh.
  ENDMETHOD.

  METHOD set_speed_in_kmh.
    me->speed_in_kmh = speed_in_kmh.
  ENDMETHOD.

  METHOD accelerate.
    IF me->speed_in_kmh + speed > 300.

      RAISE EXCEPTION NEW zcx_12_value_too_high( value = speed ).
    ENDIF.
    me->speed_in_kmh += speed.
  ENDMETHOD.

  METHOD brake.
    me->speed_in_kmh -= speed.
  ENDMETHOD.

ENDCLASS.
