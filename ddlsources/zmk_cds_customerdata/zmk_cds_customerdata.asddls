@AbapCatalog.sqlViewName: 'ZMK_CUSTAD01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CustomerData'
define view ZMK_CDS_CUSTOMERDATA as select from but000
association [0..1] to I_BPCurrentDefaultAddress as _CurrentDefaultAddress
    on $projection.BusinessPartner = _CurrentDefaultAddress.BusinessPartner
{
    but000.partner    as BusinessPartner,
    but000.persnumber as PersonNumber,
    _CurrentDefaultAddress.AddressID as AddressID,
    _CurrentDefaultAddress // Make association public
}
