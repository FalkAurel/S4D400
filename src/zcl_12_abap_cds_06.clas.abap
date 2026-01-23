CLASS zcl_12_abap_cds_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_abap_cds_06 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT FROM Z12_CustomerKPIs( p_city = 'Frankfurt' ) FIELDS * INTO TABLE @DATA(t).
    out->write( t ).
  ENDMETHOD.
ENDCLASS.
