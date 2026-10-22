@AbapCatalog.sqlViewName: 'ZMK_SQL_SCUSTOM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'flight customer'
@VDM.viewType: #BASIC
define view ZMK_CDS_SCUSTOM as select from scustom
{
      key id   as FlightCustomer,
      name as CustomerName,
      city as CustomerCity
}
