@AbapCatalog.sqlViewName: 'ZMK_DDL_PROJECT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Project Interface View'
@Metadata.ignorePropagatedAnnotations: true
define view ZMKI_PROJECT as select from zmkdb_project
   association to parent ZMKI_EMPLOYEE as _empl on
      $projection.Emplid = _empl.Emplid
   composition [1..*] of ZMKI_SKILLS as _skills
{
    key emplid as Emplid,
    key projid as Projid,
    project_name as ProjectName,
    project_type as ProjectType,
        -- Project type text condition
    case project_type
        when 'IMP' then 'Implementation'
        when 'SUP' then 'Support'
        when 'NA'  then 'Bench'
        else 'Others'
    end as ProjectTypeText,
    -- Project Criticality status
    case project_type
        when 'IMP' then 3
        when 'SUP' then 2
        when 'NA'  then 1
        else 0
    end as ProjectCriticality, 
    is_current as IsCurrent,
    duration as Duration,
    _empl,
    _skills
  
}
