CLASS zcl_12_abap_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_abap_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA customer TYPE /dmo/customer .

    customer-first_name = 'Bruce'.
    customer-last_name = 'Wayne'.
    customer-city = 'Gotham City'.
    customer-country_code = 'US'.

    out->write( |{ customer-first_name } { customer-last_name } lives in { customer-city } ({ customer-country_code }) | ).

  ENDMETHOD.
ENDCLASS.
