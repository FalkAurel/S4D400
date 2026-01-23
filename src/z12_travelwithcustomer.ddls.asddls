@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aufgabe CDS 03'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z12_TravelWithCustomer
  as select from    Z_12_CUSTOMER                     as c

    inner join      Z12_Travel                       as t
      on c.CustomerId = t.CustomerId

    left outer join DDCDS_CUSTOMER_DOMAIN_VALUE_T(
                      p_domain_name : '/DMO/STATUS') as st
      on  st.language  = $session.system_language
      and st.value_low = t.Status

{
  key t.TravelId,

      t.AgencyId,
      t.BeginDate,
      t.EndDate,
      dats_days_between(t.BeginDate, t.EndDate)                       as Duration,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => t.BookingFee,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date) as BookingFee,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      currency_conversion(amount             => t.TotalPrice,
                          source_currency    => t.CurrencyCode,
                          target_currency    => cast('EUR' as abap.cuky),
                          exchange_rate_date => $session.system_date) as TotalPrice,

      cast('EUR' as abap.cuky)                                        as CurrencyCode,
      t.Description,
      t.Status,
      st.text                                                         as StatusText,

      c.CustomerId,

      concat_with_space(
        concat_with_space(c.Title, c.FirstName, 1),
        c.LastName,
        1)                                                            as CustomerName,

      c.Street,
      c.PostalCode,
      c.City
}

where c.CountryCode = 'DE'
