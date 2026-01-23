@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Travel'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_12_TravelTP
  provider contract transactional_query
  as projection on ZR_12_TravelTP
{
  key TravelId,
      @Consumption.valueHelpDefinition: [{ entity: { name: '/DMO/I_Agency_StdVH', element: 'AgencyID' } }]
      AgencyId,
      
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_12_CustomerVH', element: 'CustomerId' } }]
      CustomerId,
      BeginDate,
      EndDate,
      BookingFee,
      TotalPrice,
      
      @Consumption.valueHelpDefinition: [{ entity: { name: 'I_CurrencyStdVH', element: 'Currency' } }]
      CurrencyCode,
      
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      Description,
      Status,
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      
      /* Transient Data */
      Criticality,
      CustomerName,
      
      _Bookings: redirected to composition child ZC_12_Booking
}
