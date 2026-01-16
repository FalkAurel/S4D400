CLASS zcl_12_airplane DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.

    DATA id TYPE string READ-ONLY.
    DATA plane_type TYPE string READ-ONLY.
    DATA empty_weight TYPE i READ-ONLY.


    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.

    METHODS:
      constructor IMPORTING
                            id                   TYPE string
                            plane_type           TYPE string
                            empty_weight_in_tons TYPE i
                  RAISING   zcx_abap_initial_parameter,
      set_id IMPORTING i_id TYPE string,
      set_plane_type IMPORTING plane_type TYPE string,
      set_empty_weight IMPORTING empty_weight_in_tons TYPE i,

      get_total_weight_in_tons RETURNING VALUE(total_weight) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_airplane IMPLEMENTATION.
  METHOD set_id.
    me->id = i_id.
  ENDMETHOD.

  METHOD set_plane_type.
    me->plane_type = plane_type.
  ENDMETHOD.

  METHOD set_empty_weight.
    me->empty_weight = empty_weight_in_tons.
  ENDMETHOD.

  METHOD constructor.

    IF plane_type IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'plane_type' ).
    ELSEIF id IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'id' ).
    ELSEIF empty_weight_in_tons IS INITIAL.
      RAISE EXCEPTION NEW zcx_abap_initial_parameter( parameter = 'empty_weight_in_tons' ).
    ENDIF.

    me->plane_type = plane_type.
    me->id = id.
    me->empty_weight = empty_weight_in_tons.
    number_of_airplanes += 1.
  ENDMETHOD.

  METHOD get_total_weight_in_tons.
    total_weight = me->empty_weight * '1.1'.
  ENDMETHOD.

ENDCLASS.
