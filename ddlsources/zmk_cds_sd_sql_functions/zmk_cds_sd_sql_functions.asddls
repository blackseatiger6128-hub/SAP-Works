@AbapCatalog.sqlViewName: 'ZMK_SDSQLFC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SD SQL functions'
define view ZMK_CDS_SD_SQL_FUNCTIONS 
     as select from vbak
{
    vbak.vbeln          as Sales_Doc,
    //net price
    vbak.netwr          as Net_Price,
    //round of netprice to 1 decimal place
    //round(cast(vbak.netwr as abap.dec(15,2) ),1) as Round_Op, 
    //ceiling of net price
    //ceil(cast(vbak.netwr as abap.fltp(16))) as Ceil_Price,
    //floor of net price
    floor(cast(vbak.netwr as abap.dec(15,2))) as Floor_Price,
    //divide net price by 3
    div(vbak.netwr,3)   as Div_Op,
    //divide net price by 3 with result rounded to 5 places
    division(vbak.netwr,3,5) as Div_Op2,
    //remainder operation
    mod(10,3)           as Mod_Op,
    //fixed absolute value
    abs(-10)            as Abs_Op
}
