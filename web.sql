prompt PL/SQL Developer import file
prompt Created on 2015年7月17日 by Administrator
set feedback off
set define off
prompt Creating ADMIN...
create table ADMIN
(
  ID       VARCHAR2(32) not null,
  NAME     VARCHAR2(50) not null,
  PASSWORD VARCHAR2(50) not null,
  SEX      VARCHAR2(50) not null,
  AGE      NUMBER not null,
  TEL      VARCHAR2(50),
  PHONE    VARCHAR2(50),
  ADDR     VARCHAR2(50) not null,
  MEMO     VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table ADMIN
  add constraint ADMIN_PK primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating CUSTOM_ACCOUNT...
create table CUSTOM_ACCOUNT
(
  ACCOUNTID VARCHAR2(32) not null,
  USERNAME  VARCHAR2(50) not null,
  PASSWORD  VARCHAR2(50) not null,
  OWNERID   VARCHAR2(50) not null,
  CARID     VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table CUSTOM_ACCOUNT
  add constraint PK_CUSTOM_ACCOUNT primary key (ACCOUNTID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating HOUSE...
create table HOUSE
(
  ID        VARCHAR2(32) not null,
  NUM       VARCHAR2(50) not null,
  DEP       VARCHAR2(50) not null,
  TYPE      VARCHAR2(50) not null,
  AREA      VARCHAR2(50) not null,
  SELL      VARCHAR2(50) not null,
  UNIT      VARCHAR2(50) not null,
  FLOOR     VARCHAR2(50) not null,
  DIRECTION VARCHAR2(50) not null,
  MEMO      VARCHAR2(100),
  OWNERID   VARCHAR2(32)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table HOUSE
  add constraint PK_HOUSE primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating INSPECTION...
create table INSPECTION
(
  ID        VARCHAR2(32) not null,
  PERSON    VARCHAR2(50) not null,
  TYPE      VARCHAR2(50) not null,
  ITIME     DATE not null,
  CONDUCTOR VARCHAR2(32) not null,
  PARTY     VARCHAR2(50) not null,
  RESULT    VARCHAR2(50) not null,
  MEMO      VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table INSPECTION
  add constraint PK_INSPECTION primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating MAINTAIN...
create table MAINTAIN
(
  ID          VARCHAR2(32) not null,
  THING       VARCHAR2(50) not null,
  STATUS      VARCHAR2(50) not null,
  HOMESNUMBER VARCHAR2(50) not null,
  SDATE       DATE not null,
  RDATE       DATE,
  TCOST       NUMBER not null,
  SCOST       NUMBER,
  MAINTAINER  VARCHAR2(32) not null,
  SMEMO       VARCHAR2(100)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table MAINTAIN
  add constraint PK_MAINTAIN primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Creating NOTICE...
create table NOTICE
(
  ID      VARCHAR2(32) not null,
  CONTENT VARCHAR2(300) not null,
  NDATE   DATE not null,
  TITLE   VARCHAR2(50) not null,
  UPER    VARCHAR2(32) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );
alter table NOTICE
  add constraint PK_NOTIFY primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for ADMIN...
alter table ADMIN disable all triggers;
prompt Disabling triggers for CUSTOM_ACCOUNT...
alter table CUSTOM_ACCOUNT disable all triggers;
prompt Disabling triggers for HOUSE...
alter table HOUSE disable all triggers;
prompt Disabling triggers for INSPECTION...
alter table INSPECTION disable all triggers;
prompt Disabling triggers for MAINTAIN...
alter table MAINTAIN disable all triggers;
prompt Disabling triggers for NOTICE...
alter table NOTICE disable all triggers;
prompt Deleting NOTICE...
delete from NOTICE;
commit;
prompt Deleting MAINTAIN...
delete from MAINTAIN;
commit;
prompt Deleting INSPECTION...
delete from INSPECTION;
commit;
prompt Deleting HOUSE...
delete from HOUSE;
commit;
prompt Deleting CUSTOM_ACCOUNT...
delete from CUSTOM_ACCOUNT;
commit;
prompt Deleting ADMIN...
delete from ADMIN;
commit;
prompt Loading ADMIN...
insert into ADMIN (ID, NAME, PASSWORD, SEX, AGE, TEL, PHONE, ADDR, MEMO)
values ('CB20B914A3554FAF85CCEA4690536E38', 'xjtu', '4QrcOUm6Wau+VuBX8g+IPg==', '男', 9, null, null, '277', null);
insert into ADMIN (ID, NAME, PASSWORD, SEX, AGE, TEL, PHONE, ADDR, MEMO)
values ('4616E76B0A194DBD80CA5D22B7F00331', 'cissst', '4QrcOUm6Wau+VuBX8g+IPg==', '男', 23, null, null, '西安交通大学', null);
insert into ADMIN (ID, NAME, PASSWORD, SEX, AGE, TEL, PHONE, ADDR, MEMO)
values ('2A886F27285A48AF99B1B775E1029230', 'yuanjie', '4QrcOUm6Wau+VuBX8g+IPg==', '男', 11, null, null, '西安', null);
insert into ADMIN (ID, NAME, PASSWORD, SEX, AGE, TEL, PHONE, ADDR, MEMO)
values ('9EC81454DB1C445183FA379FDB2C9C23', 'admin', '4QrcOUm6Wau+VuBX8g+IPg==', '女', 21, '82660646', '13888888888', '西安', '主机');
commit;
prompt 4 records loaded
prompt Loading CUSTOM_ACCOUNT...
insert into CUSTOM_ACCOUNT (ACCOUNTID, USERNAME, PASSWORD, OWNERID, CARID)
values ('ACBFBF415FB2460C9C9715E1360FDC1A', 'gwj', '4QrcOUm6Wau+VuBX8g+IPg==', '164', null);
insert into CUSTOM_ACCOUNT (ACCOUNTID, USERNAME, PASSWORD, OWNERID, CARID)
values ('614FDD226EC149DDB12BF8C04DC5CB7E', 'yuanjie', '4QrcOUm6Wau+VuBX8g+IPg==', '110', '警A65535');
insert into CUSTOM_ACCOUNT (ACCOUNTID, USERNAME, PASSWORD, OWNERID, CARID)
values ('2ECD342D22AE40ABAB1A16D2994DBD93', 'liyang', '4QrcOUm6Wau+VuBX8g+IPg==', '116', '陕A88888');
insert into CUSTOM_ACCOUNT (ACCOUNTID, USERNAME, PASSWORD, OWNERID, CARID)
values ('EE929A8B866E42F1BDBE29BB5D426D6F', 'ql', '4QrcOUm6Wau+VuBX8g+IPg==', '021', '兰A00001');
insert into CUSTOM_ACCOUNT (ACCOUNTID, USERNAME, PASSWORD, OWNERID, CARID)
values ('4A8C2422B2AC48F18D9C3A4D544771E8', 'ttq', '/OqSD3QStdp74M9CuMk3WQ==', '123', '陕A75587');
insert into CUSTOM_ACCOUNT (ACCOUNTID, USERNAME, PASSWORD, OWNERID, CARID)
values ('3949FB77D24443E4A7A6DFA1E0FC19A3', 'cyw', '4QrcOUm6Wau+VuBX8g+IPg==', '101', '北A12345');
commit;
prompt 6 records loaded
prompt Loading HOUSE...
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('6511035FFBC94953AC0879E37EA55803', '888', '8', '独栋', '北京中南海', '待售', '2', '1', '南', null, null);
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('EA17F6C247344A2680FAB7824AEBBC9C', '602', '2', '独栋', '北京', '已售', '1', '2', '南', null, '123');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('D305F9C59F4D40BEB796F9DF58E024A5', '604', '1', '独栋', '西安', '已售', '1', '1', '南', null, '116');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('9578E432BF52439AA1B2D3C013BCD275', '110', '5', '独栋', '西安', '已售', '1', '1', '东', null, '110');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('0BB582A6C2F34346BC4186D756E3EE37', '666', '1', '小高层', '西安', '已售', '1', '8', '北', null, '101');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('642A304BD40E4F70A368ECFA074DAA41', '116', '1', '独栋', '西安', '已售', '1', '4', '南', null, '101');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('DF17ADE2B96F4654B508A8E242CA0F1B', '110', '9', '独栋', '北京', '已售', '2', '5', '南', '贵', '164');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('19C4DFE861D14A048EB0EF18B9353B9A', '117', '4', '独栋', '西安', '已售', '5', '5', '西', null, '116');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('927FB11BF20847B2B0D9C36C84212C1D', '168', '5', '独栋', '西安', '已售', '7', '5', '北', null, '110');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('8986DCCC321B4C9EB1904BE77983BCCD', '602', '2', '独栋', '长安', '已售', '1', '5', '东', null, '116');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('8152EBB09C9A4E6A85F22FCB20ADBC7E', '123', '7', '独栋', '西安', '已售', '2', '5', '南', null, '021');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('68D15264555F4544ACE70068CF4F67F6', '888334', '1', '独栋', '西安', '已售', '4', '6', '南', null, '666');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('6A3BD6572944488EB5A67B61EB41CB69', '603', '8', '小高层', '西安', '已售', '3', '6', '西', null, '101');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('F3799D9C625A4DCAB306707D5DCCC651', '554', '7', '独栋', '西安', '已售', '2', '5', '南', null, '021');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('35DD2A421D234EDF9D507116B2BD5331', '662', '7', '独栋', '西安', '已售', '9', '3', '南', null, '021');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('44EBAF68B9D2420DA939B9A5FDA3C64F', '902', '8', '小高层', '西安', '已售', '2', '9', '东', null, '101');
insert into HOUSE (ID, NUM, DEP, TYPE, AREA, SELL, UNIT, FLOOR, DIRECTION, MEMO, OWNERID)
values ('028A0A15484B4FA4A607611C3272A312', '412', '7', '独栋', '西安', '已售', '1', '1', '南', null, '021');
commit;
prompt 17 records loaded
prompt Loading INSPECTION...
insert into INSPECTION (ID, PERSON, TYPE, ITIME, CONDUCTOR, PARTY, RESULT, MEMO)
values ('FF1C423B8B494A5D8462863298974DC5', '王五', '保安', to_date('01-07-2015', 'dd-mm-yyyy'), '钱磊', '唐天奇', '正常', null);
insert into INSPECTION (ID, PERSON, TYPE, ITIME, CONDUCTOR, PARTY, RESULT, MEMO)
values ('0F018498E9C34EFFBA37B445737D9EAE', '张三', '保洁员', to_date('16-07-2015', 'dd-mm-yyyy'), 'admin', '业主', '正常', null);
insert into INSPECTION (ID, PERSON, TYPE, ITIME, CONDUCTOR, PARTY, RESULT, MEMO)
values ('4B040F0DB4F94EDE878D988996FBC1F8', '李四', '保安', to_date('16-07-2015', 'dd-mm-yyyy'), '李阳', '业主', '正常', null);
commit;
prompt 3 records loaded
prompt Loading MAINTAIN...
insert into MAINTAIN (ID, THING, STATUS, HOMESNUMBER, SDATE, RDATE, TCOST, SCOST, MAINTAINER, SMEMO)
values ('78852CD114E74188A37EF73AD9501EB7', '水龙头', '已完成', '666', to_date('16-07-2015', 'dd-mm-yyyy'), to_date('24-07-2015', 'dd-mm-yyyy'), 132, 0, 'ql', null);
insert into MAINTAIN (ID, THING, STATUS, HOMESNUMBER, SDATE, RDATE, TCOST, SCOST, MAINTAINER, SMEMO)
values ('DB4E0D0FF1564442A1CB9550239AD8D1', '下水道', '正在处理', '888', to_date('15-07-2015', 'dd-mm-yyyy'), null, 30, 0, 'lc', '马上派人修理');
insert into MAINTAIN (ID, THING, STATUS, HOMESNUMBER, SDATE, RDATE, TCOST, SCOST, MAINTAINER, SMEMO)
values ('E429D17C82904F37979F9319A360C1B2', '桌子', '等待处理', '604', to_date('16-07-2015', 'dd-mm-yyyy'), null, 15, 0, 'gwj', null);
insert into MAINTAIN (ID, THING, STATUS, HOMESNUMBER, SDATE, RDATE, TCOST, SCOST, MAINTAINER, SMEMO)
values ('54C233E3DD294BEFA0385F8C8D0AE44A', '电脑', '等待处理', '132', to_date('19-07-2015', 'dd-mm-yyyy'), null, 0, 0, 'gwj', null);
insert into MAINTAIN (ID, THING, STATUS, HOMESNUMBER, SDATE, RDATE, TCOST, SCOST, MAINTAINER, SMEMO)
values ('52F265B313D94AA091095683F6E018ED', '窗户', '等待处理', '123', to_date('17-07-2015', 'dd-mm-yyyy'), null, 111, 0, 'ttq', null);
insert into MAINTAIN (ID, THING, STATUS, HOMESNUMBER, SDATE, RDATE, TCOST, SCOST, MAINTAINER, SMEMO)
values ('B1866028BBD84137A0106AF051A61FB5', '桌子', '正在处理', '412', to_date('16-07-2015', 'dd-mm-yyyy'), null, 30, 0, 'liyang', null);
insert into MAINTAIN (ID, THING, STATUS, HOMESNUMBER, SDATE, RDATE, TCOST, SCOST, MAINTAINER, SMEMO)
values ('D293FE88DDBD4CF8AF3B27A534D2823C', '电脑', '正在处理', '123', to_date('18-07-2015', 'dd-mm-yyyy'), null, 0, 0, 'cyw', null);
insert into MAINTAIN (ID, THING, STATUS, HOMESNUMBER, SDATE, RDATE, TCOST, SCOST, MAINTAINER, SMEMO)
values ('7DF91D3F3A4A4159A536B57B39A41014', '水管', '等待处理', '411', to_date('17-07-2015', 'dd-mm-yyyy'), null, 11, 0, 'liyang', '漏水');
commit;
prompt 8 records loaded
prompt Loading NOTICE...
insert into NOTICE (ID, CONTENT, NDATE, TITLE, UPER)
values ('37A46BED4C724663BCBE0517BCC9C3E9', '尊敬的业主：' || chr(13) || '' || chr(10) || '       今天晚上本小区将会在广场上映2016年蝙蝠侠大战超人预告片（无修版），期待您的前往。' || chr(13) || '' || chr(10) || '      有问题，找物业！！', to_date('16-07-2015', 'dd-mm-yyyy'), '2016年蝙蝠侠大战超人预告片（无修版）', 'D.C');
insert into NOTICE (ID, CONTENT, NDATE, TITLE, UPER)
values ('A0D6FEDF730B46A4BA9B61D55B212E74', '尊敬的业主，您好：' || chr(13) || '' || chr(10) || '    7月4日为本小区贴吧一年一度限水日，特停水一天，所有灌水贴一律删删删，大水货们一律关关关。如对您的日常水贴造成不便，请来打我。' || chr(13) || '' || chr(10) || '    有问题，找物业！！！', to_date('01-07-2015', 'dd-mm-yyyy'), '7月4日停水公告', '管理员');
insert into NOTICE (ID, CONTENT, NDATE, TITLE, UPER)
values ('9C35D69C24034DAC8941E4240E08EC4E', '      感谢王老师在这三周的实习期间给我们悉心指导和宽容理解，让我们在良好的环境和氛围中顺利完成实习任务！' || chr(13) || '' || chr(10) || '      感谢交大带队老师每天辛苦的工作和对我们细腻的关怀！ ' || chr(13) || '' || chr(10) || '      感谢每一位合作伙伴在项目过程中的相互理解包容和辛勤的努力！' || chr(13) || '' || chr(10) || '', to_date('17-07-2015', 'dd-mm-yyyy'), '感谢信', '第六组');
insert into NOTICE (ID, CONTENT, NDATE, TITLE, UPER)
values ('3E1BA1F114EB4BD784D43591E4DCDD29', '尊敬的业主，您好：' || chr(13) || '' || chr(10) || '    根据气象台预报，近期本事可能会也可能不会受台风侵袭，将有强降水和超强台风，为避免意外发生，造成人身财产损失，敬请各位业主关好门窗。' || chr(13) || '' || chr(10) || '    有问题，找物业！！！', to_date('03-07-2015', 'dd-mm-yyyy'), '防台风通知', '管理员');
commit;
prompt 4 records loaded
prompt Enabling triggers for ADMIN...
alter table ADMIN enable all triggers;
prompt Enabling triggers for CUSTOM_ACCOUNT...
alter table CUSTOM_ACCOUNT enable all triggers;
prompt Enabling triggers for HOUSE...
alter table HOUSE enable all triggers;
prompt Enabling triggers for INSPECTION...
alter table INSPECTION enable all triggers;
prompt Enabling triggers for MAINTAIN...
alter table MAINTAIN enable all triggers;
prompt Enabling triggers for NOTICE...
alter table NOTICE enable all triggers;
set feedback on
set define on
prompt Done.
