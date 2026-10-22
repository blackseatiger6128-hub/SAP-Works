@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'case expressions'
define view ZMK_CDS_UDEMY02 as 
  select from sbook
{
    carrid as airline_code,
    bookid as booking_number,
    customid as customer_number,
    custtype as customer_type,
    smoker as smoker,
    loccuram as booking_amount,
    case smoker 
      when 'X' then loccuram + 100
    else loccuram
    end as inc_smoker_charge_1,
    
    case
      when smoker = 'X' and custtype = 'B' then loccuram + 200
      when smoker = 'X' and custtype = 'P' then loccuram + 100
    else loccuram
    end as inc_smoker_charge_2,
    
    case smoker
       when ' ' then loccuram
       else 
          case 
             when custtype = 'B' then loccuram + 200
             when custtype = 'P' then loccuram + 100
             else loccuram
          end
    end as inc_smoker_charge_3 
}
