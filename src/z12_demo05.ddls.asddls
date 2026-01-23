@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo05: Aggregate Function'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z12_Demo05 as select from /dmo/flight
{
  key carrier_id,
  count(*) as NumberOfFlights,
  count(distinct plane_type_id) as NumberOfDifferentPlaneTypes,
  max(seats_occupied) as MaxOccupiedSeats,
  min(seats_occupied) as MinOccupiedSeats,
  sum(case when seats_occupied / seats_max > 0.7 then 1
       else 0 end) as NumberOfMostlyBookedOutFlights,
  sum(case when seats_occupied = 0 then 1 else 0 end) as EmptyFlights,
  avg(seats_occupied as abap.dec(12, 2)) as AverageOccupied,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  avg(price as abap.curr(16, 2)) as AverageFlightPrice,
  currency_code as CurrencyCode
}
group by carrier_id, currency_code having avg(price as abap.curr(16, 2))  < 50000
