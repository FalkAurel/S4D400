CLASS zcl_12_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_demo_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA result_i TYPE i.

    result_i = 5 + 3.
    out->write( result_i ).

    result_i = 5 - 3.
    out->write( result_i ).

    result_i = 5 * 3.
    out->write( result_i ).

    result_i = 5 / 3.
    out->write( result_i ).

    result_i = 5 div 3.
    out->write( result_i ).

    result_i = 5 ** 3.
    out->write( result_i ).

    result_i = result_i + 1.
    result_i += 1.



  ENDMETHOD.
ENDCLASS.
