@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY07'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Input parameters'
define view ZMK_CDS_UDEMY07
    with parameters smoker_factor : abap.curr(15,2),
                    non_smoker_factor : s_l_cur_pr,
                    @Environment.systemField: #SYSTEM_DATE
                    fldat: abap.dats
 as select from sbook
{
   carrid as airline,
   loccuram as amount,
   smoker,
   case smoker
     when 'X'
       then loccuram * $parameters.smoker_factor
     else loccuram * :non_smoker_factor
   end as adjusted_amount,
   fldate
}
where fldate between '20180615' and :fldat
