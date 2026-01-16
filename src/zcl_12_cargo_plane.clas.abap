CLASS zcl_12_cargo_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_12_airplane
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i READ-ONLY.

    METHODS:
      constructor
        IMPORTING
          id TYPE string
          plane_type TYPE string
          empty_weight_in_tons TYPE i
          cargo_in_tons TYPE i
        RAISING zcx_abap_initial_parameter,

      get_total_weight_in_tons REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_cargo_plane IMPLEMENTATION.
  METHOD constructor.

    super->constructor( id = id plane_type = plane_type empty_weight_in_tons = empty_weight_in_tons ).

    IF cargo_in_tons IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'cargo_in_tons' ).
    ENDIF.

    me->cargo_in_tons = cargo_in_tons.

  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    total_weight = super->get_total_weight_in_tons( ) + me->cargo_in_tons.
  ENDMETHOD.

ENDCLASS.
