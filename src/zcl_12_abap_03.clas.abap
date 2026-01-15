CLASS zcl_12_abap_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_abap_03 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA operand1 TYPE z12_DECIMAL VALUE '5.00'.
    DATA operand2 TYPE z12_DECIMAL VALUE '12.10'.
    DATA result   TYPE z12_DECIMAL.

    DATA operator TYPE c LENGTH 2 VALUE '**'.



    CASE operator.
      WHEN '+'.
        result = operand1 + operand2.
      WHEN '-'.
        result = operand1 - operand2.
      WHEN '*'.
        result = operand1 * operand2.
      WHEN '/'.
        result = operand1 / operand2.
      WHEN '%'.
        result = zcl_12_calculator=>calculate_percentage( percentage = operand1 base = operand2 ).
      WHEN '**'.
        TRY.
            result = ZCL_ABAP_CALCULATOR=>CALCULATE_POWER( base = operand1 exponent = CONV #( operand2 ) ).
           CATCH  zcx_abap_exponent_too_high.
        ENDTRY.

      WHEN OTHERS.
        out->write( 'Operator not supported' ).
    ENDCASE.

    IF NOT result IS INITIAL.
      out->write( |{ operand1 } { operator } { operand2 } = { result }| ).
    ELSE.
      out->write( |Operation failed since the { operand2 } is too high of an exponent!| ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
