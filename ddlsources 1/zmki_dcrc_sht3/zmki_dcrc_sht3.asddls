@AbapCatalog.sqlViewName: 'ZMK_DCRC_SHT3'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DC_RC: User Interface View Sheet3'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view ZMKI_DCRC_SHT3 as select from zmkdb_dcrc_sht3
  association to parent zmki_dcrc_user as _XLUser
           on $projection.EndUser = _XLUser.EndUser
            and $projection.FileId = _XLUser.FileId
{
    key end_user    as EndUser,
    key file_id     as FileId,
    key line_id     as LineId,
    key line_no     as LineNumber,
    key external_ref_num as ExternalRefNum,
    kschl           as Kschl,
    cond_count      as CondCount,
    amount          as Amount,
    condcurr        as Condcurr,
    scalecurr       as ScaleCurr,
    scaleunit       as ScaleUnit,
    scalebasis      as ScaleBasis,
    _XLUser
}
