@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Transient Average view'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_12_AverageRating as select from zabap_rating_a
{
  movie_uuid,
  sum(rating) / count(*) as AverageRating,
  case
    when avg(rating  as abap.dec(16, 2)) > cast('6.7' as abap.dec( 16, 2 )) then 3
    when avg(rating  as abap.dec(16, 2)) > cast('3.4' as abap.dec( 16, 2 )) then 2
    when avg(rating  as abap.dec(16, 2)) > cast('0.0' as abap.dec( 16, 2 )) then 1
    else 0 end as AverageRatingCriticality
  
  /* Transient Data */
} group by movie_uuid 
