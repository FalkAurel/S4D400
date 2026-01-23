@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ABAP CDS 05'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z12_CustomerKPIs
  with parameters 
    P_City: /dmo/city
as select from Z12_TravelWithCustomer

{
  key CustomerId,
  CustomerName,
  Street,
  PostalCode,
  City,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum(cast(TotalPrice as abap.dec( 12, 2 )))
   + sum(cast (BookingFee as abap.dec( 12, 2 ))) as TotalRevenue,
  CurrencyCode,
  Duration as AverageDuration,
  count(distinct AgencyId) as NumberOfDistinctAgenc
} where $parameters.P_City = City group by CustomerId, CustomerName, Street, PostalCode, City, CurrencyCode, Duration having sum(TotalPrice + BookingFee) > 5000
