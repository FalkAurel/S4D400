CLASS zcl_12_demo_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_demo_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(result) = zcl_12_calculator=>divide( operand1 = 5 operand2 = '0.01' ).
        out->write( result ).
      CATCH cx_sy_zerodivide INTO DATA(e).
        out->write( e ).
     ENDTRY.



     result = zcl_12_calculator=>calculate_percentage( percentage = 12 base = 100 ).

     out->write( result ).

     TRY.
        out->write( ZCL_ABAP_CALCULATOR=>CALCULATE_POWER( base = 10 exponent = 1 ) ).
       CATCH zcx_abap_exponent_too_high INTO DATA(k).
        out->write( k ).
     ENDTRY.

  ENDMETHOD.
ENDCLASS.
