CLASS zcl_12_abap_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_abap_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA customer_id TYPE /dmo/customer_id VALUE 2.
        DATA customer TYPE z12_customer_info.
        customer =  ZCL_ABAP_HELPER=>GET_CUSTOMER( customer_id = customer_id ).

        out->write( |Customer ID: { customer-customer_id }| ).
        out->write( |Name: { customer-first_name } { customer-last_name }| ).
        out->write( |City: { customer-city }| ).
        out->write( |Country: { customer-country_code }| ).
      CATCH   zcx_abap_no_data INTO DATA(e).
        out->write( e->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
ENDCLASS.
