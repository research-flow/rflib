-- {{comment}}
--
begin
   execute immediate 'DROP TABLE '
                     || '{{table}}'
                     || ' PURGE';
exception
   when others then
      if sqlcode != -942 then
         raise;
      end if;
end;
/
--
create table {{table}} (
{{#columns}}
   {{name}} {{type}}{{^if_last}},{{/if_last}}
{{/columns}}
)
nologging;
--
{{#rows}}
insert into {{table}} (
   {{col_list}}
) values {{values}};
{{/rows}}
--
commit;
--
{{#create_index}}
-- Optional indexing
CREATE INDEX {{index_name}} ON {{table}} ({{index_col}});
{{/create_index}}