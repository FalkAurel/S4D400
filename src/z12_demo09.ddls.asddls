@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Demo09: Path Expression'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z12_Demo09 as select from Z12_Demo08
{
  key CarrierID,
  key ConnectionId,
  AirportFromId,
  AirportToId,
  _Carrier.name as Name,
  /* Associations */
  _Carrier,
  _Flights
}
