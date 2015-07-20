/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin 
(
   id                   varchar2(32)                   not null,
   name                 varchar2(50)                   not null,
   password             varchar2(50)                   not null,
   sex                  varchar2(50)                   not null,
   age                  number                         not null,
   tel                  varchar2(50)                   null,
   phone                varchar2(50)                   null,
   addr                 varchar2(50)                   not null,
   memo                 varchar2(100)                  null,
   constraint PK_ADMIN primary key (id)
);

/*==============================================================*/
/* Table: custom_account                                        */
/*==============================================================*/
create table custom_account 
(
   accountid            varchar2(32)                   not null,
   username             varchar2(50)                   not null,
   password             varchar2(50)                   not null,
   ownerid              varchar2(50)                   not null,
   carid                varchar2(50)                   null,
   constraint PK_CUSTOM_ACCOUNT primary key (accountid)
);

/*==============================================================*/
/* Table: house                                                 */
/*==============================================================*/
create table house 
(
   id                   varchar2(32)                   not null,
   num               	varchar2(50)                   not null,
   dep                  varchar2(50)                   not null,
   type                 varchar2(50)                   not null,
   area                 varchar2(50)                   not null,
   sell                 varchar2(50)                   not null,
   unit                 varchar2(50)                   not null,
   floor                varchar2(50)                   not null,
   direction            varchar2(50)                   not null,
   memo                 varchar2(100)                  null,
   ownerid              varchar2(32)                   null,
   constraint PK_HOUSE primary key (id)
);

/*==============================================================*/
/* Table: inspection                                            */
/*==============================================================*/
create table inspection 
(
   id                   varchar2(32)                   not null,
   person               varchar2(50)                   not null,
   type                 varchar2(50)                   not null,
   itime                date                           not null,
   conductor            varchar2(32)                   not null,
   party                varchar2(50)                   not null,
   result               varchar2(50)                   not null,
   memo                 varchar2(100)                  null,
   constraint PK_INSPECTION primary key (id)
);

/*==============================================================*/
/* Table: maintain                                              */
/*==============================================================*/
create table maintain 
(
   id                   varchar2(32)                   not null,
   thing                varchar2(50)                   not null,
   status               varchar2(50)                   not null,
   homesnumber          varchar2(50)                   not null,
   sdate                date                           not null,
   rdate                date                           null,
   tcost                number                         not null,
   scost                number                         null,
   maintainer           varchar2(32)                   not null,
   smemo                varchar2(100)                  null,
   constraint PK_MAINTAIN primary key (id)
);

/*==============================================================*/
/* Table: notice                                                */
/*==============================================================*/
create table notice 
(
   id                   varchar2(32)                   not null,
   content              varchar2(300)                  not null,
   ndate                date                           not null,
   title                varchar2(50)                   not null,
   uper                 varchar2(32)                   not null,
   constraint PK_NOTIFY primary key (id)
);