@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Booking'
define view entity ZR_12_Booking
  as select from ZI_12_Booking
  association to parent ZR_12_TravelTP as _Travels on $projection.TravelId = _Travels.TravelId
{
  key TravelId,
  key BookingId,
      BookingDate,
      CustomerId,
      CarrierId,
      ConnectionId,
      FlightDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      FlightPrice,
      CurrencyCode,
      _Travels // Make association public
}
