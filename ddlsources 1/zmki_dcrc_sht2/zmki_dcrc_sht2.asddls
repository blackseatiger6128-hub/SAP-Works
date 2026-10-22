@AbapCatalog.sqlViewName: 'ZMK_DCRC_SHT2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DC_RC: User Interface View Sheet2'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMKI_DCRC_SHT2 as select from zmkdb_dcrc_sht2
     association to parent zmki_dcrc_user as _XLUser
           on $projection.EndUser = _XLUser.EndUser
            and $projection.FileId = _XLUser.FileId
{
    key end_user    as EndUser,
    key file_id     as FileId,
    key line_id     as LineId,
    key line_no     as LineNumber,
    key external_ref_num as ExternalRefNum,
    order_key       as OrderKey,
    field_combination as FieldCombination,
    include_exclude as IncludeExclude,
    vendor_no_new as VendorNoNew,
    purch_org_new as PurchOrgNew,
    comp_code_new as CompCodeNew,
    plant_new  as PlantNew,
    matgrhier_new as MatgrhierNew,
    matl_type_now as MatlTypeNew,
    material_key  as MaterialKey,
    brand_id  as BrandId,
    matl_group_new  as MatlGroupNew,
    customer_new  as CustomerNew,
    cust_hier_new as CustHierNew,
    salesorg_new  as SalesOrgNew,
    distr_chan_new as DistrChanNew,
    cust_group_new as CustGroupNew,
    order_type as OrderType,
    ord_reason_new as OrdReasonNew,
    billing_type as BillingType,
    family as Family,
    sub_family as SubFamily,
    category as Category, 
    _XLUser
}
