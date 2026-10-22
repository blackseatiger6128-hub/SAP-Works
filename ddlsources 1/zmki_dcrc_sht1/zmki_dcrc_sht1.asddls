@AbapCatalog.sqlViewName: 'ZMK_DCRC_SHT1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DC_RC: User Interface View Sheet1'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view zmki_dcrc_sht1 
   as select from zmkdb_dcrc_sht1
     association to parent zmki_dcrc_user as _XLUser
           on $projection.EndUser = _XLUser.EndUser
            and $projection.FileId = _XLUser.FileId
{
    key end_user    as EndUser,
    key file_id     as FileId,
    key line_id     as LineId,
    key line_no     as LineNumber,
    key external_ref_num as ExternalRefNum,
    contract_type   as ContractType,
    cust_owner      as CustOwner,
    vend_owner      as VendOwner,
    date_from       as DateFrom,
    date_to         as DateTo,
    vkorg           as Vkorg,
    vtweg           as Vtweg,
    spart           as Spart,
    ekorg           as Ekorg,
    ekgrp           as Ekgrp,
    bukrs           as Bukrs,
    settlement_date  as SettlementDate,
    status          as Status,
    status_desc     as StatusDesc,
    _XLUser
}
