CLASS zcl_12_demo_03 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_12_demo_03 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA age TYPE i.
    DATA gender TYPE c LENGTH 1.
    DATA first_name TYPE c LENGTH 40.
    DATA last_name TYPE c LENGTH 40.

    age = 20.
    first_name = 'Julius'.
    last_name = 'Korbjuhn'.
    gender = 'm'.


    IF age < 18.
      out->write( |Hallo { first_name }.| ).
    ELSEIF gender = 'm' OR gender = 'M'.
      out->write( |Hallo Herr { last_name }.| ).
    ELSE.
      out->write( |Hallo Frau { last_name }.| ).
    ENDIF.

    out->write( |Hallo { cond #( WHEN age < 18                     THEN first_name
                                 WHEN gender = 'm' OR gender = 'M' THEN |Herr { last_name }|
                                 WHEN gender = 'w' OR gender = 'W' THEN |Frau { last_name }|
                                 ELSE last_name ) }.| ).

    IF age IS INITIAL.
      out->write( |kein Alter angegeben| ).
    ENDIF.

    "Fallunterscheidungen
    CASE gender.
      WHEN 'm'.
        out->write( |Hallo Herr { last_name }| ).
       WHEN 'w'.
        out->write( |Hallo Frau { last_name }| ).
        WHEN OTHERS.
        out->write( |Hallo { first_name }| ).
    ENDCASE.


    out->write( |Hallo { SWITCH #( gender WHEN 'm' OR 'M' THEN |Herr { last_name }|
                                          WHEN 'w' OR 'W' THEN |Frau { last_name }|
                                          ELSE first_name   ) }| ).

  ENDMETHOD.
ENDCLASS.
