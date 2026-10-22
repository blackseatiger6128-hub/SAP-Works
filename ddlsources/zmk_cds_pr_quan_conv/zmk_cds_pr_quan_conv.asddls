@AbapCatalog.sqlViewName: 'ZMK_PRQUANCON'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PR Quantity Conversions'
define view ZMK_CDS_PR_QUAN_CONV
    with parameters p_DispCurr : waers_curc
as select from eban
{
    key banfn,
    key bnfpo,
    @Semantics.amount.currencyCode: 'TransCurrency'
    preis,
    @Semantics.currencyCode: true 
    waers as TransCurrency,
    badat as ReqDate,
    
    @Semantics.amount.currencyCode: 'DisplayCurr'
    currency_conversion( amount=> preis,
                         source_currency => waers,
                         target_currency => :p_DispCurr,
                         exchange_rate_date => badat ) as DispAmount,
                         
    @Semantics.currencyCode: true
    :p_DispCurr as DisplayCurr   
}
