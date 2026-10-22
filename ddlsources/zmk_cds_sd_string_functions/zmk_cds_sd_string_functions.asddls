@AbapCatalog.sqlViewName: 'ZMK_SDSTRFC'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'SD String'
define view ZMK_CDS_SD_STRING_FUNCTIONS 
    as select from eban
{ 
    banfn                   as PR_Num,
    txz01                   as PR_Description,
    upper( txz01 )          as Text_Upper,
    left( txz01, 5 )        as Text_left,
    rpad( txz01, 8, 'y' )   as Text_rpad,
    substring( txz01, 2, 3) as Text_substring 
}
