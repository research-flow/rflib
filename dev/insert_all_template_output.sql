-- Generated on 2025-08-14 12:44:42 from mock_lista.xlsx (sheet: 1); total rows: 429
--
begin
   execute immediate 'DROP TABLE '
                     || 'EMPLOYEES'
                     || ' PURGE';
exception
   when others then
      if sqlcode != -942 then
         raise;
      end if;
end;
/
--
create table EMPLOYEES (
   PROTOKOLL_KOD NUMBER,
   PROTOKOLL_MEGNEVEZES VARCHAR2(75),
   HBCS_KOD VARCHAR2(10),
   HBCS_MEGNEVEZES VARCHAR2(40),
   BNO_KOD VARCHAR2(10),
   BNO_MEGNEVEZES VARCHAR2(75)
)
nologging;
--
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7019, 'Kemoterápia, capecitabine monoterápia protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7022, 'Kemoterápia, 5FU protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7023, 'Kemoterápia, 5FU+FOLINAC hetenkénti nagy dózisú protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7030, 'Kemoterápia, EEP protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7031, 'Kemoterápia, ELF protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7033, 'Kemoterápia, FAM protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7034, 'Kemoterápia, FAMB protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7035, 'Kemoterápia, FAMTX protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7037, 'Kemoterápia, FEM/B protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7044, 'Kemoterápia, MAYO protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7045, 'Kemoterápia, DeGramont protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7046, 'Kemoterápia, irinotecan-DeGramont protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7047, 'Kemoterápia, irinotecan/A protokoll szerint', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7049, 'Kemoterápia, raltitrexed/A protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7063, 'Kemoterápia, 5FU+FOLINAC protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7064, 'Kemoterápia, raltitrexed/B protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7207, 'Kemoterápia, módosított FAM protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7268, 'Kemoterápia, Bevacizumab+FOLFIRI protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7270, 'Kemoterápia, Bevacizumab+DeGramont protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7271, 'Kemoterápia, Cetuximab+FOLFIRI (telítő) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7272, 'Kemoterápia, Cetuximab+FOLFIRI (fenntartó) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7273, 'Kemoterápia, Cetuximab monoterápia protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7275, 'Kemoterápia, FOLFOX-4 protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7448, 'Kemoterápia, Cetuximab(2w)+FOLFOX-4 protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7449, 'Kemoterápia, Cetuximab(2w)+FOLFIRI protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7450, 'Kemoterápia, panitumumab protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7488, 'Kemoterápia, CETUX+FOLFOX-6 (telítő) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7489, 'Kemoterápia, CETUX+FOLFOX-6 (fenntartó) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7495, 'Kemoterápia, PAN+FOLFOX-4 protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7496, 'Kemoterápia, PAN+FOLFIRI protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7514, 'Kemoterápia, bevacizumab+capecitabine protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7515, 'Kemoterápia, bevacizumab+FOLFOX4 protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7517, 'Kemoterápia, bevacizumab+XELOX protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7518, 'Kemoterápia, bevacizumab+XELIRI protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7528, 'Kemoterápia, XELOX protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7529, 'Kemoterápia, XELIRI protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7542, 'Kemoterápia, Bevacizumab+FOLFIRI/B protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7543, 'Kemoterápia, Bevacizumab+DeGramont/B protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7544, 'Kemoterápia, Bevacizumab+FOLFOX4/B protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7574, 'Kemoterápia, nagydózisú CIFU (5FU) protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7578, 'Kemoterápia, irinothecan 2 hetenkénti protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7579, 'Kemoterápia, MMC+nagydózisú 5FU protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7586, 'Kemoterápia, irinothecan 3 hetenkénti protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7702, 'Kemoterápia, EEP+dexrazoxane protokoll szerint', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7725, 'Kemoterápia, FEM/C+dexrazoxane protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7731, 'Kemoterápia, FEM/B+dexrazoxane protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7924, 'Kemoterápia, 5FU heti nagydózisú protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7926, 'Kemoterápia, FEM/A protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7927, 'Kemoterápia, 5FU+FOLINAC hetenkénti kis dózisú protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7928, 'Kemoterápia, FEM/C protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C18', 'A vastagbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7019, 'Kemoterápia, capecitabine monoterápia protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7022, 'Kemoterápia, 5FU protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7023, 'Kemoterápia, 5FU+FOLINAC hetenkénti nagy dózisú protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7030, 'Kemoterápia, EEP protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7031, 'Kemoterápia, ELF protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7033, 'Kemoterápia, FAM protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7034, 'Kemoterápia, FAMB protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7035, 'Kemoterápia, FAMTX protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7037, 'Kemoterápia, FEM/B protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7044, 'Kemoterápia, MAYO protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7045, 'Kemoterápia, DeGramont protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7046, 'Kemoterápia, irinotecan-DeGramont protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7047, 'Kemoterápia, irinotecan/A protokoll szerint', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7049, 'Kemoterápia, raltitrexed/A protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7063, 'Kemoterápia, 5FU+FOLINAC protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7064, 'Kemoterápia, raltitrexed/B protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7207, 'Kemoterápia, módosított FAM protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7268, 'Kemoterápia, Bevacizumab+FOLFIRI protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7270, 'Kemoterápia, Bevacizumab+DeGramont protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7271, 'Kemoterápia, Cetuximab+FOLFIRI (telítő) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7272, 'Kemoterápia, Cetuximab+FOLFIRI (fenntartó) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7273, 'Kemoterápia, Cetuximab monoterápia protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7275, 'Kemoterápia, FOLFOX-4 protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7448, 'Kemoterápia, Cetuximab(2w)+FOLFOX-4 protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7449, 'Kemoterápia, Cetuximab(2w)+FOLFIRI protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7450, 'Kemoterápia, panitumumab protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7488, 'Kemoterápia, CETUX+FOLFOX-6 (telítő) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7489, 'Kemoterápia, CETUX+FOLFOX-6 (fenntartó) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7495, 'Kemoterápia, PAN+FOLFOX-4 protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7496, 'Kemoterápia, PAN+FOLFIRI protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7514, 'Kemoterápia, bevacizumab+capecitabine protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7515, 'Kemoterápia, bevacizumab+FOLFOX4 protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7517, 'Kemoterápia, bevacizumab+XELOX protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7518, 'Kemoterápia, bevacizumab+XELIRI protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7528, 'Kemoterápia, XELOX protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7529, 'Kemoterápia, XELIRI protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7542, 'Kemoterápia, Bevacizumab+FOLFIRI/B protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7543, 'Kemoterápia, Bevacizumab+DeGramont/B protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7544, 'Kemoterápia, Bevacizumab+FOLFOX4/B protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7574, 'Kemoterápia, nagydózisú CIFU (5FU) protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7578, 'Kemoterápia, irinothecan 2 hetenkénti protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7579, 'Kemoterápia, MMC+nagydózisú 5FU protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7586, 'Kemoterápia, irinothecan 3 hetenkénti protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7702, 'Kemoterápia, EEP+dexrazoxane protokoll szerint', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7725, 'Kemoterápia, FEM/C+dexrazoxane protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7731, 'Kemoterápia, FEM/B+dexrazoxane protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7924, 'Kemoterápia, 5FU heti nagydózisú protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7926, 'Kemoterápia, FEM/A protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7927, 'Kemoterápia, 5FU+FOLINAC hetenkénti kis dózisú protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7928, 'Kemoterápia, FEM/C protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C19', 'A szigmabél-végbél határ rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7019, 'Kemoterápia, capecitabine monoterápia protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7022, 'Kemoterápia, 5FU protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7023, 'Kemoterápia, 5FU+FOLINAC hetenkénti nagy dózisú protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7030, 'Kemoterápia, EEP protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7031, 'Kemoterápia, ELF protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7033, 'Kemoterápia, FAM protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7034, 'Kemoterápia, FAMB protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7035, 'Kemoterápia, FAMTX protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7037, 'Kemoterápia, FEM/B protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7044, 'Kemoterápia, MAYO protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7045, 'Kemoterápia, DeGramont protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7046, 'Kemoterápia, irinotecan-DeGramont protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7047, 'Kemoterápia, irinotecan/A protokoll szerint', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7049, 'Kemoterápia, raltitrexed/A protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7063, 'Kemoterápia, 5FU+FOLINAC protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7064, 'Kemoterápia, raltitrexed/B protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7207, 'Kemoterápia, módosított FAM protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7268, 'Kemoterápia, Bevacizumab+FOLFIRI protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7270, 'Kemoterápia, Bevacizumab+DeGramont protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7271, 'Kemoterápia, Cetuximab+FOLFIRI (telítő) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7272, 'Kemoterápia, Cetuximab+FOLFIRI (fenntartó) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7273, 'Kemoterápia, Cetuximab monoterápia protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7275, 'Kemoterápia, FOLFOX-4 protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7408, 'Radiokemoterápia, végbélrák esetén TEG-FOLINAC protokoll szerint', '9512', 'Radiokemoterápia &quot;B&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7410, 'Radiokemoterápia, végbélrák esetén 5FU protokoll szerint', '9511', 'Radiokemoterápia &quot;A&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7448, 'Kemoterápia, Cetuximab(2w)+FOLFOX-4 protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7449, 'Kemoterápia, Cetuximab(2w)+FOLFIRI protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7450, 'Kemoterápia, panitumumab protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7488, 'Kemoterápia, CETUX+FOLFOX-6 (telítő) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7489, 'Kemoterápia, CETUX+FOLFOX-6 (fenntartó) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7495, 'Kemoterápia, PAN+FOLFOX-4 protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7496, 'Kemoterápia, PAN+FOLFIRI protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7514, 'Kemoterápia, bevacizumab+capecitabine protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7515, 'Kemoterápia, bevacizumab+FOLFOX4 protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7517, 'Kemoterápia, bevacizumab+XELOX protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7518, 'Kemoterápia, bevacizumab+XELIRI protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7528, 'Kemoterápia, XELOX protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7529, 'Kemoterápia, XELIRI protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7542, 'Kemoterápia, Bevacizumab+FOLFIRI/B protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7543, 'Kemoterápia, Bevacizumab+DeGramont/B protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7544, 'Kemoterápia, Bevacizumab+FOLFOX4/B protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7574, 'Kemoterápia, nagydózisú CIFU (5FU) protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7575, 'Radiokemoterápia, nagydózisú CIFU (5FU) protokoll szerint', '9511', 'Radiokemoterápia &quot;A&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7578, 'Kemoterápia, irinothecan 2 hetenkénti protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7579, 'Kemoterápia, MMC+nagydózisú 5FU protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7586, 'Kemoterápia, irinothecan 3 hetenkénti protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7702, 'Kemoterápia, EEP+dexrazoxane protokoll szerint', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7725, 'Kemoterápia, FEM/C+dexrazoxane protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7731, 'Kemoterápia, FEM/B+dexrazoxane protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7924, 'Kemoterápia, 5FU heti nagydózisú protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7926, 'Kemoterápia, FEM/A protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7927, 'Kemoterápia, 5FU+FOLINAC hetenkénti kis dózisú protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7928, 'Kemoterápia, FEM/C protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C20', 'A végbél rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7000, 'Kemoterápia, OSA protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7001, 'Kemoterápia, OSM protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7002, 'Kemoterápia, OSIP protokoll szerint 18 év alatt', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7003, 'Kemoterápia, OSCE protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7092, 'Kemoterápia, CBP+VP protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7097, 'Kemoterápia, PE protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7101, 'Kemoterápia, ADOC protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7142, 'Kemoterápia, FAM/D protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7178, 'Kemoterápia, ATEZO monoterápia protokoll szerint (3w)', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7196, 'Kemoterápia, VNB/A protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7200, 'Kemoterápia, BOLD/A protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7201, 'Kemoterápia, BOLD/B protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7202, 'Kemoterápia, DTIC+CDDP+BCNU+TAMO protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7203, 'Kemoterápia, NIVO monoterápia protokoll szerint (2w)', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7204, 'Kemoterápia, PMB monoterápia protokoll szerint (3w)', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7205, 'Kemoterápia, CDDP+DTIC protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7206, 'Kemoterápia, CDDP+DTIC/B protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7217, 'Kemoterápia, Ewing-VIDE protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7219, 'Kemoterápia, FOSA protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7220, 'Kemoterápia, FOSM protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7221, 'Kemoterápia, FOSIP protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7222, 'Kemoterápia, FOSCE protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7268, 'Kemoterápia, Bevacizumab+FOLFIRI protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7270, 'Kemoterápia, Bevacizumab+DeGramont protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7271, 'Kemoterápia, Cetuximab+FOLFIRI (telítő) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7272, 'Kemoterápia, Cetuximab+FOLFIRI (fenntartó) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7273, 'Kemoterápia, Cetuximab monoterápia protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7275, 'Kemoterápia, FOLFOX-4 protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7280, 'Kemoterápia, VIDE protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7289, 'Kemoterápia, NBL-Infant-CO protokoll szerint 1,5 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7290, 'Kemoterápia, NBL-Infant-VPCarbo protokoll szerint 1,5 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7291, 'Kemoterápia, NBL-Infant-CADO protokoll szerint 1,5 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7292, 'Kemoterápia, NBL-VP-Carbo protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7293, 'Kemoterápia, NBL-CADO protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7294, 'Kemoterápia, NBL-Course-A protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7295, 'Kemoterápia, NBL-Course-B protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7296, 'Kemoterápia, RapidCOJEC &quot;C&quot; blokk protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7314, 'Kemoterápia, VeIP protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7315, 'Kemoterápia, VeIP/A protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7318, 'Kemoterápia, INF-alfa+IL2+5FU protokoll szerint', '959J', 'Rosszindulatú daganat kemoterápiája &quot;J&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7325, 'Kemoterápia, CBP+BCNU protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7326, 'Kemoterápia, PBD/B protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7327, 'Kemoterápia, CDDP+EPI protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7328, 'Kemoterápia, CDDP+EPI+BLM protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7449, 'Kemoterápia, Cetuximab(2w)+FOLFIRI protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7450, 'Kemoterápia, panitumumab protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7480, 'Kemoterápia, nabTAX+GEM (pancreas) protokoll szerint', '959J', 'Rosszindulatú daganat kemoterápiája &quot;J&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7488, 'Kemoterápia, CETUX+FOLFOX-6 (telítő) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7489, 'Kemoterápia, CETUX+FOLFOX-6 (fenntartó) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7495, 'Kemoterápia, PAN+FOLFOX-4 protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7496, 'Kemoterápia, PAN+FOLFIRI protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7514, 'Kemoterápia, bevacizumab+capecitabine protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7515, 'Kemoterápia, bevacizumab+FOLFOX4 protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7517, 'Kemoterápia, bevacizumab+XELOX protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7518, 'Kemoterápia, bevacizumab+XELIRI protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7542, 'Kemoterápia, Bevacizumab+FOLFIRI/B protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7543, 'Kemoterápia, Bevacizumab+DeGramont/B protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7544, 'Kemoterápia, Bevacizumab+FOLFOX4/B protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7706, 'Kemoterápia, FOSA+dexrazoxane protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7719, 'Kemoterápia, VIDE+dexrazoxane protokoll szerint 18 év alatt', '959I', 'Rosszindulatú daganat kemoterápiája &quot;I&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7726, 'Kemoterápia, EWVIDE3+dexrazoxane protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7727, 'Kemoterápia, SIVD2+dexrazoxane protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7728, 'Kemoterápia, SCErV+dexrazoxane protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7729, 'Kemoterápia, WTVAER+dexrazoxane protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7730, 'Kemoterápia, HPLADO+dexrazoxane protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7738, 'Kemoterápia, NBL-CADO+dexrazoxane protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7740, 'Kemoterápia, OSA+dexrazoxane protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7741, 'Kemoterápia, NBL-Infant-CADO+dexrazoxane protokoll szerint 1,5 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7742, 'Kemoterápia, EWIVD2+dexrazoxane protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7743, 'Kemoterápia, EWCERV+dexrazoxane protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7744, 'Kemoterápia, WTVER+dexrazoxane protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7745, 'Kemoterápia, HIPA+dexrazoxane protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7746, 'Kemoterápia, HCARD+dexrazoxane protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7749, 'Kemoterápia, NCADO+dexrazoxane protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7750, 'Kemoterápia, N4+dexrazoxane protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7751, 'Kemoterápia, N6+dexrazoxane protokoll szerint 18 év alatt', '959I', 'Rosszindulatú daganat kemoterápiája &quot;I&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7900, 'Kemoterápia, DTIC/I monoterápia protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7901, 'Kemoterápia, DTIC/II monoterápia protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7910, 'Kemoterápia, fotemustin monoterápia protokoll szerint, indukciós szakasz', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7911, 'Kemoterápia, fotemustin monoterápia protokoll szerint, fenntartó szakasz', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7914, 'Kemoterápia, CDDP/A protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7916, 'Kemoterápia, PBD protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7917, 'Kemoterápia, CBP lökéskezelés protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7918, 'Kemoterápia, DTIC+BCNU protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7937, 'Kemoterápia, EWEVAI protokoll szerint 18 év alatt', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7938, 'Kemoterápia, EWVIDE3 protokoll szerint 18 év alatt', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7939, 'Kemoterápia, EWV protokoll szerint 18 év alatt', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7940, 'Kemoterápia, EWVAI2 protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7941, 'Kemoterápia, EWIVD2 protokoll szerint 18 év alatt', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7942, 'Kemoterápia, EWVAI3 protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7943, 'Kemoterápia, EWCERV protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7944, 'Kemoterápia, EWIVE protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7945, 'Kemoterápia, EWVAI22 protokoll szerint 18 év alatt', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7946, 'Kemoterápia, EWVAC protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7947, 'Kemoterápia, EWVIDE33 protokoll szerint 18 év alatt', '959K', 'Rosszindulatú daganat kemoterápiája &quot;K&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7948, 'Kemoterápia, SV protokoll szerint 18 év alatt', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7949, 'Kemoterápia, SVA protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7951, 'Kemoterápia, SIVD2 protokoll szerint 18 év alatt', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7952, 'Kemoterápia, SIVA3 protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7953, 'Kemoterápia, SCErV protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7954, 'Kemoterápia, SI3VE protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7955, 'Kemoterápia, SICARE5 protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7956, 'Kemoterápia, WV protokoll szerint 18 év alatt', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7957, 'Kemoterápia, WVAct protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7958, 'Kemoterápia, WTVA5 protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7960, 'Kemoterápia, WTVER protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7961, 'Kemoterápia, WTVAER protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7974, 'Kemoterápia, GBEP5 protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7975, 'Kemoterápia, HPLADO protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7976, 'Kemoterápia, HCARE protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7977, 'Kemoterápia, HIPA protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7978, 'Kemoterápia, HCARD protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7979, 'Kemoterápia, HP protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7987, 'Kemoterápia, NOPEC protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7988, 'Kemoterápia, NOJEC protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7989, 'Kemoterápia, NCADO protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7990, 'Kemoterápia, NCE protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7991, 'Kemoterápia, NVCE protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7992, 'Kemoterápia, NVC protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7993, 'Kemoterápia, NVECY protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7994, 'Kemoterápia, N4 protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7995, 'Kemoterápia, N5 protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7996, 'Kemoterápia, N6 protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7997, 'Kemoterápia, N7 protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C78', 'A légzőszervek és emésztőszervek másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7000, 'Kemoterápia, OSA protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7001, 'Kemoterápia, OSM protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7002, 'Kemoterápia, OSIP protokoll szerint 18 év alatt', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7003, 'Kemoterápia, OSCE protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7101, 'Kemoterápia, ADOC protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7178, 'Kemoterápia, ATEZO monoterápia protokoll szerint (3w)', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7196, 'Kemoterápia, VNB/A protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7200, 'Kemoterápia, BOLD/A protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7201, 'Kemoterápia, BOLD/B protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7202, 'Kemoterápia, DTIC+CDDP+BCNU+TAMO protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7203, 'Kemoterápia, NIVO monoterápia protokoll szerint (2w)', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7204, 'Kemoterápia, PMB monoterápia protokoll szerint (3w)', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7205, 'Kemoterápia, CDDP+DTIC protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7206, 'Kemoterápia, CDDP+DTIC/B protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7217, 'Kemoterápia, Ewing-VIDE protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7219, 'Kemoterápia, FOSA protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7220, 'Kemoterápia, FOSM protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7221, 'Kemoterápia, FOSIP protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7222, 'Kemoterápia, FOSCE protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7268, 'Kemoterápia, Bevacizumab+FOLFIRI protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7270, 'Kemoterápia, Bevacizumab+DeGramont protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7271, 'Kemoterápia, Cetuximab+FOLFIRI (telítő) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7272, 'Kemoterápia, Cetuximab+FOLFIRI (fenntartó) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7273, 'Kemoterápia, Cetuximab monoterápia protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7275, 'Kemoterápia, FOLFOX-4 protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7280, 'Kemoterápia, VIDE protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7289, 'Kemoterápia, NBL-Infant-CO protokoll szerint 1,5 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7290, 'Kemoterápia, NBL-Infant-VPCarbo protokoll szerint 1,5 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7291, 'Kemoterápia, NBL-Infant-CADO protokoll szerint 1,5 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7292, 'Kemoterápia, NBL-VP-Carbo protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7293, 'Kemoterápia, NBL-CADO protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7294, 'Kemoterápia, NBL-Course-A protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7295, 'Kemoterápia, NBL-Course-B protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7296, 'Kemoterápia, RapidCOJEC &quot;C&quot; blokk protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7318, 'Kemoterápia, INF-alfa+IL2+5FU protokoll szerint', '959J', 'Rosszindulatú daganat kemoterápiája &quot;J&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7325, 'Kemoterápia, CBP+BCNU protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7326, 'Kemoterápia, PBD/B protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7327, 'Kemoterápia, CDDP+EPI protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7328, 'Kemoterápia, CDDP+EPI+BLM protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7449, 'Kemoterápia, Cetuximab(2w)+FOLFIRI protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7450, 'Kemoterápia, panitumumab protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7480, 'Kemoterápia, nabTAX+GEM (pancreas) protokoll szerint', '959J', 'Rosszindulatú daganat kemoterápiája &quot;J&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7488, 'Kemoterápia, CETUX+FOLFOX-6 (telítő) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7489, 'Kemoterápia, CETUX+FOLFOX-6 (fenntartó) protokoll szerint', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7495, 'Kemoterápia, PAN+FOLFOX-4 protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7496, 'Kemoterápia, PAN+FOLFIRI protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7514, 'Kemoterápia, bevacizumab+capecitabine protokoll szerint', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7515, 'Kemoterápia, bevacizumab+FOLFOX4 protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7517, 'Kemoterápia, bevacizumab+XELOX protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7518, 'Kemoterápia, bevacizumab+XELIRI protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7542, 'Kemoterápia, Bevacizumab+FOLFIRI/B protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7543, 'Kemoterápia, Bevacizumab+DeGramont/B protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7544, 'Kemoterápia, Bevacizumab+FOLFOX4/B protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7706, 'Kemoterápia, FOSA+dexrazoxane protokoll szerint', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7719, 'Kemoterápia, VIDE+dexrazoxane protokoll szerint 18 év alatt', '959I', 'Rosszindulatú daganat kemoterápiája &quot;I&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7726, 'Kemoterápia, EWVIDE3+dexrazoxane protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7727, 'Kemoterápia, SIVD2+dexrazoxane protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7728, 'Kemoterápia, SCErV+dexrazoxane protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7729, 'Kemoterápia, WTVAER+dexrazoxane protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7738, 'Kemoterápia, NBL-CADO+dexrazoxane protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7740, 'Kemoterápia, OSA+dexrazoxane protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7741, 'Kemoterápia, NBL-Infant-CADO+dexrazoxane protokoll szerint 1,5 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7742, 'Kemoterápia, EWIVD2+dexrazoxane protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7743, 'Kemoterápia, EWCERV+dexrazoxane protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7744, 'Kemoterápia, WTVER+dexrazoxane protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7747, 'Kemoterápia, RVDC40+dexrazoxane protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7748, 'Kemoterápia, RVDC20+dexrazoxane protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7749, 'Kemoterápia, NCADO+dexrazoxane protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7750, 'Kemoterápia, N4+dexrazoxane protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7751, 'Kemoterápia, N6+dexrazoxane protokoll szerint 18 év alatt', '959I', 'Rosszindulatú daganat kemoterápiája &quot;I&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7900, 'Kemoterápia, DTIC/I monoterápia protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7901, 'Kemoterápia, DTIC/II monoterápia protokoll szerint', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7910, 'Kemoterápia, fotemustin monoterápia protokoll szerint, indukciós szakasz', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7911, 'Kemoterápia, fotemustin monoterápia protokoll szerint, fenntartó szakasz', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7914, 'Kemoterápia, CDDP/A protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7916, 'Kemoterápia, PBD protokoll szerint', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7917, 'Kemoterápia, CBP lökéskezelés protokoll szerint', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7918, 'Kemoterápia, DTIC+BCNU protokoll szerint', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7937, 'Kemoterápia, EWEVAI protokoll szerint 18 év alatt', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7938, 'Kemoterápia, EWVIDE3 protokoll szerint 18 év alatt', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7939, 'Kemoterápia, EWV protokoll szerint 18 év alatt', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7940, 'Kemoterápia, EWVAI2 protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7941, 'Kemoterápia, EWIVD2 protokoll szerint 18 év alatt', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7942, 'Kemoterápia, EWVAI3 protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7943, 'Kemoterápia, EWCERV protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7944, 'Kemoterápia, EWIVE protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7945, 'Kemoterápia, EWVAI22 protokoll szerint 18 év alatt', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7946, 'Kemoterápia, EWVAC protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7947, 'Kemoterápia, EWVIDE33 protokoll szerint 18 év alatt', '959K', 'Rosszindulatú daganat kemoterápiája &quot;K&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7948, 'Kemoterápia, SV protokoll szerint 18 év alatt', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7949, 'Kemoterápia, SVA protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7951, 'Kemoterápia, SIVD2 protokoll szerint 18 év alatt', '959F', 'Rosszindulatú daganat kemoterápiája &quot;F&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7952, 'Kemoterápia, SIVA3 protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7953, 'Kemoterápia, SCErV protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7954, 'Kemoterápia, SI3VE protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7955, 'Kemoterápia, SICARE5 protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7956, 'Kemoterápia, WV protokoll szerint 18 év alatt', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7957, 'Kemoterápia, WVAct protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7958, 'Kemoterápia, WTVA5 protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7960, 'Kemoterápia, WTVER protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7961, 'Kemoterápia, WTVAER protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7966, 'Kemoterápia, GCT-PE protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7967, 'Kemoterápia, GPEI protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7970, 'Kemoterápia, MAHO-PVB protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7971, 'Kemoterápia, GVAC protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7972, 'Kemoterápia, GBEP protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7973, 'Kemoterápia, GCAREB protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7974, 'Kemoterápia, GBEP5 protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7980, 'Kemoterápia, ROPEC protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7981, 'Kemoterápia, RVDC40 protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7982, 'Kemoterápia, RPE protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7983, 'Kemoterápia, RVDC20 protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7984, 'Kemoterápia, RVC protokoll szerint 18 év alatt', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7985, 'Kemoterápia, RMAT protokoll szerint 18 év alatt', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7986, 'Kemoterápia, RCAREV protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7987, 'Kemoterápia, NOPEC protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7988, 'Kemoterápia, NOJEC protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7989, 'Kemoterápia, NCADO protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7990, 'Kemoterápia, NCE protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7991, 'Kemoterápia, NVCE protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7992, 'Kemoterápia, NVC protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7993, 'Kemoterápia, NVECY protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7994, 'Kemoterápia, N4 protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7995, 'Kemoterápia, N5 protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7996, 'Kemoterápia, N6 protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7997, 'Kemoterápia, N7 protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7961, 'Kemoterápia, WTVAER protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7966, 'Kemoterápia, GCT-PE protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7967, 'Kemoterápia, GPEI protokoll szerint 18 év alatt', '959G', 'Rosszindulatú daganat kemoterápiája &quot;G&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7970, 'Kemoterápia, MAHO-PVB protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7971, 'Kemoterápia, GVAC protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7972, 'Kemoterápia, GBEP protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7973, 'Kemoterápia, GCAREB protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7974, 'Kemoterápia, GBEP5 protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7980, 'Kemoterápia, ROPEC protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7981, 'Kemoterápia, RVDC40 protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7982, 'Kemoterápia, RPE protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7983, 'Kemoterápia, RVDC20 protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7984, 'Kemoterápia, RVC protokoll szerint 18 év alatt', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7985, 'Kemoterápia, RMAT protokoll szerint 18 év alatt', '959A', 'Rosszindulatú daganat kemoterápiája &quot;A&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7986, 'Kemoterápia, RCAREV protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7987, 'Kemoterápia, NOPEC protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7988, 'Kemoterápia, NOJEC protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7989, 'Kemoterápia, NCADO protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7990, 'Kemoterápia, NCE protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7991, 'Kemoterápia, NVCE protokoll szerint 18 év alatt', '959D', 'Rosszindulatú daganat kemoterápiája &quot;D&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7992, 'Kemoterápia, NVC protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7993, 'Kemoterápia, NVECY protokoll szerint 18 év alatt', '959B', 'Rosszindulatú daganat kemoterápiája &quot;B&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7994, 'Kemoterápia, N4 protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7995, 'Kemoterápia, N5 protokoll szerint 18 év alatt', '959C', 'Rosszindulatú daganat kemoterápiája &quot;C&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7996, 'Kemoterápia, N6 protokoll szerint 18 év alatt', '959H', 'Rosszindulatú daganat kemoterápiája &quot;H&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
insert into EMPLOYEES (
   PROTOKOLL_KOD, PROTOKOLL_MEGNEVEZES, HBCS_KOD, HBCS_MEGNEVEZES, BNO_KOD, BNO_MEGNEVEZES
) values (            7997, 'Kemoterápia, N7 protokoll szerint 18 év alatt', '959E', 'Rosszindulatú daganat kemoterápiája &quot;E&quot;', 'C79', 'Egyéb lokalizációk másodlagos rosszindulatú daganata');
--
commit;
--
--