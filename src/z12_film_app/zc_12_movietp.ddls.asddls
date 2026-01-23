@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Public facing Interface'
@Search.searchable: true
@Metadata.allowExtensions: true
define root view entity ZC_12_MovieTP
provider contract transactional_query
as projection on ZR_12_MovieTP
{
  key MovieUuid,
  @Search.defaultSearchElement: true
  @Search.fuzzinessThreshold: 0.7
  Title,
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_12_GENREVH', element: 'Text' } }]
  Genre,
  PublishingYear,
  RuntimeInMin,
  ImageUrl,
  CreatedAt,
  CreatedBy,
  LastChangedAt,
  LastChangedBy,
  
  /* Transient Data */
  AverageRating,
  AverageRatingCriticality,
  
  _Ratings : redirected to composition child ZC_12_RatingTP,
  _AverageRating
}
