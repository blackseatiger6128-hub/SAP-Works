@AbapCatalog.sqlViewName: 'ZMK_DCRC_USER'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DC_RC: User Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
   serviceQuality: #X,
   sizeCategory: #S,
   dataClass: #MIXED
}
define root view zmki_dcrc_user 
   as select from zmkdb_dcrc_user
     composition [0..*] of zmki_dcrc_sht1 as _XLData1
     composition [0..*] of ZMKI_DCRC_SHT2 as _XLData2
     composition [0..*] of ZMKI_DCRC_SHT3 as _XLData3
{
   key end_user as EndUser,
   key file_id as FileId,
   file_status as FileStatus,
   attachment as Attachment,
   @Semantics.mimeType: true
   mimetype as Mimetype,
   filename as Filename,
   @Consumption.valueHelpDefinition: [
          { entity: { name: 'ZSD_DC_RC_TYPES', element: 'description' } }
   ]
   data_type as DataType,
   down_attachment as DownAttachment,
   down_mimetype as DownMimeType,
   down_filename as DownFilename,
   @Semantics.user.createdBy: true
   local_created_by as LocalCreatedBy,
   @Semantics.systemDateTime.createdAt: true
   local_created_at as LocalCreatedAt,
   @Semantics.user.lastChangedBy: true
   local_last_changed_by as LocalLastChangedBy,
   @Semantics.systemDateTime.lastChangedAt: true
   local_last_changed_at as LocalLastChangedAt,
   @Semantics.systemDateTime.lastChangedAt: true
   local_changed_at as LocalChangedAt,
   _XLData1,
   _XLData2,
   _XLData3
}
