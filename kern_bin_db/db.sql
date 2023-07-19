both
create table instances (instance_id SERIAL PRIMARY KEY, version_string varchar(40), note varchar(50));
create table xrefs     (caller int, callee int, ref_addr varchar(20), source_line varchar(1024), xref_instance_id_ref int);
create table tags      (tag_id SERIAL PRIMARY KEY, subsys_name varchar(100), tag_file_ref_id int not null, tag_instance_id_ref int  not null);
create table configs   (config_id SERIAL PRIMARY KEY, config_symbol varchar(150), config_value varchar(150), config_instance_id_ref int not null);
create table symbols   (symbol_id SERIAL PRIMARY KEY, symbol_name varchar(100), symbol_address varchar(20), symbol_type varchar(15), symbol_file_ref_id int, symbol_instance_id_ref int not null);
create table files     (file_id SERIAL PRIMARY KEY, file_name varchar (100), file_instance_id_ref int not null);

postgres
create index symbol_name_idx on symbols using hash (symbol_name);
create index caller_idx on xrefs   using hash (caller);
create index callee_idx on xrefs   using hash (callee);
create index file_name_idx on files   using hash (file_name);
create index tag_file_ref_id_idx on tags    using hash (tag_file_ref_id);
create index symbol_file_ref_id_idx on symbols using hash (symbol_file_ref_id);
create index symbol_address_idx on symbols using btree (symbol_address COLLATE "default" ASC NULLS LAST, symbol_instance_id_ref ASC NULLS LAST);


mysql
create index symbol_name_idx on symbols (symbol_name) using hash;
create index caller_idx on xrefs (caller) using hash;
create index callee_idx on xrefs (callee) using hash;
create index file_name_idx on files (file_name) using hash;
create index tag_file_ref_id_idx on tags (tag_file_ref_id) using hash;
create index symbol_file_ref_id_idx on symbols (symbol_file_ref_id) using hash;
create index symbol_address_idx on symbols (symbol_address COLLATE "default" ASC NULLS LAST, symbol_instance_id_ref ASC NULLS LAST)  using btree









;

