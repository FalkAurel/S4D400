@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'GenreText Information'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_12_GenreText as select distinct from zabap_movie_a as m
inner join DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:'ZABAP_GENRE' ) as Genre on Genre.value_low = m.genre
{
  m.genre as Kuerzel,
  @EndUserText.label: 'Genre'
  Genre.text as Langweise
}
