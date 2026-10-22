@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY04'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'aggregation expression'
define view ZMK_CDS_UDEMY04 as 
select from sbook
{
    carrid as airline_code,
    count(*) as number_of_records,
    count(distinct loccuram) as distinct_records,
    min(loccuram) as min_booking_amount,
    max(loccuram) as max_booking_amount,
    avg(loccuram) as avg_booking_amount,
    sum(loccuram) as sum_booking_amount
}
group by
    carrid
    
having carrid = 'AA'
