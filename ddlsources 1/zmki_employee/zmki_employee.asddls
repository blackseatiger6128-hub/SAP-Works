@AbapCatalog.sqlViewName: 'ZMK_DDL_EMPLOYEE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Basic Interface View'
@Metadata.ignorePropagatedAnnotations: true
define root view ZMKI_EMPLOYEE as select from zmkdb_employee
  association [1..1] to ZMKI_CONTACT as _cont 
    on $projection.Emplid = _cont.Emplid
  association [1..1] to ZMKI_ADDRESS as _addr
    on $projection.Emplid = _addr.Emplid
  composition[0..*] of ZMKI_PROJECT as _proj
{
 key emplid as Emplid,
 fname as Fname,
 lname as Lname,
 gender as Gender,
 designation as Designation,
 concat_with_space(fname,lname,1) as Fullname,
 _cont,
 _addr,
 _proj
}
