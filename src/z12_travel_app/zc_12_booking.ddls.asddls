@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking Interface'
define view entity ZC_12_Booking
  as projection on ZR_12_Booking
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,

      FlightPrice,
      CurrencyCode,
      /* Associations */
      _Travels: redirected to parent ZC_12_TravelTP
}
