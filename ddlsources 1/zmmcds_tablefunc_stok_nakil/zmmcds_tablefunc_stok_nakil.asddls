@EndUserText.label: 'Stok Nakil Süresi TF'
define table function ZMMCDS_TABLEFUNC_STOK_NAKIL
with parameters p_kabul : abap.char( 1 ),
                p_red : abap.char( 1 ),
                p_iptal : abap.char( 1 ),
                @Environment.systemField : #CLIENT
                p_clnt : abap.clnt
returns {
  mandt : mandt;
  mblnr : mblnr;
  mjahr : mjahr;
  zeile : mblpo;
  bwart : bwart;
  matnr : matnr;
  maktx : maktx;
  werks : werks_d;
  lgort : lgort_d;
  lgobe : lgobe;
  umlgo : umlgo;
  umlgot : lgobe;
  charg : charg_d;
  bwtar : bwtar_d;
  budat : budat;
  cpudt : cpudt;
  cputm : cputm;
  usnam : usnam;
  umlme : umlmd;
  menge : menge_d;
  meins : meins;
  hourc : zmmd_bekleme_saat;
  iptalt : zmmd_iptal_tarih;
  iptalc : zmmd_iptal_saat;
  kabul_doc : zmmd_kabul_doc;
  kabul_year : zmmd_kabul_year;
  kabul_pos : zmmd_kabul_pos;
  kabul_mik : menge_d;
  kabult : zmmd_kabul_tarih;
  kabulc : zmmd_kabul_saat;
  red_doc : zmmd_red_doc;
  red_year : zmmd_red_year;
  red_pos : zmmd_red_pos;
  red_mik : menge_d;
  redt : zmmd_red_tarih;
  redc : zmmd_red_saat;
}
implemented by method zmmcl_stok_nakli=>get_kabul_iptal_sure;