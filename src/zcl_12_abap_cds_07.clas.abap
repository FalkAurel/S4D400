CLASS zcl_12_abap_cds_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_abap_cds_07 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    SELECT FROM Z12_CustomerWithTravels FIELDS * INTO TABLE @DATA(d).
    out->write( d ).
  ENDMETHOD.
ENDCLASS.
