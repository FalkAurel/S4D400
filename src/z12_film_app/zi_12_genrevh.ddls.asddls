@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Genre Wertehilfe'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_12_GENREVH as select distinct from DDCDS_CUSTOMER_DOMAIN_VALUE_T( p_domain_name:'ZABAP_GENRE' )
{
   key value_low as Text
} where language = $session.system_language

