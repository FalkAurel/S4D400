@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Rating TP'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_12_RatingTP as select from ZI_12_Rating
association to parent ZR_12_MovieTP as _Movie
  on $projection.MovieUuid = _Movie.MovieUuid
{
  key RatingUuid,
  MovieUuid,
  UserName,
  Rating,
  RatingDate,
  
  _Movie
}
