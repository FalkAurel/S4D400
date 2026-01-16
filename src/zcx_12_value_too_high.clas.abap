CLASS zcx_12_value_too_high DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    DATA value TYPE i.


    CONSTANTS:
      BEGIN OF zcx_12_value_too_high,
        msgid TYPE symsgid VALUE 'Z12',
        msgno TYPE symsgno VALUE '000',
        attr1 TYPE scx_attrname VALUE 'VALUE',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF zcx_12_value_too_high.

    METHODS constructor
      IMPORTING
        !previous LIKE previous OPTIONAL
        value TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_12_value_too_high IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor(
    previous = previous
    ).

    if_t100_message~t100key = zcx_12_value_too_high.
    me->value = value.
  ENDMETHOD.
ENDCLASS.
