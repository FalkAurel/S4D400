@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo08: Assocaition'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z12_Demo08
  as select from /dmo/connection as c
  association [1..1] to /dmo/carrier as _Carrier on  $projection.CarrierID = _Carrier.carrier_id

  association [0..*] to /dmo/flight  as _Flights on  _Flights.carrier_id    = $projection.CarrierID
                                                 and _Flights.connection_id = $projection.ConnectionId
{
  key carrier_id      as CarrierID,
  key connection_id   as ConnectionId,
      airport_from_id as AirportFromId,
      airport_to_id   as AirportToId,
      
      
      _Carrier,
      _Flights
}
