@AbapCatalog.sqlViewName: 'ZMK_SQL_UDEMY06'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'unions'
define view ZMK_CDS_UDEMY06 as select from sbook
{
   customid 
}
where customid = '00000044'
union
select from scustom
{
   id as customid
}
where id = '00000044'
