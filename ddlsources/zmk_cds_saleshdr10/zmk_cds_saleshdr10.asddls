@AbapCatalog.sqlViewName: 'ZMKDDL_SLSHDR10'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'cds view for saleshdr10'
@AbapCatalog.preserveKey: true
@Metadata.ignorePropagatedAnnotations: true
define root view ZMK_CDS_SALESHDR10 as select from zmk_saleshdr10
 composition [0..*] of ZMK_CDS_SALESITM10 as _SalesItm
{
    key salesorderuuid as Salesorderuuid,
    salesorder as Salesorder,
    salesordertype as Salesordertype,
    description as Description,
    salesorganization as Salesorganization,
    soldtoparty as Soldtoparty,
    distributionchannel as Distributionchannel,
    documentreason as Documentreason,
    @Semantics.amount.currencyCode: 'Transactioncurrency'
    totalnetamount as Totalnetamount,
    transactioncurrency as Transactioncurrency,
    status as Status,
    @Semantics.user.createdBy: true
    createdbyuser as Createdbyuser,
    @Semantics.systemDateTime.createdAt: true
    creationat as Creationat,
    @Semantics.user.lastChangedBy: true
    lastchangedbyuser as Lastchangedbyuser,
    @Semantics.systemDateTime.lastChangedAt: true
    lastchangedat as Lastchangedat,
    locallastchangedat as Locallastchangedat,
    _SalesItm // Make association public
}
