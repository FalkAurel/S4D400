CLASS zcl_12_abap_06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_abap_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(customer) = zcl_12_helper=>get_travel_with_customer( CONV #( 123 ) ).
        out->write( customer-travel_id ).
        out->write( |{ customer-begin_date } - { customer-end_date } | ).
        out->write( |{ customer-description }| ).
        out->write( customer-customer_id ).
        out->write( |Name: { customer-first_name } { customer-last_name }| ).
        out->write(  |Country: { customer-country_code }| ).
      CATCH zcx_abap_no_data.
        "handle exception
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
