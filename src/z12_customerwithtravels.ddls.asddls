@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ABAP CDS 12'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z12_CustomerWithTravels as select from Z_12_CUSTOMER as c
association [0..*] to Z12_Travel as _Travels on _Travels.CustomerId = c.CustomerId
{
  key CustomerId,
  FirstName,
  LastName,
  Title,
  Street,
  PostalCode,
  City,

  _Travels
} where CountryCode = 'DE'
