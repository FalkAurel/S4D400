CLASS zcl_12_abap_07 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_abap_07 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(travels) = zcl_12_helper=>get_travels( CONV /dmo/customer_id( 123 ) ).
        DELETE travels WHERE begin_date < sy-datlo.

        out->write( travels ).
        FIELD-SYMBOLS <ref> TYPE /dmo/travel.
        LOOP AT travels ASSIGNING <ref>.
          <ref>-booking_fee = <ref>-booking_fee * '1.1'.
        ENDLOOP.

        SORT travels BY description DESCENDING.

        out->write( travels ).
      CATCH zcx_abap_no_data.
        "handle exception
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
