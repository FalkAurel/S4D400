CLASS zcl_12_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    CLASS-METHODS GET_TRAVEL_WITH_CUSTOMER
        IMPORTING
          TRAVEL_ID TYPE /DMO/TRAVEL_ID
        RETURNING VALUE(TRAVEL_WITH_CUSTOMER) TYPE ZABAP_TRAVEL_WITH_CUSTOMER
        RAISING zcx_abap_no_data.

    CLASS-METHODS GET_TRAVELS
      IMPORTING
        CUSTOMER_ID TYPE /DMO/CUSTOMER_ID
      RETURNING VALUE(TRAVELS) TYPE Z12_TRAVELS
      RAISING
        zcx_abap_no_data.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_helper IMPLEMENTATION.
METHOD GET_TRAVEL_WITH_CUSTOMER.
  DATA temp TYPE zabap_travel.

  SELECT SINGLE FROM /dmo/travel
    INNER JOIN /dmo/customer ON /dmo/customer~customer_id = /dmo/travel~customer_id
    FIELDS *
    WHERE /dmo/travel~travel_id = @TRAVEL_ID
    INTO CORRESPONDING FIELDS OF @TRAVEL_WITH_CUSTOMER.

  IF TRAVEL_WITH_CUSTOMER IS INITIAL.
    RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/TRAVEL'
                                            field = 'TRAVEL_ID'
                                            value = CONV #( travel_id ) ).
  ENDIF.
ENDMETHOD.
  METHOD get_travels.
   DATA temp TYPE zabap_travels.
   temp = ZCL_ABAP_HELPER=>GET_TRAVELS( customer_id ).

   SELECT FROM /dmo/travel
   FIELDS *
   WHERE customer_id = @customer_id
   INTO TABLE @TRAVELS.

   IF lines( TRAVELS ) = 0.
    RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/TRAVEL'
                                            field = 'CUSTOMER_ID'
                                            value = CONV #( customer_id ) ).
   ENDIF.
  ENDMETHOD.

ENDCLASS.
