@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'Restricted Access to Interface'
@EndUserText.label: 'Movies'
define root view entity ZR_12_MovieTP
  as select from ZI_12_MOVIE
  association [1..1] to ZI_12_AverageRating as _AverageRating on _AverageRating.movie_uuid = $projection.MovieUuid
  association [1..1] to ZI_12_GenreText as _GenreText on _GenreText.Kuerzel = $projection.kur
  composition [0..*] of ZR_12_RatingTP as _Ratings
{
  key MovieUuid,
      Title,
      PublishingYear,
      RuntimeInMin,
      ImageUrl,
      CreatedAt,
      CreatedBy,
      LastChangedAt,
      LastChangedBy,
      Genre as kur,

        /* Transient Data */
      _AverageRating.AverageRating as AverageRating,
      _AverageRating.AverageRatingCriticality as AverageRatingCriticality,
      _GenreText.Langweise as Genre,
      
      _Ratings,
      _AverageRating,
      _GenreText

}
