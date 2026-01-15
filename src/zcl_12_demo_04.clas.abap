CLASS zcl_12_demo_04 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_demo_04 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    WHILE NOT sy-index = 0.
      out->write( sy-index ).
    ENDWHILE.


    DO 10 TIMES.
      out->write( sy-index ).
    ENDDO.

  ENDMETHOD.
ENDCLASS.
