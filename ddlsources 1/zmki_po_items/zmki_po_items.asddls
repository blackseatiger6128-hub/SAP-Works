@AbapCatalog.sqlViewName: 'ZMKI_PO1_ITEMS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order Items Interface view'
@Metadata.ignorePropagatedAnnotations: true
define view ZMKI_PO_ITEMS as select from zmkdb_po_items
   association to parent ZMKI_PO_HEAD as _po_hd 
      on $projection.PoNum = _po_hd.PoNum
{
    key po_num as PoNum, 
    key po_item as PoItem, 
    item_text as ItemText, 
    material as Material, 
    plant as Plant, 
    stor_loc as StorLoc,
    @Semantics.quantity.unitOfMeasure: 'uom' 
    qty as Qty,
    uom as Uom, 
    @Semantics.amount.currencyCode: 'PriceUnit' 
    product_price as ProductPrice, 
    price_unit as PriceUnit, 
    local_last_changed_by as LocalLastChangedBy, 
    local_last_changed_at as LocalLastChangedAt,
    _po_hd
}
