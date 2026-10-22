@AbapCatalog.sqlViewName: 'ZMK_DDL_SKILLS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Skills Interface View'
@Metadata.ignorePropagatedAnnotations: true
define view ZMKI_SKILLS as select from zmkdb_skills
 association to parent ZMKI_PROJECT as _proj on
      $projection.Emplid = _proj.Emplid and
        $projection.Projid = _proj.Projid
        
{
    key emplid as Emplid,
    key projid as Projid,
    key skillid as Skillid,
    skill_level as SkillLevel,
    is_primary as IsPrimary,
    is_certified as IsCertified,
    _proj
}
