@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel'
define root view entity ZR_12_TravelTP
  as select from ZI_12_Travel
  association [1..1] to ZI_12_CustomerText as _CustomerText on $projection.CustomerId = _CustomerText.CustomerId
  
  composition [0..*] of ZR_12_Booking as _Bookings
{
  key TravelId,
      AgencyId,
      @ObjectModel.text.element: [ 'CustomerName' ]
      CustomerId,
      BeginDate,
      EndDate,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      BookingFee,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      TotalPrice,
      CurrencyCode,
      Description,
      Status,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      
      /* Transient Data */
      case 
        when Status = 'N' then 1
        when Status = 'P' then 2
        when Status = 'B' then 3
        else 0 end as Criticality,
        
      
      /*  */
      _CustomerText.CustomerName as CustomerName,

      // Associations

      _Bookings,
      _CustomerText
}
