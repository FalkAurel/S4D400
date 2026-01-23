INTERFACE zif_12_partner
  PUBLIC .

  TYPES ty_airplanes TYPE TABLE OF REF TO zcl_12_airplane.
  DATA airplanes TYPE ty_airplanes READ-ONLY.

  METHODS:
    add_airplane
      IMPORTING airplane TYPE REF TO zcl_12_airplane.

ENDINTERFACE.
