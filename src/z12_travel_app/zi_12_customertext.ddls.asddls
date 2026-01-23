@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Returns the name for a customer ID'
define view entity ZI_12_CustomerText as select from /dmo/customer
{
  key customer_id as CustomerId,
  case
   when title is initial then concat_with_space(first_name, last_name, 1)
      else concat_with_space(title, concat_with_space(first_name, last_name, 1), 1) end as CustomerName
}
