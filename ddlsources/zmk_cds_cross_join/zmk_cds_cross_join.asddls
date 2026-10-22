@AbapCatalog.sqlViewName: 'ZMK_DDL_CROSS1'
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cross Join'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMK_CDS_CROSS_JOIN
as select from zmk_hr_empl as empl
cross join zmk_hr_ctc_comp as comp
{
    key empl.empl_id as EmplId,
    key comp.comp_id as CompId,
    comp.comp_perc as CompPerc,
    empl.fname as Fname,
    empl.lname as Lname,
    @Semantics.amount.currencyCode: 'CurrencyKey'
    empl.ctc_pa as CtcPa,
    empl.currency as CurrencyKey,
    // Calculate Component value
    division( cast(empl.ctc_pa as abap.dec( 10, 2 )), 100, 0 ) * comp.comp_perc as CompValue
}
