@AbapCatalog.sqlViewName: 'ZMK_DDL_CONTACT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Contact Interface View'
@Metadata.ignorePropagatedAnnotations: true
define view ZMKI_CONTACT as select from zmkdb_contact
{
    key emplid as Emplid,
    phone_num as PhoneNum,
    alt_phone_num as AltPhoneNum,
    email_id as EmailId,
    alt_email_id as AltEmailId
}
