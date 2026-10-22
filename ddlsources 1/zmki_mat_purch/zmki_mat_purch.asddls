@AbapCatalog.sqlViewName: 'ZMKV_MAT_PURCH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Material View'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMKI_MAT_PURCH as select from eine // Purchasing org/plant data 
   inner join eina on eina.infnr = eine.infnr // Info record header 
     association [1..1] to lfa1 as _Supplier on _Supplier.lifnr = eina.lifnr 
{
    /* Keys */ 
    key eina.matnr as Material, 
    key eine.ekorg as PurchasingOrg, 
    key eine.werks as Plant, 
    key eina.lifnr as Vendor, 
    /* Readable name */ 
    _Supplier.name1 as VendorName, 
    /* Price + currency */ 
    @EndUserText.label: 'Currency' 
    eine.waers as Currency, 
    @EndUserText.label: 'Net Price' 
    @Semantics.amount.currencyCode: 'Currency' 
    eine.netpr as NetPrice, 
    @EndUserText.label: 'Price Unit' 
    eine.peinh as PriceUnit, 
    /* Units */
     @EndUserText.label: 'Order Unit' 
     eina.meins as OrderUnit, 
     @EndUserText.label: 'Order Price Unit' 
     eine.bprme as OrderPriceUnit
}
