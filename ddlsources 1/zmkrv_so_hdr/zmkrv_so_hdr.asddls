@AbapCatalog.sqlViewName: 'ZMKRVDLL_SO_HDR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales order header Root View'
@AbapCatalog.preserveKey: true
@Metadata.ignorePropagatedAnnotations: true
define root view ZMKRV_SO_HDR 
  as select from zmkdb_so_hdr as SalesHeader
  /*Association*/
    association [0..1]  to ZMKDD_PARTNER as _Partner 
            on $projection.partner = _Partner.Partner
    association [0..1]  to ZMKDD_STATUS as _Status 
            on $projection.status = _Status.Status
    association [0..1]  to ZMKDD_CURRENCY as _Currency
            on $projection.cuky = _Currency.PriceUnit
{
    
    key soid,
    sorder,
    partner,
    status,
    @Semantics.amount.currencyCode : 'cuky'
    price,
    cuky,
    @Semantics.user.createdBy: true
    created_by,
    @Semantics.systemDateTime.createdAt: true
    created_at,
    @Semantics.user.lastChangedBy: true
    last_changed_by,
    @Semantics.systemDateTime.lastChangedAt: true
    last_changed_at,
    /*Associations*/
    _Partner,
    _Status,
    _Currency
}
