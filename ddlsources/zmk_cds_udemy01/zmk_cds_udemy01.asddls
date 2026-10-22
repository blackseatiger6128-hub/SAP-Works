@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'annotations'
@AbapCatalog.buffering.status: #ACTIVE
@AbapCatalog.buffering.type: #SINGLE
define view ZMK_CDS_UDEMY01 as 
   select from sbook
{
    key carrid as airline_code,
    key connid as flight_number,
    key fldate as flight_date,
    key bookid as booking_number,
    customid as customer_number,
    @Semantics.amount.currencyCode: 'local_currency_key'
    loccuram as local_currency_amount,
    @Semantics.currencyCode: true
    loccurkey as local_currency_key 
}
