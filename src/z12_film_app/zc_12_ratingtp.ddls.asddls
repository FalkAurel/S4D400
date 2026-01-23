@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Public facing Interface'
@Metadata.allowExtensions: true
define view entity ZC_12_RatingTP as projection on ZR_12_RatingTP
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  /* Associations */
  _Movie: redirected to parent ZC_12_MovieTP
}
