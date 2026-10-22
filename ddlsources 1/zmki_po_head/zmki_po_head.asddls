@AbapCatalog.sqlViewName: 'ZMKI_PO1_HEAD'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order Interface Root view'
@Metadata.ignorePropagatedAnnotations: true
define root view ZMKI_PO_HEAD as select from zmkdb_po_head
//association [0..*] to ZI_PO_ITMS as _PO_items on $projection.PoNum = _PO_items.PoNum
composition [0..*] of ZMKI_PO_ITEMS as _PO_items
{
   key po_num as PoNum, 
   doc_cat as DocCat, 
   type as Type, 
   comp_code as CompCode,
   org as Org,
   status as Status, 
   vendor as Vendor, 
   plant as Plant, 
   create_by as CreateBy,
   created_date_time as CreatedDateTime, 
   changed_date_time as ChangedDateTime, 
   local_last_changed_by as LocalLastChangedBy,
   _PO_items // Make association public
}
