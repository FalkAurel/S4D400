CLASS zcl_12_demo_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_demo_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT FROM Z12_Demo07( p_carrierid = 'LH', p_deadline = '20260120' ) FIELDS *  INTO TABLE @DATA(flights).
    out->write( flights ).
  ENDMETHOD.
ENDCLASS.
