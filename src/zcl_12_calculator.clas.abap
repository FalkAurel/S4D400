CLASS zcl_12_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS divide
      IMPORTING
                operand1      TYPE z12_decimal
                operand2      TYPE z12_decimal
      RETURNING VALUE(result) TYPE z12_decimal
      RAISING   cx_sy_zerodivide.

    CLASS-METHODS calculate_percentage
      IMPORTING
              percentage              TYPE z12_decimal
              base                    TYPE z12_decimal
      RETURNING VALUE(rueckgabe_wert) TYPE z12_decimal.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_calculator IMPLEMENTATION.
  METHOD divide.
    IF operand2 IS INITIAL.
      RAISE EXCEPTION TYPE cx_sy_zerodivide.
    ENDIF.

    result = operand1 / operand2.
  ENDMETHOD.

  METHOD calculate_percentage.
    rueckgabe_wert = ( base * percentage ) / 100.
  ENDMETHOD.
ENDCLASS.
