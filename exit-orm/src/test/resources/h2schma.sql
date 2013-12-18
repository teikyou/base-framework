alter table tb_account_menu drop constraint FK_nir9pgetp3fr0lu4ka40dd9hc
alter table tb_account_role_menu drop constraint FK_77450a4wnla3lbrl3d83al71s
alter table tb_account_role_menu drop constraint FK_ji2m1uttj9kokkqymf2wykcv5
alter table tb_account_user_aud drop constraint FK_cedx9xim5n5a5ivs4hvkq3e72
alter table tb_account_user_role drop constraint FK_remu85m5drp204gq5a0lgotn7
alter table tb_account_user_role drop constraint FK_rnvr7n8jn0oeu1k77togn0bkv
drop table revinfo if exists
drop table tb_account_menu if exists
drop table tb_account_role if exists
drop table tb_account_role_menu if exists
drop table tb_account_user if exists
drop table tb_account_user_aud if exists
drop table tb_account_user_role if exists
create table revinfo (rev integer generated by default as identity, revtstmp bigint, primary key (rev))
create table tb_account_menu (id varchar(32) not null, name varchar(255), type integer not null, fk_parent_id varchar(32), primary key (id))
create table tb_account_role (id varchar(32) not null, name varchar(255), primary key (id))
create table tb_account_role_menu (role_id varchar(32) not null, menu_id varchar(32) not null)
create table tb_account_user (id varchar(32) not null, create_time timestamp, login_name varchar(255), password varchar(255), pinyin_code varchar(255), real_name varchar(255), state integer, wubi_code varchar(255), primary key (id))
create table tb_account_user_aud (id varchar(32) not null, rev integer not null, revtype tinyint, create_time timestamp, login_name varchar(255), password varchar(255), pinyin_code varchar(255), real_name varchar(255), state integer, wubi_code varchar(255), primary key (id, rev))
create table tb_account_user_role (user_id varchar(32) not null, role_id varchar(32) not null)
alter table tb_account_menu add constraint FK_nir9pgetp3fr0lu4ka40dd9hc foreign key (fk_parent_id) references tb_account_menu
alter table tb_account_role_menu add constraint FK_77450a4wnla3lbrl3d83al71s foreign key (menu_id) references tb_account_menu
alter table tb_account_role_menu add constraint FK_ji2m1uttj9kokkqymf2wykcv5 foreign key (role_id) references tb_account_role
alter table tb_account_user_aud add constraint FK_cedx9xim5n5a5ivs4hvkq3e72 foreign key (rev) references revinfo
alter table tb_account_user_role add constraint FK_remu85m5drp204gq5a0lgotn7 foreign key (role_id) references tb_account_role
alter table tb_account_user_role add constraint FK_rnvr7n8jn0oeu1k77togn0bkv foreign key (user_id) references tb_account_user