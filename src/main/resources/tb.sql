prompt PL/SQL Developer import file
prompt Created on 2019年3月29日 by admin
set feedback off
set define off
prompt Creating AREA...
create table AREA
(
  id    NUMBER,
  aid   VARCHAR2(50),
  aname VARCHAR2(50),
  cid   VARCHAR2(50)
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

prompt Creating CITY...
create table CITY
(
  id    NUMBER,
  cid   VARCHAR2(50),
  cname VARCHAR2(50),
  pid   VARCHAR2(50)
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

prompt Creating PROVINCE...
create table PROVINCE
(
  id    NUMBER,
  pid   VARCHAR2(50),
  pname VARCHAR2(50)
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

prompt Creating TB_ACCOUNT...
create table TB_ACCOUNT
(
  id                  NUMBER(20) not null,
  userid              NUMBER(20),
  availablebalance    NUMBER(20,3),
  receiveinterest     NUMBER(20,3),
  receiveprincipal    NUMBER(20,3),
  returnamount        NUMBER(20,3),
  freezingamount      NUMBER(20,3),
  creditline          NUMBER(20,3),
  surpluscreditline   NUMBER(20,3),
  transactionpassword NUMBER(10)
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
alter table TB_ACCOUNT
  add primary key (ID)
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

prompt Creating TB_ADVERT...
create table TB_ADVERT
(
  id    NUMBER(10),
  image VARCHAR2(200),
  name  VARCHAR2(20),
  url   VARCHAR2(20)
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

prompt Creating TB_BIDCHECK...
create table TB_BIDCHECK
(
  borrowuserid   VARCHAR2(20),
  borrowusername VARCHAR2(20),
  input          VARCHAR2(20),
  borrowmoney    VARCHAR2(20),
  borrowtime     DATE,
  repaytime      VARCHAR2(20),
  biddescribe    VARCHAR2(200),
  bidstatus      VARCHAR2(20),
  borrowmethod   VARCHAR2(20),
  methoddescribe VARCHAR2(200),
  bidid          NUMBER(3) not null,
  bidtime        VARCHAR2(3)
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
comment on column TB_BIDCHECK.biddescribe
  is '投标描述';
comment on column TB_BIDCHECK.bidstatus
  is '标的状态';
comment on column TB_BIDCHECK.borrowmethod
  is '借款方式';
comment on column TB_BIDCHECK.methoddescribe
  is '借款方式说明';
comment on column TB_BIDCHECK.bidid
  is '投标id';
comment on column TB_BIDCHECK.bidtime
  is '投标时间';
alter table TB_BIDCHECK
  add constraint TB_BIDCHECK_BIDID primary key (BIDID)
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

prompt Creating TB_BIDINFO...
create table TB_BIDINFO
(
  id                 NUMBER(20) not null,
  userid             NUMBER(20),
  bidamount          NUMBER(10,3),
  bidcurrentamount   NUMBER(10,3),
  bidrepaymentmethod VARCHAR2(50),
  bidrate            NUMBER(10,2),
  biddeadline        VARCHAR2(50),
  bidissuedate       DATE,
  biddeadday         VARCHAR2(50),
  biddeaddate        DATE,
  bidapplydate       DATE,
  biddesc            VARCHAR2(1000),
  bidtype            VARCHAR2(50),
  bidstate           VARCHAR2(50)
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
alter table TB_BIDINFO
  add primary key (ID)
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

prompt Creating TB_BID_AUDIT...
create table TB_BID_AUDIT
(
  id           NUMBER(20),
  userid       NUMBER(10),
  bidid        NUMBER(20),
  auditid      NUMBER(20),
  audittime    DATE,
  auditresult  VARCHAR2(50),
  auditremarks VARCHAR2(500),
  applytime    DATE
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

prompt Creating TB_BID_REPAY_INFO...
create table TB_BID_REPAY_INFO
(
  id                 NUMBER(20),
  bidid              NUMBER(20),
  bidrepayamount     NUMBER(20,3),
  bidrepaydate       DATE,
  bidrepaydeaddate   DATE,
  bidnextrepaydate   DATE,
  bidnextreapyamount NUMBER(20,3),
  bidrepaystate      VARCHAR2(100),
  bidrepaynumber     VARCHAR2(100),
  bidrepaytotpmts    VARCHAR2(100),
  bidrepaymethod     VARCHAR2(100),
  bidrepayuserid     NUMBER(20)
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

prompt Creating TB_BID_SUBMIT...
create table TB_BID_SUBMIT
(
  id        NUMBER(20),
  bidinfoid NUMBER(20),
  userid    NUMBER(20),
  bidamount NUMBER(20,3),
  bidrate   NUMBER(10,3),
  biddate   DATE,
  username  VARCHAR2(20)
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

prompt Creating TB_DEPT...
create table TB_DEPT
(
  id    NUMBER(10) not null,
  dname VARCHAR2(20) not null,
  des   VARCHAR2(200) not null,
  state VARCHAR2(20)
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
alter table TB_DEPT
  add primary key (ID)
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

prompt Creating TB_EMP...
create table TB_EMP
(
  id       NUMBER(20) not null,
  username VARCHAR2(20),
  password VARCHAR2(20),
  roleid   NUMBER(20),
  empname  VARCHAR2(20),
  deptno   NUMBER(20),
  sex      VARCHAR2(20),
  hiredate DATE,
  sal      NUMBER(20,2),
  comm     NUMBER(20,2),
  idcard   VARCHAR2(50),
  tel      VARCHAR2(50)
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
alter table TB_EMP
  add primary key (ID)
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

prompt Creating TB_FWDINFO...
create table TB_FWDINFO
(
  userid      NUMBER,
  userpaypsw  VARCHAR2(50),
  userbanknum VARCHAR2(50),
  useremail   VARCHAR2(50),
  fwdinfoid   NUMBER not null,
  userhead    VARCHAR2(50)
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

prompt Creating TB_FWDLOGIN...
create table TB_FWDLOGIN
(
  userid    NUMBER not null,
  username  VARCHAR2(50) not null,
  userpsw   VARCHAR2(50) not null,
  usertel   VARCHAR2(50) not null,
  userrec   VARCHAR2(50),
  userexist NUMBER default 1 not null
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
alter table TB_FWDLOGIN
  add constraint USERID primary key (USERID)
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

prompt Creating TB_LOG...
create table TB_LOG
(
  id       NUMBER(20) not null,
  username VARCHAR2(50),
  ip       VARCHAR2(50),
  logtime  DATE
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
alter table TB_LOG
  add primary key (ID)
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

prompt Creating TB_PIC...
create table TB_PIC
(
  id  NUMBER(10) not null,
  loc VARCHAR2(200),
  url VARCHAR2(1000) not null
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
alter table TB_PIC
  add primary key (ID)
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

prompt Creating TB_POWER...
create table TB_POWER
(
  id       NUMBER(10) not null,
  name     VARCHAR2(20),
  state    VARCHAR2(20),
  iconcls  VARCHAR2(20),
  url      VARCHAR2(50),
  parentid NUMBER(10)
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
alter table TB_POWER
  add primary key (ID)
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

prompt Creating TB_ROLE...
create table TB_ROLE
(
  id   NUMBER(20) not null,
  role VARCHAR2(50)
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
alter table TB_ROLE
  add primary key (ID)
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

prompt Creating TB_ROLE_POWER...
create table TB_ROLE_POWER
(
  id      NUMBER(20) not null,
  roleid  NUMBER(20),
  powerid NUMBER(20)
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
alter table TB_ROLE_POWER
  add primary key (ID)
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

prompt Creating TB_SYSTEM_ACCOUNT_FLOW...
create table TB_SYSTEM_ACCOUNT_FLOW
(
  id               NUMBER(20),
  userid           NUMBER(20),
  accountid        NUMBER(20),
  amount           NUMBER(20,3),
  availablebalance NUMBER(20,3),
  flowdate         DATE,
  flowtype         VARCHAR2(100),
  banknumber       NUMBER(20)
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

prompt Creating TB_USER...
create table TB_USER
(
  empno    NUMBER(4),
  ename    VARCHAR2(10),
  job      VARCHAR2(9),
  hiredate DATE,
  sal      NUMBER(7,2),
  comm     NUMBER(7,2),
  deptno   NUMBER(2)
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

prompt Creating TB_USERREAL...
create table TB_USERREAL
(
  id              NUMBER(10) not null,
  userid          NUMBER(10),
  realname        VARCHAR2(20),
  sex             VARCHAR2(10),
  address         VARCHAR2(500),
  idnumber        VARCHAR2(200),
  academic        VARCHAR2(50),
  housed          VARCHAR2(100),
  marriage        VARCHAR2(100),
  income          VARCHAR2(100),
  idimagefountvar VARCHAR2(500),
  idimagebackvar  VARCHAR2(500),
  applytime       DATE,
  auditorid       NUMBER(20),
  audittime       DATE,
  auditresult     VARCHAR2(50),
  auditremarks    VARCHAR2(500)
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
alter table TB_USERREAL
  add primary key (ID)
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

prompt Creating TB_USER_ACCOUNT_FLOW...
create table TB_USER_ACCOUNT_FLOW
(
  id               NUMBER(20) not null,
  userid           NUMBER(20),
  accountid        NUMBER(20),
  amount           NUMBER(20,3),
  availablebalance NUMBER(20,3),
  flowdate         DATE,
  flowtype         VARCHAR2(100)
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
alter table TB_USER_ACCOUNT_FLOW
  add primary key (ID)
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

prompt Creating TB_VIDEO_AUDIT...
create table TB_VIDEO_AUDIT
(
  id               NUMBER(20),
  userid           NUMBER(20),
  appointmenttime  VARCHAR2(50),
  applytime        DATE,
  auditorid        NUMBER(10),
  audittime        DATE,
  auditresult      VARCHAR2(50),
  auditremarks     VARCHAR2(100),
  appointmentmanid NUMBER(20),
  appointtime      DATE
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

prompt Disabling triggers for AREA...
alter table AREA disable all triggers;
prompt Disabling triggers for CITY...
alter table CITY disable all triggers;
prompt Disabling triggers for PROVINCE...
alter table PROVINCE disable all triggers;
prompt Disabling triggers for TB_ACCOUNT...
alter table TB_ACCOUNT disable all triggers;
prompt Disabling triggers for TB_ADVERT...
alter table TB_ADVERT disable all triggers;
prompt Disabling triggers for TB_BIDCHECK...
alter table TB_BIDCHECK disable all triggers;
prompt Disabling triggers for TB_BIDINFO...
alter table TB_BIDINFO disable all triggers;
prompt Disabling triggers for TB_BID_AUDIT...
alter table TB_BID_AUDIT disable all triggers;
prompt Disabling triggers for TB_BID_REPAY_INFO...
alter table TB_BID_REPAY_INFO disable all triggers;
prompt Disabling triggers for TB_BID_SUBMIT...
alter table TB_BID_SUBMIT disable all triggers;
prompt Disabling triggers for TB_DEPT...
alter table TB_DEPT disable all triggers;
prompt Disabling triggers for TB_EMP...
alter table TB_EMP disable all triggers;
prompt Disabling triggers for TB_FWDINFO...
alter table TB_FWDINFO disable all triggers;
prompt Disabling triggers for TB_FWDLOGIN...
alter table TB_FWDLOGIN disable all triggers;
prompt Disabling triggers for TB_LOG...
alter table TB_LOG disable all triggers;
prompt Disabling triggers for TB_PIC...
alter table TB_PIC disable all triggers;
prompt Disabling triggers for TB_POWER...
alter table TB_POWER disable all triggers;
prompt Disabling triggers for TB_ROLE...
alter table TB_ROLE disable all triggers;
prompt Disabling triggers for TB_ROLE_POWER...
alter table TB_ROLE_POWER disable all triggers;
prompt Disabling triggers for TB_SYSTEM_ACCOUNT_FLOW...
alter table TB_SYSTEM_ACCOUNT_FLOW disable all triggers;
prompt Disabling triggers for TB_USER...
alter table TB_USER disable all triggers;
prompt Disabling triggers for TB_USERREAL...
alter table TB_USERREAL disable all triggers;
prompt Disabling triggers for TB_USER_ACCOUNT_FLOW...
alter table TB_USER_ACCOUNT_FLOW disable all triggers;
prompt Disabling triggers for TB_VIDEO_AUDIT...
alter table TB_VIDEO_AUDIT disable all triggers;
prompt Deleting TB_VIDEO_AUDIT...
delete from TB_VIDEO_AUDIT;
commit;
prompt Deleting TB_USER_ACCOUNT_FLOW...
delete from TB_USER_ACCOUNT_FLOW;
commit;
prompt Deleting TB_USERREAL...
delete from TB_USERREAL;
commit;
prompt Deleting TB_USER...
delete from TB_USER;
commit;
prompt Deleting TB_SYSTEM_ACCOUNT_FLOW...
delete from TB_SYSTEM_ACCOUNT_FLOW;
commit;
prompt Deleting TB_ROLE_POWER...
delete from TB_ROLE_POWER;
commit;
prompt Deleting TB_ROLE...
delete from TB_ROLE;
commit;
prompt Deleting TB_POWER...
delete from TB_POWER;
commit;
prompt Deleting TB_PIC...
delete from TB_PIC;
commit;
prompt Deleting TB_LOG...
delete from TB_LOG;
commit;
prompt Deleting TB_FWDLOGIN...
delete from TB_FWDLOGIN;
commit;
prompt Deleting TB_FWDINFO...
delete from TB_FWDINFO;
commit;
prompt Deleting TB_EMP...
delete from TB_EMP;
commit;
prompt Deleting TB_DEPT...
delete from TB_DEPT;
commit;
prompt Deleting TB_BID_SUBMIT...
delete from TB_BID_SUBMIT;
commit;
prompt Deleting TB_BID_REPAY_INFO...
delete from TB_BID_REPAY_INFO;
commit;
prompt Deleting TB_BID_AUDIT...
delete from TB_BID_AUDIT;
commit;
prompt Deleting TB_BIDINFO...
delete from TB_BIDINFO;
commit;
prompt Deleting TB_BIDCHECK...
delete from TB_BIDCHECK;
commit;
prompt Deleting TB_ADVERT...
delete from TB_ADVERT;
commit;
prompt Deleting TB_ACCOUNT...
delete from TB_ACCOUNT;
commit;
prompt Deleting PROVINCE...
delete from PROVINCE;
commit;
prompt Deleting CITY...
delete from CITY;
commit;
prompt Deleting AREA...
delete from AREA;
commit;
prompt Loading AREA...
insert into AREA (id, aid, aname, cid)
values (476, '210204', '沙河口区', '210200');
insert into AREA (id, aid, aname, cid)
values (477, '210211', '甘井子区', '210200');
insert into AREA (id, aid, aname, cid)
values (478, '210212', '旅顺口区', '210200');
insert into AREA (id, aid, aname, cid)
values (479, '210213', '金州区', '210200');
insert into AREA (id, aid, aname, cid)
values (480, '210224', '长海县', '210200');
insert into AREA (id, aid, aname, cid)
values (481, '210281', '瓦房店市', '210200');
insert into AREA (id, aid, aname, cid)
values (482, '210282', '普兰店市', '210200');
insert into AREA (id, aid, aname, cid)
values (483, '210283', '庄河市', '210200');
insert into AREA (id, aid, aname, cid)
values (484, '210301', '市辖区', '210300');
insert into AREA (id, aid, aname, cid)
values (485, '210302', '铁东区', '210300');
insert into AREA (id, aid, aname, cid)
values (486, '210303', '铁西区', '210300');
insert into AREA (id, aid, aname, cid)
values (487, '210304', '立山区', '210300');
insert into AREA (id, aid, aname, cid)
values (488, '210311', '千山区', '210300');
insert into AREA (id, aid, aname, cid)
values (489, '210321', '台安县', '210300');
insert into AREA (id, aid, aname, cid)
values (490, '210323', '岫岩满族自治县', '210300');
insert into AREA (id, aid, aname, cid)
values (491, '210381', '海城市', '210300');
insert into AREA (id, aid, aname, cid)
values (492, '210401', '市辖区', '210400');
insert into AREA (id, aid, aname, cid)
values (493, '210402', '新抚区', '210400');
insert into AREA (id, aid, aname, cid)
values (494, '210403', '东洲区', '210400');
insert into AREA (id, aid, aname, cid)
values (495, '210404', '望花区', '210400');
insert into AREA (id, aid, aname, cid)
values (496, '210411', '顺城区', '210400');
insert into AREA (id, aid, aname, cid)
values (497, '210421', '抚顺县', '210400');
insert into AREA (id, aid, aname, cid)
values (498, '210422', '新宾满族自治县', '210400');
insert into AREA (id, aid, aname, cid)
values (499, '210423', '清原满族自治县', '210400');
insert into AREA (id, aid, aname, cid)
values (500, '210501', '市辖区', '210500');
insert into AREA (id, aid, aname, cid)
values (501, '210502', '平山区', '210500');
insert into AREA (id, aid, aname, cid)
values (502, '210503', '溪湖区', '210500');
insert into AREA (id, aid, aname, cid)
values (503, '210504', '明山区', '210500');
insert into AREA (id, aid, aname, cid)
values (504, '210505', '南芬区', '210500');
insert into AREA (id, aid, aname, cid)
values (505, '210521', '本溪满族自治县', '210500');
insert into AREA (id, aid, aname, cid)
values (506, '210522', '桓仁满族自治县', '210500');
insert into AREA (id, aid, aname, cid)
values (507, '210601', '市辖区', '210600');
insert into AREA (id, aid, aname, cid)
values (508, '210602', '元宝区', '210600');
insert into AREA (id, aid, aname, cid)
values (509, '210603', '振兴区', '210600');
insert into AREA (id, aid, aname, cid)
values (510, '210604', '振安区', '210600');
insert into AREA (id, aid, aname, cid)
values (511, '210624', '宽甸满族自治县', '210600');
insert into AREA (id, aid, aname, cid)
values (512, '210681', '东港市', '210600');
insert into AREA (id, aid, aname, cid)
values (513, '210682', '凤城市', '210600');
insert into AREA (id, aid, aname, cid)
values (514, '210701', '市辖区', '210700');
insert into AREA (id, aid, aname, cid)
values (515, '210702', '古塔区', '210700');
insert into AREA (id, aid, aname, cid)
values (516, '210703', '凌河区', '210700');
insert into AREA (id, aid, aname, cid)
values (517, '210711', '太和区', '210700');
insert into AREA (id, aid, aname, cid)
values (518, '210726', '黑山县', '210700');
insert into AREA (id, aid, aname, cid)
values (519, '210727', '义　县', '210700');
insert into AREA (id, aid, aname, cid)
values (520, '210781', '凌海市', '210700');
insert into AREA (id, aid, aname, cid)
values (521, '210782', '北宁市', '210700');
insert into AREA (id, aid, aname, cid)
values (522, '210801', '市辖区', '210800');
insert into AREA (id, aid, aname, cid)
values (523, '210802', '站前区', '210800');
insert into AREA (id, aid, aname, cid)
values (524, '210803', '西市区', '210800');
insert into AREA (id, aid, aname, cid)
values (525, '210804', '鲅鱼圈区', '210800');
insert into AREA (id, aid, aname, cid)
values (526, '210811', '老边区', '210800');
insert into AREA (id, aid, aname, cid)
values (527, '210881', '盖州市', '210800');
insert into AREA (id, aid, aname, cid)
values (528, '210882', '大石桥市', '210800');
insert into AREA (id, aid, aname, cid)
values (529, '210901', '市辖区', '210900');
insert into AREA (id, aid, aname, cid)
values (530, '210902', '海州区', '210900');
insert into AREA (id, aid, aname, cid)
values (531, '210903', '新邱区', '210900');
insert into AREA (id, aid, aname, cid)
values (532, '210904', '太平区', '210900');
insert into AREA (id, aid, aname, cid)
values (533, '210905', '清河门区', '210900');
insert into AREA (id, aid, aname, cid)
values (534, '210911', '细河区', '210900');
insert into AREA (id, aid, aname, cid)
values (535, '210921', '阜新蒙古族自治县', '210900');
insert into AREA (id, aid, aname, cid)
values (536, '210922', '彰武县', '210900');
insert into AREA (id, aid, aname, cid)
values (537, '211001', '市辖区', '211000');
insert into AREA (id, aid, aname, cid)
values (538, '211002', '白塔区', '211000');
insert into AREA (id, aid, aname, cid)
values (539, '211003', '文圣区', '211000');
insert into AREA (id, aid, aname, cid)
values (540, '211004', '宏伟区', '211000');
insert into AREA (id, aid, aname, cid)
values (541, '211005', '弓长岭区', '211000');
insert into AREA (id, aid, aname, cid)
values (542, '211011', '太子河区', '211000');
insert into AREA (id, aid, aname, cid)
values (543, '211021', '辽阳县', '211000');
insert into AREA (id, aid, aname, cid)
values (544, '211081', '灯塔市', '211000');
insert into AREA (id, aid, aname, cid)
values (545, '211101', '市辖区', '211100');
insert into AREA (id, aid, aname, cid)
values (546, '211102', '双台子区', '211100');
insert into AREA (id, aid, aname, cid)
values (547, '211103', '兴隆台区', '211100');
insert into AREA (id, aid, aname, cid)
values (548, '211121', '大洼县', '211100');
insert into AREA (id, aid, aname, cid)
values (549, '211122', '盘山县', '211100');
insert into AREA (id, aid, aname, cid)
values (550, '211201', '市辖区', '211200');
insert into AREA (id, aid, aname, cid)
values (551, '211202', '银州区', '211200');
insert into AREA (id, aid, aname, cid)
values (552, '211204', '清河区', '211200');
insert into AREA (id, aid, aname, cid)
values (553, '211221', '铁岭县', '211200');
insert into AREA (id, aid, aname, cid)
values (554, '211223', '西丰县', '211200');
insert into AREA (id, aid, aname, cid)
values (555, '211224', '昌图县', '211200');
insert into AREA (id, aid, aname, cid)
values (556, '211281', '调兵山市', '211200');
insert into AREA (id, aid, aname, cid)
values (557, '211282', '开原市', '211200');
insert into AREA (id, aid, aname, cid)
values (558, '211301', '市辖区', '211300');
insert into AREA (id, aid, aname, cid)
values (559, '211302', '双塔区', '211300');
insert into AREA (id, aid, aname, cid)
values (560, '211303', '龙城区', '211300');
insert into AREA (id, aid, aname, cid)
values (561, '211321', '朝阳县', '211300');
insert into AREA (id, aid, aname, cid)
values (562, '211322', '建平县', '211300');
insert into AREA (id, aid, aname, cid)
values (563, '211324', '喀喇沁左翼蒙古族自治县', '211300');
insert into AREA (id, aid, aname, cid)
values (564, '211381', '北票市', '211300');
insert into AREA (id, aid, aname, cid)
values (565, '211382', '凌源市', '211300');
insert into AREA (id, aid, aname, cid)
values (566, '211401', '市辖区', '211400');
insert into AREA (id, aid, aname, cid)
values (567, '211402', '连山区', '211400');
insert into AREA (id, aid, aname, cid)
values (568, '211403', '龙港区', '211400');
insert into AREA (id, aid, aname, cid)
values (569, '211404', '南票区', '211400');
insert into AREA (id, aid, aname, cid)
values (570, '211421', '绥中县', '211400');
insert into AREA (id, aid, aname, cid)
values (571, '211422', '建昌县', '211400');
insert into AREA (id, aid, aname, cid)
values (572, '211481', '兴城市', '211400');
insert into AREA (id, aid, aname, cid)
values (573, '220101', '市辖区', '220100');
insert into AREA (id, aid, aname, cid)
values (574, '220102', '南关区', '220100');
insert into AREA (id, aid, aname, cid)
values (575, '220103', '宽城区', '220100');
commit;
prompt 100 records committed...
insert into AREA (id, aid, aname, cid)
values (576, '220104', '朝阳区', '220100');
insert into AREA (id, aid, aname, cid)
values (577, '220105', '二道区', '220100');
insert into AREA (id, aid, aname, cid)
values (578, '220106', '绿园区', '220100');
insert into AREA (id, aid, aname, cid)
values (579, '220112', '双阳区', '220100');
insert into AREA (id, aid, aname, cid)
values (580, '220122', '农安县', '220100');
insert into AREA (id, aid, aname, cid)
values (581, '220181', '九台市', '220100');
insert into AREA (id, aid, aname, cid)
values (582, '220182', '榆树市', '220100');
insert into AREA (id, aid, aname, cid)
values (583, '220183', '德惠市', '220100');
insert into AREA (id, aid, aname, cid)
values (584, '220201', '市辖区', '220200');
insert into AREA (id, aid, aname, cid)
values (585, '220202', '昌邑区', '220200');
insert into AREA (id, aid, aname, cid)
values (586, '220203', '龙潭区', '220200');
insert into AREA (id, aid, aname, cid)
values (587, '220204', '船营区', '220200');
insert into AREA (id, aid, aname, cid)
values (588, '220211', '丰满区', '220200');
insert into AREA (id, aid, aname, cid)
values (589, '220221', '永吉县', '220200');
insert into AREA (id, aid, aname, cid)
values (590, '220281', '蛟河市', '220200');
insert into AREA (id, aid, aname, cid)
values (591, '220282', '桦甸市', '220200');
insert into AREA (id, aid, aname, cid)
values (592, '220283', '舒兰市', '220200');
insert into AREA (id, aid, aname, cid)
values (593, '220284', '磐石市', '220200');
insert into AREA (id, aid, aname, cid)
values (594, '220301', '市辖区', '220300');
insert into AREA (id, aid, aname, cid)
values (595, '220302', '铁西区', '220300');
insert into AREA (id, aid, aname, cid)
values (596, '220303', '铁东区', '220300');
insert into AREA (id, aid, aname, cid)
values (597, '220322', '梨树县', '220300');
insert into AREA (id, aid, aname, cid)
values (598, '220323', '伊通满族自治县', '220300');
insert into AREA (id, aid, aname, cid)
values (599, '220381', '公主岭市', '220300');
insert into AREA (id, aid, aname, cid)
values (600, '220382', '双辽市', '220300');
insert into AREA (id, aid, aname, cid)
values (601, '220401', '市辖区', '220400');
insert into AREA (id, aid, aname, cid)
values (602, '220402', '龙山区', '220400');
insert into AREA (id, aid, aname, cid)
values (603, '220403', '西安区', '220400');
insert into AREA (id, aid, aname, cid)
values (604, '220421', '东丰县', '220400');
insert into AREA (id, aid, aname, cid)
values (605, '220422', '东辽县', '220400');
insert into AREA (id, aid, aname, cid)
values (606, '220501', '市辖区', '220500');
insert into AREA (id, aid, aname, cid)
values (607, '220502', '东昌区', '220500');
insert into AREA (id, aid, aname, cid)
values (608, '220503', '二道江区', '220500');
insert into AREA (id, aid, aname, cid)
values (609, '220521', '通化县', '220500');
insert into AREA (id, aid, aname, cid)
values (610, '220523', '辉南县', '220500');
insert into AREA (id, aid, aname, cid)
values (611, '220524', '柳河县', '220500');
insert into AREA (id, aid, aname, cid)
values (612, '220581', '梅河口市', '220500');
insert into AREA (id, aid, aname, cid)
values (613, '220582', '集安市', '220500');
insert into AREA (id, aid, aname, cid)
values (614, '220601', '市辖区', '220600');
insert into AREA (id, aid, aname, cid)
values (615, '220602', '八道江区', '220600');
insert into AREA (id, aid, aname, cid)
values (616, '220621', '抚松县', '220600');
insert into AREA (id, aid, aname, cid)
values (617, '220622', '靖宇县', '220600');
insert into AREA (id, aid, aname, cid)
values (618, '220623', '长白朝鲜族自治县', '220600');
insert into AREA (id, aid, aname, cid)
values (619, '220625', '江源县', '220600');
insert into AREA (id, aid, aname, cid)
values (620, '220681', '临江市', '220600');
insert into AREA (id, aid, aname, cid)
values (621, '220701', '市辖区', '220700');
insert into AREA (id, aid, aname, cid)
values (622, '220702', '宁江区', '220700');
insert into AREA (id, aid, aname, cid)
values (623, '220721', '前郭尔罗斯蒙古族自治县', '220700');
insert into AREA (id, aid, aname, cid)
values (624, '220722', '长岭县', '220700');
insert into AREA (id, aid, aname, cid)
values (625, '220723', '乾安县', '220700');
insert into AREA (id, aid, aname, cid)
values (626, '220724', '扶余县', '220700');
insert into AREA (id, aid, aname, cid)
values (627, '220801', '市辖区', '220800');
insert into AREA (id, aid, aname, cid)
values (628, '220802', '洮北区', '220800');
insert into AREA (id, aid, aname, cid)
values (629, '220821', '镇赉县', '220800');
insert into AREA (id, aid, aname, cid)
values (630, '220822', '通榆县', '220800');
insert into AREA (id, aid, aname, cid)
values (631, '220881', '洮南市', '220800');
insert into AREA (id, aid, aname, cid)
values (632, '220882', '大安市', '220800');
insert into AREA (id, aid, aname, cid)
values (633, '222401', '延吉市', '222400');
insert into AREA (id, aid, aname, cid)
values (634, '222402', '图们市', '222400');
insert into AREA (id, aid, aname, cid)
values (635, '222403', '敦化市', '222400');
insert into AREA (id, aid, aname, cid)
values (636, '222404', '珲春市', '222400');
insert into AREA (id, aid, aname, cid)
values (637, '222405', '龙井市', '222400');
insert into AREA (id, aid, aname, cid)
values (638, '222406', '和龙市', '222400');
insert into AREA (id, aid, aname, cid)
values (639, '222424', '汪清县', '222400');
insert into AREA (id, aid, aname, cid)
values (640, '222426', '安图县', '222400');
insert into AREA (id, aid, aname, cid)
values (641, '230101', '市辖区', '230100');
insert into AREA (id, aid, aname, cid)
values (642, '230102', '道里区', '230100');
insert into AREA (id, aid, aname, cid)
values (643, '230103', '南岗区', '230100');
insert into AREA (id, aid, aname, cid)
values (644, '230104', '道外区', '230100');
insert into AREA (id, aid, aname, cid)
values (645, '230106', '香坊区', '230100');
insert into AREA (id, aid, aname, cid)
values (646, '230107', '动力区', '230100');
insert into AREA (id, aid, aname, cid)
values (647, '230108', '平房区', '230100');
insert into AREA (id, aid, aname, cid)
values (648, '230109', '松北区', '230100');
insert into AREA (id, aid, aname, cid)
values (649, '230111', '呼兰区', '230100');
insert into AREA (id, aid, aname, cid)
values (650, '230123', '依兰县', '230100');
insert into AREA (id, aid, aname, cid)
values (651, '230124', '方正县', '230100');
insert into AREA (id, aid, aname, cid)
values (652, '230125', '宾　县', '230100');
insert into AREA (id, aid, aname, cid)
values (653, '230126', '巴彦县', '230100');
insert into AREA (id, aid, aname, cid)
values (654, '230127', '木兰县', '230100');
insert into AREA (id, aid, aname, cid)
values (655, '230128', '通河县', '230100');
insert into AREA (id, aid, aname, cid)
values (656, '230129', '延寿县', '230100');
insert into AREA (id, aid, aname, cid)
values (657, '230181', '阿城市', '230100');
insert into AREA (id, aid, aname, cid)
values (658, '230182', '双城市', '230100');
insert into AREA (id, aid, aname, cid)
values (659, '230183', '尚志市', '230100');
insert into AREA (id, aid, aname, cid)
values (660, '230184', '五常市', '230100');
insert into AREA (id, aid, aname, cid)
values (661, '230201', '市辖区', '230200');
insert into AREA (id, aid, aname, cid)
values (662, '230202', '龙沙区', '230200');
insert into AREA (id, aid, aname, cid)
values (663, '230203', '建华区', '230200');
insert into AREA (id, aid, aname, cid)
values (664, '230204', '铁锋区', '230200');
insert into AREA (id, aid, aname, cid)
values (665, '230205', '昂昂溪区', '230200');
insert into AREA (id, aid, aname, cid)
values (666, '230206', '富拉尔基区', '230200');
insert into AREA (id, aid, aname, cid)
values (667, '230207', '碾子山区', '230200');
insert into AREA (id, aid, aname, cid)
values (668, '230208', '梅里斯达斡尔族区', '230200');
insert into AREA (id, aid, aname, cid)
values (669, '230221', '龙江县', '230200');
insert into AREA (id, aid, aname, cid)
values (670, '230223', '依安县', '230200');
insert into AREA (id, aid, aname, cid)
values (671, '230224', '泰来县', '230200');
insert into AREA (id, aid, aname, cid)
values (672, '230225', '甘南县', '230200');
insert into AREA (id, aid, aname, cid)
values (673, '230227', '富裕县', '230200');
insert into AREA (id, aid, aname, cid)
values (674, '230229', '克山县', '230200');
insert into AREA (id, aid, aname, cid)
values (675, '230230', '克东县', '230200');
commit;
prompt 200 records committed...
insert into AREA (id, aid, aname, cid)
values (676, '230231', '拜泉县', '230200');
insert into AREA (id, aid, aname, cid)
values (677, '230281', '讷河市', '230200');
insert into AREA (id, aid, aname, cid)
values (678, '230301', '市辖区', '230300');
insert into AREA (id, aid, aname, cid)
values (679, '230302', '鸡冠区', '230300');
insert into AREA (id, aid, aname, cid)
values (680, '230303', '恒山区', '230300');
insert into AREA (id, aid, aname, cid)
values (681, '230304', '滴道区', '230300');
insert into AREA (id, aid, aname, cid)
values (682, '230305', '梨树区', '230300');
insert into AREA (id, aid, aname, cid)
values (683, '230306', '城子河区', '230300');
insert into AREA (id, aid, aname, cid)
values (684, '230307', '麻山区', '230300');
insert into AREA (id, aid, aname, cid)
values (685, '230321', '鸡东县', '230300');
insert into AREA (id, aid, aname, cid)
values (686, '230381', '虎林市', '230300');
insert into AREA (id, aid, aname, cid)
values (687, '230382', '密山市', '230300');
insert into AREA (id, aid, aname, cid)
values (688, '230401', '市辖区', '230400');
insert into AREA (id, aid, aname, cid)
values (689, '230402', '向阳区', '230400');
insert into AREA (id, aid, aname, cid)
values (690, '230403', '工农区', '230400');
insert into AREA (id, aid, aname, cid)
values (691, '230404', '南山区', '230400');
insert into AREA (id, aid, aname, cid)
values (692, '230405', '兴安区', '230400');
insert into AREA (id, aid, aname, cid)
values (693, '230406', '东山区', '230400');
insert into AREA (id, aid, aname, cid)
values (694, '230407', '兴山区', '230400');
insert into AREA (id, aid, aname, cid)
values (695, '230421', '萝北县', '230400');
insert into AREA (id, aid, aname, cid)
values (696, '230422', '绥滨县', '230400');
insert into AREA (id, aid, aname, cid)
values (697, '230501', '市辖区', '230500');
insert into AREA (id, aid, aname, cid)
values (698, '230502', '尖山区', '230500');
insert into AREA (id, aid, aname, cid)
values (699, '230503', '岭东区', '230500');
insert into AREA (id, aid, aname, cid)
values (700, '230505', '四方台区', '230500');
insert into AREA (id, aid, aname, cid)
values (701, '230506', '宝山区', '230500');
insert into AREA (id, aid, aname, cid)
values (702, '230521', '集贤县', '230500');
insert into AREA (id, aid, aname, cid)
values (703, '230522', '友谊县', '230500');
insert into AREA (id, aid, aname, cid)
values (704, '230523', '宝清县', '230500');
insert into AREA (id, aid, aname, cid)
values (705, '230524', '饶河县', '230500');
insert into AREA (id, aid, aname, cid)
values (706, '230601', '市辖区', '230600');
insert into AREA (id, aid, aname, cid)
values (707, '230602', '萨尔图区', '230600');
insert into AREA (id, aid, aname, cid)
values (708, '230603', '龙凤区', '230600');
insert into AREA (id, aid, aname, cid)
values (709, '230604', '让胡路区', '230600');
insert into AREA (id, aid, aname, cid)
values (710, '230605', '红岗区', '230600');
insert into AREA (id, aid, aname, cid)
values (711, '230606', '大同区', '230600');
insert into AREA (id, aid, aname, cid)
values (712, '230621', '肇州县', '230600');
insert into AREA (id, aid, aname, cid)
values (953, '330326', '平阳县', '330300');
insert into AREA (id, aid, aname, cid)
values (954, '330327', '苍南县', '330300');
insert into AREA (id, aid, aname, cid)
values (955, '330328', '文成县', '330300');
insert into AREA (id, aid, aname, cid)
values (956, '330329', '泰顺县', '330300');
insert into AREA (id, aid, aname, cid)
values (957, '330381', '瑞安市', '330300');
insert into AREA (id, aid, aname, cid)
values (958, '330382', '乐清市', '330300');
insert into AREA (id, aid, aname, cid)
values (959, '330401', '市辖区', '330400');
insert into AREA (id, aid, aname, cid)
values (960, '330402', '秀城区', '330400');
insert into AREA (id, aid, aname, cid)
values (961, '330411', '秀洲区', '330400');
insert into AREA (id, aid, aname, cid)
values (962, '330421', '嘉善县', '330400');
insert into AREA (id, aid, aname, cid)
values (963, '330424', '海盐县', '330400');
insert into AREA (id, aid, aname, cid)
values (964, '330481', '海宁市', '330400');
insert into AREA (id, aid, aname, cid)
values (965, '330482', '平湖市', '330400');
insert into AREA (id, aid, aname, cid)
values (966, '330483', '桐乡市', '330400');
insert into AREA (id, aid, aname, cid)
values (967, '330501', '市辖区', '330500');
insert into AREA (id, aid, aname, cid)
values (968, '330502', '吴兴区', '330500');
insert into AREA (id, aid, aname, cid)
values (969, '330503', '南浔区', '330500');
insert into AREA (id, aid, aname, cid)
values (970, '330521', '德清县', '330500');
insert into AREA (id, aid, aname, cid)
values (971, '330522', '长兴县', '330500');
insert into AREA (id, aid, aname, cid)
values (972, '330523', '安吉县', '330500');
insert into AREA (id, aid, aname, cid)
values (973, '330601', '市辖区', '330600');
insert into AREA (id, aid, aname, cid)
values (974, '330602', '越城区', '330600');
insert into AREA (id, aid, aname, cid)
values (975, '330621', '绍兴县', '330600');
insert into AREA (id, aid, aname, cid)
values (976, '330624', '新昌县', '330600');
insert into AREA (id, aid, aname, cid)
values (977, '330681', '诸暨市', '330600');
insert into AREA (id, aid, aname, cid)
values (978, '330682', '上虞市', '330600');
insert into AREA (id, aid, aname, cid)
values (979, '330683', '嵊州市', '330600');
insert into AREA (id, aid, aname, cid)
values (980, '330701', '市辖区', '330700');
insert into AREA (id, aid, aname, cid)
values (981, '330702', '婺城区', '330700');
insert into AREA (id, aid, aname, cid)
values (982, '330703', '金东区', '330700');
insert into AREA (id, aid, aname, cid)
values (983, '330723', '武义县', '330700');
insert into AREA (id, aid, aname, cid)
values (984, '330726', '浦江县', '330700');
insert into AREA (id, aid, aname, cid)
values (985, '330727', '磐安县', '330700');
insert into AREA (id, aid, aname, cid)
values (986, '330781', '兰溪市', '330700');
insert into AREA (id, aid, aname, cid)
values (987, '330782', '义乌市', '330700');
insert into AREA (id, aid, aname, cid)
values (988, '330783', '东阳市', '330700');
insert into AREA (id, aid, aname, cid)
values (989, '330784', '永康市', '330700');
insert into AREA (id, aid, aname, cid)
values (990, '330801', '市辖区', '330800');
insert into AREA (id, aid, aname, cid)
values (991, '330802', '柯城区', '330800');
insert into AREA (id, aid, aname, cid)
values (992, '330803', '衢江区', '330800');
insert into AREA (id, aid, aname, cid)
values (993, '330822', '常山县', '330800');
insert into AREA (id, aid, aname, cid)
values (994, '330824', '开化县', '330800');
insert into AREA (id, aid, aname, cid)
values (995, '330825', '龙游县', '330800');
insert into AREA (id, aid, aname, cid)
values (996, '330881', '江山市', '330800');
insert into AREA (id, aid, aname, cid)
values (997, '330901', '市辖区', '330900');
insert into AREA (id, aid, aname, cid)
values (998, '330902', '定海区', '330900');
insert into AREA (id, aid, aname, cid)
values (999, '330903', '普陀区', '330900');
insert into AREA (id, aid, aname, cid)
values (1000, '330921', '岱山县', '330900');
insert into AREA (id, aid, aname, cid)
values (1001, '330922', '嵊泗县', '330900');
insert into AREA (id, aid, aname, cid)
values (1002, '331001', '市辖区', '331000');
insert into AREA (id, aid, aname, cid)
values (1003, '331002', '椒江区', '331000');
insert into AREA (id, aid, aname, cid)
values (1004, '331003', '黄岩区', '331000');
insert into AREA (id, aid, aname, cid)
values (1005, '331004', '路桥区', '331000');
insert into AREA (id, aid, aname, cid)
values (1006, '331021', '玉环县', '331000');
insert into AREA (id, aid, aname, cid)
values (1007, '331022', '三门县', '331000');
insert into AREA (id, aid, aname, cid)
values (1008, '331023', '天台县', '331000');
insert into AREA (id, aid, aname, cid)
values (1009, '331024', '仙居县', '331000');
insert into AREA (id, aid, aname, cid)
values (1010, '331081', '温岭市', '331000');
insert into AREA (id, aid, aname, cid)
values (1011, '331082', '临海市', '331000');
insert into AREA (id, aid, aname, cid)
values (1012, '331101', '市辖区', '331100');
insert into AREA (id, aid, aname, cid)
values (1013, '331102', '莲都区', '331100');
insert into AREA (id, aid, aname, cid)
values (1014, '331121', '青田县', '331100');
insert into AREA (id, aid, aname, cid)
values (1015, '331122', '缙云县', '331100');
commit;
prompt 300 records committed...
insert into AREA (id, aid, aname, cid)
values (1016, '331123', '遂昌县', '331100');
insert into AREA (id, aid, aname, cid)
values (1017, '331124', '松阳县', '331100');
insert into AREA (id, aid, aname, cid)
values (1018, '331125', '云和县', '331100');
insert into AREA (id, aid, aname, cid)
values (1019, '331126', '庆元县', '331100');
insert into AREA (id, aid, aname, cid)
values (1020, '331127', '景宁畲族自治县', '331100');
insert into AREA (id, aid, aname, cid)
values (1021, '331181', '龙泉市', '331100');
insert into AREA (id, aid, aname, cid)
values (1022, '340101', '市辖区', '340100');
insert into AREA (id, aid, aname, cid)
values (1023, '340102', '瑶海区', '340100');
insert into AREA (id, aid, aname, cid)
values (1024, '340103', '庐阳区', '340100');
insert into AREA (id, aid, aname, cid)
values (1025, '340104', '蜀山区', '340100');
insert into AREA (id, aid, aname, cid)
values (1026, '340111', '包河区', '340100');
insert into AREA (id, aid, aname, cid)
values (1027, '340121', '长丰县', '340100');
insert into AREA (id, aid, aname, cid)
values (1028, '340122', '肥东县', '340100');
insert into AREA (id, aid, aname, cid)
values (1029, '340123', '肥西县', '340100');
insert into AREA (id, aid, aname, cid)
values (1030, '340201', '市辖区', '340200');
insert into AREA (id, aid, aname, cid)
values (1031, '340202', '镜湖区', '340200');
insert into AREA (id, aid, aname, cid)
values (1032, '340203', '马塘区', '340200');
insert into AREA (id, aid, aname, cid)
values (1033, '340204', '新芜区', '340200');
insert into AREA (id, aid, aname, cid)
values (1034, '340207', '鸠江区', '340200');
insert into AREA (id, aid, aname, cid)
values (1035, '340221', '芜湖县', '340200');
insert into AREA (id, aid, aname, cid)
values (1036, '340222', '繁昌县', '340200');
insert into AREA (id, aid, aname, cid)
values (1037, '340223', '南陵县', '340200');
insert into AREA (id, aid, aname, cid)
values (1038, '340301', '市辖区', '340300');
insert into AREA (id, aid, aname, cid)
values (1039, '340302', '龙子湖区', '340300');
insert into AREA (id, aid, aname, cid)
values (1040, '340303', '蚌山区', '340300');
insert into AREA (id, aid, aname, cid)
values (1041, '340304', '禹会区', '340300');
insert into AREA (id, aid, aname, cid)
values (1042, '340311', '淮上区', '340300');
insert into AREA (id, aid, aname, cid)
values (1043, '340321', '怀远县', '340300');
insert into AREA (id, aid, aname, cid)
values (1044, '340322', '五河县', '340300');
insert into AREA (id, aid, aname, cid)
values (1045, '340323', '固镇县', '340300');
insert into AREA (id, aid, aname, cid)
values (1046, '340401', '市辖区', '340400');
insert into AREA (id, aid, aname, cid)
values (1047, '340402', '大通区', '340400');
insert into AREA (id, aid, aname, cid)
values (1048, '340403', '田家庵区', '340400');
insert into AREA (id, aid, aname, cid)
values (1049, '340404', '谢家集区', '340400');
insert into AREA (id, aid, aname, cid)
values (1050, '340405', '八公山区', '340400');
insert into AREA (id, aid, aname, cid)
values (1051, '340406', '潘集区', '340400');
insert into AREA (id, aid, aname, cid)
values (1052, '340421', '凤台县', '340400');
insert into AREA (id, aid, aname, cid)
values (1053, '340501', '市辖区', '340500');
insert into AREA (id, aid, aname, cid)
values (1054, '340502', '金家庄区', '340500');
insert into AREA (id, aid, aname, cid)
values (1055, '340503', '花山区', '340500');
insert into AREA (id, aid, aname, cid)
values (1056, '340504', '雨山区', '340500');
insert into AREA (id, aid, aname, cid)
values (1057, '340521', '当涂县', '340500');
insert into AREA (id, aid, aname, cid)
values (1058, '340601', '市辖区', '340600');
insert into AREA (id, aid, aname, cid)
values (1059, '340602', '杜集区', '340600');
insert into AREA (id, aid, aname, cid)
values (1060, '340603', '相山区', '340600');
insert into AREA (id, aid, aname, cid)
values (1061, '340604', '烈山区', '340600');
insert into AREA (id, aid, aname, cid)
values (1062, '340621', '濉溪县', '340600');
insert into AREA (id, aid, aname, cid)
values (1063, '340701', '市辖区', '340700');
insert into AREA (id, aid, aname, cid)
values (1064, '340702', '铜官山区', '340700');
insert into AREA (id, aid, aname, cid)
values (1065, '340703', '狮子山区', '340700');
insert into AREA (id, aid, aname, cid)
values (1066, '340711', '郊　区', '340700');
insert into AREA (id, aid, aname, cid)
values (1067, '340721', '铜陵县', '340700');
insert into AREA (id, aid, aname, cid)
values (1068, '340801', '市辖区', '340800');
insert into AREA (id, aid, aname, cid)
values (1069, '340802', '迎江区', '340800');
insert into AREA (id, aid, aname, cid)
values (1070, '340803', '大观区', '340800');
insert into AREA (id, aid, aname, cid)
values (1071, '340811', '郊　区', '340800');
insert into AREA (id, aid, aname, cid)
values (1072, '340822', '怀宁县', '340800');
insert into AREA (id, aid, aname, cid)
values (1073, '340823', '枞阳县', '340800');
insert into AREA (id, aid, aname, cid)
values (1074, '340824', '潜山县', '340800');
insert into AREA (id, aid, aname, cid)
values (1075, '340825', '太湖县', '340800');
insert into AREA (id, aid, aname, cid)
values (1076, '340826', '宿松县', '340800');
insert into AREA (id, aid, aname, cid)
values (1077, '340827', '望江县', '340800');
insert into AREA (id, aid, aname, cid)
values (1078, '340828', '岳西县', '340800');
insert into AREA (id, aid, aname, cid)
values (1079, '340881', '桐城市', '340800');
insert into AREA (id, aid, aname, cid)
values (1080, '341001', '市辖区', '341000');
insert into AREA (id, aid, aname, cid)
values (1081, '341002', '屯溪区', '341000');
insert into AREA (id, aid, aname, cid)
values (1082, '341003', '黄山区', '341000');
insert into AREA (id, aid, aname, cid)
values (1083, '341004', '徽州区', '341000');
insert into AREA (id, aid, aname, cid)
values (1084, '341021', '歙　县', '341000');
insert into AREA (id, aid, aname, cid)
values (1085, '341022', '休宁县', '341000');
insert into AREA (id, aid, aname, cid)
values (1086, '341023', '黟　县', '341000');
insert into AREA (id, aid, aname, cid)
values (1087, '341024', '祁门县', '341000');
insert into AREA (id, aid, aname, cid)
values (1088, '341101', '市辖区', '341100');
insert into AREA (id, aid, aname, cid)
values (1089, '341102', '琅琊区', '341100');
insert into AREA (id, aid, aname, cid)
values (1090, '341103', '南谯区', '341100');
insert into AREA (id, aid, aname, cid)
values (1091, '341122', '来安县', '341100');
insert into AREA (id, aid, aname, cid)
values (1092, '341124', '全椒县', '341100');
insert into AREA (id, aid, aname, cid)
values (1093, '341125', '定远县', '341100');
insert into AREA (id, aid, aname, cid)
values (1094, '341126', '凤阳县', '341100');
insert into AREA (id, aid, aname, cid)
values (1095, '341181', '天长市', '341100');
insert into AREA (id, aid, aname, cid)
values (1096, '341182', '明光市', '341100');
insert into AREA (id, aid, aname, cid)
values (1097, '341201', '市辖区', '341200');
insert into AREA (id, aid, aname, cid)
values (1098, '341202', '颍州区', '341200');
insert into AREA (id, aid, aname, cid)
values (1099, '341203', '颍东区', '341200');
insert into AREA (id, aid, aname, cid)
values (1100, '341204', '颍泉区', '341200');
insert into AREA (id, aid, aname, cid)
values (1101, '341221', '临泉县', '341200');
insert into AREA (id, aid, aname, cid)
values (1102, '341222', '太和县', '341200');
insert into AREA (id, aid, aname, cid)
values (1103, '341225', '阜南县', '341200');
insert into AREA (id, aid, aname, cid)
values (1104, '341226', '颍上县', '341200');
insert into AREA (id, aid, aname, cid)
values (1105, '341282', '界首市', '341200');
insert into AREA (id, aid, aname, cid)
values (1106, '341301', '市辖区', '341300');
insert into AREA (id, aid, aname, cid)
values (1107, '341302', '墉桥区', '341300');
insert into AREA (id, aid, aname, cid)
values (1108, '341321', '砀山县', '341300');
insert into AREA (id, aid, aname, cid)
values (1109, '341322', '萧　县', '341300');
insert into AREA (id, aid, aname, cid)
values (1110, '341323', '灵璧县', '341300');
insert into AREA (id, aid, aname, cid)
values (1111, '341324', '泗　县', '341300');
insert into AREA (id, aid, aname, cid)
values (1112, '341401', '市辖区', '341400');
insert into AREA (id, aid, aname, cid)
values (1113, '341402', '居巢区', '341400');
insert into AREA (id, aid, aname, cid)
values (1114, '341421', '庐江县', '341400');
insert into AREA (id, aid, aname, cid)
values (1115, '341422', '无为县', '341400');
commit;
prompt 400 records committed...
insert into AREA (id, aid, aname, cid)
values (1116, '341423', '含山县', '341400');
insert into AREA (id, aid, aname, cid)
values (1117, '341424', '和　县', '341400');
insert into AREA (id, aid, aname, cid)
values (1118, '341501', '市辖区', '341500');
insert into AREA (id, aid, aname, cid)
values (1119, '341502', '金安区', '341500');
insert into AREA (id, aid, aname, cid)
values (1120, '341503', '裕安区', '341500');
insert into AREA (id, aid, aname, cid)
values (1121, '341521', '寿　县', '341500');
insert into AREA (id, aid, aname, cid)
values (1122, '341522', '霍邱县', '341500');
insert into AREA (id, aid, aname, cid)
values (1123, '341523', '舒城县', '341500');
insert into AREA (id, aid, aname, cid)
values (1124, '341524', '金寨县', '341500');
insert into AREA (id, aid, aname, cid)
values (1125, '341525', '霍山县', '341500');
insert into AREA (id, aid, aname, cid)
values (1126, '341601', '市辖区', '341600');
insert into AREA (id, aid, aname, cid)
values (1127, '341602', '谯城区', '341600');
insert into AREA (id, aid, aname, cid)
values (1128, '341621', '涡阳县', '341600');
insert into AREA (id, aid, aname, cid)
values (1129, '341622', '蒙城县', '341600');
insert into AREA (id, aid, aname, cid)
values (1130, '341623', '利辛县', '341600');
insert into AREA (id, aid, aname, cid)
values (1131, '341701', '市辖区', '341700');
insert into AREA (id, aid, aname, cid)
values (1132, '341702', '贵池区', '341700');
insert into AREA (id, aid, aname, cid)
values (1133, '341721', '东至县', '341700');
insert into AREA (id, aid, aname, cid)
values (1134, '341722', '石台县', '341700');
insert into AREA (id, aid, aname, cid)
values (1135, '341723', '青阳县', '341700');
insert into AREA (id, aid, aname, cid)
values (1136, '341801', '市辖区', '341800');
insert into AREA (id, aid, aname, cid)
values (1137, '341802', '宣州区', '341800');
insert into AREA (id, aid, aname, cid)
values (1138, '341821', '郎溪县', '341800');
insert into AREA (id, aid, aname, cid)
values (1139, '341822', '广德县', '341800');
insert into AREA (id, aid, aname, cid)
values (1140, '341823', '泾　县', '341800');
insert into AREA (id, aid, aname, cid)
values (1141, '341824', '绩溪县', '341800');
insert into AREA (id, aid, aname, cid)
values (1142, '341825', '旌德县', '341800');
insert into AREA (id, aid, aname, cid)
values (1143, '341881', '宁国市', '341800');
insert into AREA (id, aid, aname, cid)
values (1144, '350101', '市辖区', '350100');
insert into AREA (id, aid, aname, cid)
values (1145, '350102', '鼓楼区', '350100');
insert into AREA (id, aid, aname, cid)
values (1146, '350103', '台江区', '350100');
insert into AREA (id, aid, aname, cid)
values (1147, '350104', '仓山区', '350100');
insert into AREA (id, aid, aname, cid)
values (1148, '350105', '马尾区', '350100');
insert into AREA (id, aid, aname, cid)
values (1149, '350111', '晋安区', '350100');
insert into AREA (id, aid, aname, cid)
values (1150, '350121', '闽侯县', '350100');
insert into AREA (id, aid, aname, cid)
values (1151, '350122', '连江县', '350100');
insert into AREA (id, aid, aname, cid)
values (1152, '350123', '罗源县', '350100');
insert into AREA (id, aid, aname, cid)
values (1153, '350124', '闽清县', '350100');
insert into AREA (id, aid, aname, cid)
values (1154, '350125', '永泰县', '350100');
insert into AREA (id, aid, aname, cid)
values (1155, '350128', '平潭县', '350100');
insert into AREA (id, aid, aname, cid)
values (1156, '350181', '福清市', '350100');
insert into AREA (id, aid, aname, cid)
values (1157, '350182', '长乐市', '350100');
insert into AREA (id, aid, aname, cid)
values (1158, '350201', '市辖区', '350200');
insert into AREA (id, aid, aname, cid)
values (1159, '350203', '思明区', '350200');
insert into AREA (id, aid, aname, cid)
values (1160, '350205', '海沧区', '350200');
insert into AREA (id, aid, aname, cid)
values (1161, '350206', '湖里区', '350200');
insert into AREA (id, aid, aname, cid)
values (1162, '350211', '集美区', '350200');
insert into AREA (id, aid, aname, cid)
values (1163, '350212', '同安区', '350200');
insert into AREA (id, aid, aname, cid)
values (1164, '350213', '翔安区', '350200');
insert into AREA (id, aid, aname, cid)
values (1165, '350301', '市辖区', '350300');
insert into AREA (id, aid, aname, cid)
values (1166, '350302', '城厢区', '350300');
insert into AREA (id, aid, aname, cid)
values (1167, '350303', '涵江区', '350300');
insert into AREA (id, aid, aname, cid)
values (1168, '350304', '荔城区', '350300');
insert into AREA (id, aid, aname, cid)
values (1169, '350305', '秀屿区', '350300');
insert into AREA (id, aid, aname, cid)
values (1170, '350322', '仙游县', '350300');
insert into AREA (id, aid, aname, cid)
values (1171, '350401', '市辖区', '350400');
insert into AREA (id, aid, aname, cid)
values (1172, '350402', '梅列区', '350400');
insert into AREA (id, aid, aname, cid)
values (1173, '350403', '三元区', '350400');
insert into AREA (id, aid, aname, cid)
values (1174, '350421', '明溪县', '350400');
insert into AREA (id, aid, aname, cid)
values (1175, '350423', '清流县', '350400');
insert into AREA (id, aid, aname, cid)
values (1176, '350424', '宁化县', '350400');
insert into AREA (id, aid, aname, cid)
values (1177, '350425', '大田县', '350400');
insert into AREA (id, aid, aname, cid)
values (1178, '350426', '尤溪县', '350400');
insert into AREA (id, aid, aname, cid)
values (1179, '350427', '沙　县', '350400');
insert into AREA (id, aid, aname, cid)
values (1180, '350428', '将乐县', '350400');
insert into AREA (id, aid, aname, cid)
values (1181, '350429', '泰宁县', '350400');
insert into AREA (id, aid, aname, cid)
values (1182, '350430', '建宁县', '350400');
insert into AREA (id, aid, aname, cid)
values (1183, '350481', '永安市', '350400');
insert into AREA (id, aid, aname, cid)
values (1184, '350501', '市辖区', '350500');
insert into AREA (id, aid, aname, cid)
values (1185, '350502', '鲤城区', '350500');
insert into AREA (id, aid, aname, cid)
values (1186, '350503', '丰泽区', '350500');
insert into AREA (id, aid, aname, cid)
values (1187, '350504', '洛江区', '350500');
insert into AREA (id, aid, aname, cid)
values (1188, '350505', '泉港区', '350500');
insert into AREA (id, aid, aname, cid)
values (1189, '350521', '惠安县', '350500');
insert into AREA (id, aid, aname, cid)
values (1190, '350524', '安溪县', '350500');
insert into AREA (id, aid, aname, cid)
values (1191, '350525', '永春县', '350500');
insert into AREA (id, aid, aname, cid)
values (1192, '350526', '德化县', '350500');
insert into AREA (id, aid, aname, cid)
values (713, '230622', '肇源县', '230600');
insert into AREA (id, aid, aname, cid)
values (714, '230623', '林甸县', '230600');
insert into AREA (id, aid, aname, cid)
values (715, '230624', '杜尔伯特蒙古族自治县', '230600');
insert into AREA (id, aid, aname, cid)
values (716, '230701', '市辖区', '230700');
insert into AREA (id, aid, aname, cid)
values (717, '230702', '伊春区', '230700');
insert into AREA (id, aid, aname, cid)
values (718, '230703', '南岔区', '230700');
insert into AREA (id, aid, aname, cid)
values (719, '230704', '友好区', '230700');
insert into AREA (id, aid, aname, cid)
values (720, '230705', '西林区', '230700');
insert into AREA (id, aid, aname, cid)
values (721, '230706', '翠峦区', '230700');
insert into AREA (id, aid, aname, cid)
values (722, '230707', '新青区', '230700');
insert into AREA (id, aid, aname, cid)
values (723, '230708', '美溪区', '230700');
insert into AREA (id, aid, aname, cid)
values (724, '230709', '金山屯区', '230700');
insert into AREA (id, aid, aname, cid)
values (725, '230710', '五营区', '230700');
insert into AREA (id, aid, aname, cid)
values (726, '230711', '乌马河区', '230700');
insert into AREA (id, aid, aname, cid)
values (727, '230712', '汤旺河区', '230700');
insert into AREA (id, aid, aname, cid)
values (728, '230713', '带岭区', '230700');
insert into AREA (id, aid, aname, cid)
values (729, '230714', '乌伊岭区', '230700');
insert into AREA (id, aid, aname, cid)
values (730, '230715', '红星区', '230700');
insert into AREA (id, aid, aname, cid)
values (731, '230716', '上甘岭区', '230700');
insert into AREA (id, aid, aname, cid)
values (732, '230722', '嘉荫县', '230700');
insert into AREA (id, aid, aname, cid)
values (733, '230781', '铁力市', '230700');
insert into AREA (id, aid, aname, cid)
values (734, '230801', '市辖区', '230800');
insert into AREA (id, aid, aname, cid)
values (735, '230802', '永红区', '230800');
commit;
prompt 500 records committed...
insert into AREA (id, aid, aname, cid)
values (736, '230803', '向阳区', '230800');
insert into AREA (id, aid, aname, cid)
values (737, '230804', '前进区', '230800');
insert into AREA (id, aid, aname, cid)
values (738, '230805', '东风区', '230800');
insert into AREA (id, aid, aname, cid)
values (739, '230811', '郊　区', '230800');
insert into AREA (id, aid, aname, cid)
values (740, '230822', '桦南县', '230800');
insert into AREA (id, aid, aname, cid)
values (741, '230826', '桦川县', '230800');
insert into AREA (id, aid, aname, cid)
values (742, '230828', '汤原县', '230800');
insert into AREA (id, aid, aname, cid)
values (743, '230833', '抚远县', '230800');
insert into AREA (id, aid, aname, cid)
values (744, '230881', '同江市', '230800');
insert into AREA (id, aid, aname, cid)
values (745, '230882', '富锦市', '230800');
insert into AREA (id, aid, aname, cid)
values (746, '230901', '市辖区', '230900');
insert into AREA (id, aid, aname, cid)
values (747, '230902', '新兴区', '230900');
insert into AREA (id, aid, aname, cid)
values (748, '230903', '桃山区', '230900');
insert into AREA (id, aid, aname, cid)
values (749, '230904', '茄子河区', '230900');
insert into AREA (id, aid, aname, cid)
values (750, '230921', '勃利县', '230900');
insert into AREA (id, aid, aname, cid)
values (751, '231001', '市辖区', '231000');
insert into AREA (id, aid, aname, cid)
values (752, '231002', '东安区', '231000');
insert into AREA (id, aid, aname, cid)
values (753, '231003', '阳明区', '231000');
insert into AREA (id, aid, aname, cid)
values (754, '231004', '爱民区', '231000');
insert into AREA (id, aid, aname, cid)
values (755, '231005', '西安区', '231000');
insert into AREA (id, aid, aname, cid)
values (756, '231024', '东宁县', '231000');
insert into AREA (id, aid, aname, cid)
values (757, '231025', '林口县', '231000');
insert into AREA (id, aid, aname, cid)
values (758, '231081', '绥芬河市', '231000');
insert into AREA (id, aid, aname, cid)
values (759, '231083', '海林市', '231000');
insert into AREA (id, aid, aname, cid)
values (760, '231084', '宁安市', '231000');
insert into AREA (id, aid, aname, cid)
values (761, '231085', '穆棱市', '231000');
insert into AREA (id, aid, aname, cid)
values (762, '231101', '市辖区', '231100');
insert into AREA (id, aid, aname, cid)
values (763, '231102', '爱辉区', '231100');
insert into AREA (id, aid, aname, cid)
values (764, '231121', '嫩江县', '231100');
insert into AREA (id, aid, aname, cid)
values (765, '231123', '逊克县', '231100');
insert into AREA (id, aid, aname, cid)
values (766, '231124', '孙吴县', '231100');
insert into AREA (id, aid, aname, cid)
values (767, '231181', '北安市', '231100');
insert into AREA (id, aid, aname, cid)
values (768, '231182', '五大连池市', '231100');
insert into AREA (id, aid, aname, cid)
values (769, '231201', '市辖区', '231200');
insert into AREA (id, aid, aname, cid)
values (770, '231202', '北林区', '231200');
insert into AREA (id, aid, aname, cid)
values (771, '231221', '望奎县', '231200');
insert into AREA (id, aid, aname, cid)
values (772, '231222', '兰西县', '231200');
insert into AREA (id, aid, aname, cid)
values (773, '231223', '青冈县', '231200');
insert into AREA (id, aid, aname, cid)
values (774, '231224', '庆安县', '231200');
insert into AREA (id, aid, aname, cid)
values (775, '231225', '明水县', '231200');
insert into AREA (id, aid, aname, cid)
values (776, '231226', '绥棱县', '231200');
insert into AREA (id, aid, aname, cid)
values (777, '231281', '安达市', '231200');
insert into AREA (id, aid, aname, cid)
values (778, '231282', '肇东市', '231200');
insert into AREA (id, aid, aname, cid)
values (779, '231283', '海伦市', '231200');
insert into AREA (id, aid, aname, cid)
values (780, '232721', '呼玛县', '232700');
insert into AREA (id, aid, aname, cid)
values (781, '232722', '塔河县', '232700');
insert into AREA (id, aid, aname, cid)
values (782, '232723', '漠河县', '232700');
insert into AREA (id, aid, aname, cid)
values (783, '310101', '黄浦区', '310100');
insert into AREA (id, aid, aname, cid)
values (784, '310103', '卢湾区', '310100');
insert into AREA (id, aid, aname, cid)
values (785, '310104', '徐汇区', '310100');
insert into AREA (id, aid, aname, cid)
values (786, '310105', '长宁区', '310100');
insert into AREA (id, aid, aname, cid)
values (787, '310106', '静安区', '310100');
insert into AREA (id, aid, aname, cid)
values (788, '310107', '普陀区', '310100');
insert into AREA (id, aid, aname, cid)
values (789, '310108', '闸北区', '310100');
insert into AREA (id, aid, aname, cid)
values (790, '310109', '虹口区', '310100');
insert into AREA (id, aid, aname, cid)
values (791, '310110', '杨浦区', '310100');
insert into AREA (id, aid, aname, cid)
values (792, '310112', '闵行区', '310100');
insert into AREA (id, aid, aname, cid)
values (793, '310113', '宝山区', '310100');
insert into AREA (id, aid, aname, cid)
values (794, '310114', '嘉定区', '310100');
insert into AREA (id, aid, aname, cid)
values (795, '310115', '浦东新区', '310100');
insert into AREA (id, aid, aname, cid)
values (796, '310116', '金山区', '310100');
insert into AREA (id, aid, aname, cid)
values (797, '310117', '松江区', '310100');
insert into AREA (id, aid, aname, cid)
values (798, '310118', '青浦区', '310100');
insert into AREA (id, aid, aname, cid)
values (799, '310119', '南汇区', '310100');
insert into AREA (id, aid, aname, cid)
values (800, '310120', '奉贤区', '310100');
insert into AREA (id, aid, aname, cid)
values (801, '310230', '崇明县', '310200');
insert into AREA (id, aid, aname, cid)
values (802, '320101', '市辖区', '320100');
insert into AREA (id, aid, aname, cid)
values (803, '320102', '玄武区', '320100');
insert into AREA (id, aid, aname, cid)
values (804, '320103', '白下区', '320100');
insert into AREA (id, aid, aname, cid)
values (805, '320104', '秦淮区', '320100');
insert into AREA (id, aid, aname, cid)
values (806, '320105', '建邺区', '320100');
insert into AREA (id, aid, aname, cid)
values (807, '320106', '鼓楼区', '320100');
insert into AREA (id, aid, aname, cid)
values (808, '320107', '下关区', '320100');
insert into AREA (id, aid, aname, cid)
values (809, '320111', '浦口区', '320100');
insert into AREA (id, aid, aname, cid)
values (810, '320113', '栖霞区', '320100');
insert into AREA (id, aid, aname, cid)
values (811, '320114', '雨花台区', '320100');
insert into AREA (id, aid, aname, cid)
values (812, '320115', '江宁区', '320100');
insert into AREA (id, aid, aname, cid)
values (813, '320116', '六合区', '320100');
insert into AREA (id, aid, aname, cid)
values (814, '320124', '溧水县', '320100');
insert into AREA (id, aid, aname, cid)
values (815, '320125', '高淳县', '320100');
insert into AREA (id, aid, aname, cid)
values (816, '320201', '市辖区', '320200');
insert into AREA (id, aid, aname, cid)
values (817, '320202', '崇安区', '320200');
insert into AREA (id, aid, aname, cid)
values (818, '320203', '南长区', '320200');
insert into AREA (id, aid, aname, cid)
values (819, '320204', '北塘区', '320200');
insert into AREA (id, aid, aname, cid)
values (820, '320205', '锡山区', '320200');
insert into AREA (id, aid, aname, cid)
values (821, '320206', '惠山区', '320200');
insert into AREA (id, aid, aname, cid)
values (822, '320211', '滨湖区', '320200');
insert into AREA (id, aid, aname, cid)
values (823, '320281', '江阴市', '320200');
insert into AREA (id, aid, aname, cid)
values (824, '320282', '宜兴市', '320200');
insert into AREA (id, aid, aname, cid)
values (825, '320301', '市辖区', '320300');
insert into AREA (id, aid, aname, cid)
values (826, '320302', '鼓楼区', '320300');
insert into AREA (id, aid, aname, cid)
values (827, '320303', '云龙区', '320300');
insert into AREA (id, aid, aname, cid)
values (828, '320304', '九里区', '320300');
insert into AREA (id, aid, aname, cid)
values (829, '320305', '贾汪区', '320300');
insert into AREA (id, aid, aname, cid)
values (830, '320311', '泉山区', '320300');
insert into AREA (id, aid, aname, cid)
values (831, '320321', '丰　县', '320300');
insert into AREA (id, aid, aname, cid)
values (832, '320322', '沛　县', '320300');
insert into AREA (id, aid, aname, cid)
values (833, '320323', '铜山县', '320300');
insert into AREA (id, aid, aname, cid)
values (834, '320324', '睢宁县', '320300');
insert into AREA (id, aid, aname, cid)
values (835, '320381', '新沂市', '320300');
commit;
prompt 600 records committed...
insert into AREA (id, aid, aname, cid)
values (836, '320382', '邳州市', '320300');
insert into AREA (id, aid, aname, cid)
values (837, '320401', '市辖区', '320400');
insert into AREA (id, aid, aname, cid)
values (838, '320402', '天宁区', '320400');
insert into AREA (id, aid, aname, cid)
values (839, '320404', '钟楼区', '320400');
insert into AREA (id, aid, aname, cid)
values (840, '320405', '戚墅堰区', '320400');
insert into AREA (id, aid, aname, cid)
values (841, '320411', '新北区', '320400');
insert into AREA (id, aid, aname, cid)
values (842, '320412', '武进区', '320400');
insert into AREA (id, aid, aname, cid)
values (843, '320481', '溧阳市', '320400');
insert into AREA (id, aid, aname, cid)
values (844, '320482', '金坛市', '320400');
insert into AREA (id, aid, aname, cid)
values (845, '320501', '市辖区', '320500');
insert into AREA (id, aid, aname, cid)
values (846, '320502', '沧浪区', '320500');
insert into AREA (id, aid, aname, cid)
values (847, '320503', '平江区', '320500');
insert into AREA (id, aid, aname, cid)
values (848, '320504', '金阊区', '320500');
insert into AREA (id, aid, aname, cid)
values (849, '320505', '虎丘区', '320500');
insert into AREA (id, aid, aname, cid)
values (850, '320506', '吴中区', '320500');
insert into AREA (id, aid, aname, cid)
values (851, '320507', '相城区', '320500');
insert into AREA (id, aid, aname, cid)
values (852, '320581', '常熟市', '320500');
insert into AREA (id, aid, aname, cid)
values (853, '320582', '张家港市', '320500');
insert into AREA (id, aid, aname, cid)
values (854, '320583', '昆山市', '320500');
insert into AREA (id, aid, aname, cid)
values (855, '320584', '吴江市', '320500');
insert into AREA (id, aid, aname, cid)
values (856, '320585', '太仓市', '320500');
insert into AREA (id, aid, aname, cid)
values (857, '320601', '市辖区', '320600');
insert into AREA (id, aid, aname, cid)
values (858, '320602', '崇川区', '320600');
insert into AREA (id, aid, aname, cid)
values (859, '320611', '港闸区', '320600');
insert into AREA (id, aid, aname, cid)
values (860, '320621', '海安县', '320600');
insert into AREA (id, aid, aname, cid)
values (861, '320623', '如东县', '320600');
insert into AREA (id, aid, aname, cid)
values (862, '320681', '启东市', '320600');
insert into AREA (id, aid, aname, cid)
values (863, '320682', '如皋市', '320600');
insert into AREA (id, aid, aname, cid)
values (864, '320683', '通州市', '320600');
insert into AREA (id, aid, aname, cid)
values (865, '320684', '海门市', '320600');
insert into AREA (id, aid, aname, cid)
values (866, '320701', '市辖区', '320700');
insert into AREA (id, aid, aname, cid)
values (867, '320703', '连云区', '320700');
insert into AREA (id, aid, aname, cid)
values (868, '320705', '新浦区', '320700');
insert into AREA (id, aid, aname, cid)
values (869, '320706', '海州区', '320700');
insert into AREA (id, aid, aname, cid)
values (870, '320721', '赣榆县', '320700');
insert into AREA (id, aid, aname, cid)
values (871, '320722', '东海县', '320700');
insert into AREA (id, aid, aname, cid)
values (872, '320723', '灌云县', '320700');
insert into AREA (id, aid, aname, cid)
values (873, '320724', '灌南县', '320700');
insert into AREA (id, aid, aname, cid)
values (874, '320801', '市辖区', '320800');
insert into AREA (id, aid, aname, cid)
values (875, '320802', '清河区', '320800');
insert into AREA (id, aid, aname, cid)
values (876, '320803', '楚州区', '320800');
insert into AREA (id, aid, aname, cid)
values (877, '320804', '淮阴区', '320800');
insert into AREA (id, aid, aname, cid)
values (878, '320811', '清浦区', '320800');
insert into AREA (id, aid, aname, cid)
values (879, '320826', '涟水县', '320800');
insert into AREA (id, aid, aname, cid)
values (880, '320829', '洪泽县', '320800');
insert into AREA (id, aid, aname, cid)
values (881, '320830', '盱眙县', '320800');
insert into AREA (id, aid, aname, cid)
values (882, '320831', '金湖县', '320800');
insert into AREA (id, aid, aname, cid)
values (883, '320901', '市辖区', '320900');
insert into AREA (id, aid, aname, cid)
values (884, '320902', '亭湖区', '320900');
insert into AREA (id, aid, aname, cid)
values (885, '320903', '盐都区', '320900');
insert into AREA (id, aid, aname, cid)
values (886, '320921', '响水县', '320900');
insert into AREA (id, aid, aname, cid)
values (887, '320922', '滨海县', '320900');
insert into AREA (id, aid, aname, cid)
values (888, '320923', '阜宁县', '320900');
insert into AREA (id, aid, aname, cid)
values (889, '320924', '射阳县', '320900');
insert into AREA (id, aid, aname, cid)
values (890, '320925', '建湖县', '320900');
insert into AREA (id, aid, aname, cid)
values (891, '320981', '东台市', '320900');
insert into AREA (id, aid, aname, cid)
values (892, '320982', '大丰市', '320900');
insert into AREA (id, aid, aname, cid)
values (893, '321001', '市辖区', '321000');
insert into AREA (id, aid, aname, cid)
values (894, '321002', '广陵区', '321000');
insert into AREA (id, aid, aname, cid)
values (895, '321003', '邗江区', '321000');
insert into AREA (id, aid, aname, cid)
values (896, '321011', '郊　区', '321000');
insert into AREA (id, aid, aname, cid)
values (897, '321023', '宝应县', '321000');
insert into AREA (id, aid, aname, cid)
values (898, '321081', '仪征市', '321000');
insert into AREA (id, aid, aname, cid)
values (899, '321084', '高邮市', '321000');
insert into AREA (id, aid, aname, cid)
values (900, '321088', '江都市', '321000');
insert into AREA (id, aid, aname, cid)
values (901, '321101', '市辖区', '321100');
insert into AREA (id, aid, aname, cid)
values (902, '321102', '京口区', '321100');
insert into AREA (id, aid, aname, cid)
values (903, '321111', '润州区', '321100');
insert into AREA (id, aid, aname, cid)
values (904, '321112', '丹徒区', '321100');
insert into AREA (id, aid, aname, cid)
values (905, '321181', '丹阳市', '321100');
insert into AREA (id, aid, aname, cid)
values (906, '321182', '扬中市', '321100');
insert into AREA (id, aid, aname, cid)
values (907, '321183', '句容市', '321100');
insert into AREA (id, aid, aname, cid)
values (908, '321201', '市辖区', '321200');
insert into AREA (id, aid, aname, cid)
values (909, '321202', '海陵区', '321200');
insert into AREA (id, aid, aname, cid)
values (910, '321203', '高港区', '321200');
insert into AREA (id, aid, aname, cid)
values (911, '321281', '兴化市', '321200');
insert into AREA (id, aid, aname, cid)
values (912, '321282', '靖江市', '321200');
insert into AREA (id, aid, aname, cid)
values (913, '321283', '泰兴市', '321200');
insert into AREA (id, aid, aname, cid)
values (914, '321284', '姜堰市', '321200');
insert into AREA (id, aid, aname, cid)
values (915, '321301', '市辖区', '321300');
insert into AREA (id, aid, aname, cid)
values (916, '321302', '宿城区', '321300');
insert into AREA (id, aid, aname, cid)
values (917, '321311', '宿豫区', '321300');
insert into AREA (id, aid, aname, cid)
values (918, '321322', '沭阳县', '321300');
insert into AREA (id, aid, aname, cid)
values (919, '321323', '泗阳县', '321300');
insert into AREA (id, aid, aname, cid)
values (920, '321324', '泗洪县', '321300');
insert into AREA (id, aid, aname, cid)
values (921, '330101', '市辖区', '330100');
insert into AREA (id, aid, aname, cid)
values (922, '330102', '上城区', '330100');
insert into AREA (id, aid, aname, cid)
values (923, '330103', '下城区', '330100');
insert into AREA (id, aid, aname, cid)
values (924, '330104', '江干区', '330100');
insert into AREA (id, aid, aname, cid)
values (925, '330105', '拱墅区', '330100');
insert into AREA (id, aid, aname, cid)
values (926, '330106', '西湖区', '330100');
insert into AREA (id, aid, aname, cid)
values (927, '330108', '滨江区', '330100');
insert into AREA (id, aid, aname, cid)
values (928, '330109', '萧山区', '330100');
insert into AREA (id, aid, aname, cid)
values (929, '330110', '余杭区', '330100');
insert into AREA (id, aid, aname, cid)
values (930, '330122', '桐庐县', '330100');
insert into AREA (id, aid, aname, cid)
values (931, '330127', '淳安县', '330100');
insert into AREA (id, aid, aname, cid)
values (932, '330182', '建德市', '330100');
insert into AREA (id, aid, aname, cid)
values (933, '330183', '富阳市', '330100');
insert into AREA (id, aid, aname, cid)
values (934, '330185', '临安市', '330100');
insert into AREA (id, aid, aname, cid)
values (935, '330201', '市辖区', '330200');
commit;
prompt 700 records committed...
insert into AREA (id, aid, aname, cid)
values (936, '330203', '海曙区', '330200');
insert into AREA (id, aid, aname, cid)
values (937, '330204', '江东区', '330200');
insert into AREA (id, aid, aname, cid)
values (938, '330205', '江北区', '330200');
insert into AREA (id, aid, aname, cid)
values (939, '330206', '北仑区', '330200');
insert into AREA (id, aid, aname, cid)
values (940, '330211', '镇海区', '330200');
insert into AREA (id, aid, aname, cid)
values (941, '330212', '鄞州区', '330200');
insert into AREA (id, aid, aname, cid)
values (942, '330225', '象山县', '330200');
insert into AREA (id, aid, aname, cid)
values (943, '330226', '宁海县', '330200');
insert into AREA (id, aid, aname, cid)
values (944, '330281', '余姚市', '330200');
insert into AREA (id, aid, aname, cid)
values (945, '330282', '慈溪市', '330200');
insert into AREA (id, aid, aname, cid)
values (946, '330283', '奉化市', '330200');
insert into AREA (id, aid, aname, cid)
values (947, '330301', '市辖区', '330300');
insert into AREA (id, aid, aname, cid)
values (948, '330302', '鹿城区', '330300');
insert into AREA (id, aid, aname, cid)
values (949, '330303', '龙湾区', '330300');
insert into AREA (id, aid, aname, cid)
values (950, '330304', '瓯海区', '330300');
insert into AREA (id, aid, aname, cid)
values (951, '330322', '洞头县', '330300');
insert into AREA (id, aid, aname, cid)
values (952, '330324', '永嘉县', '330300');
insert into AREA (id, aid, aname, cid)
values (1, '110101', '东城区', '110100');
insert into AREA (id, aid, aname, cid)
values (2, '110102', '西城区', '110100');
insert into AREA (id, aid, aname, cid)
values (3, '110103', '崇文区', '110100');
insert into AREA (id, aid, aname, cid)
values (4, '110104', '宣武区', '110100');
insert into AREA (id, aid, aname, cid)
values (5, '110105', '朝阳区', '110100');
insert into AREA (id, aid, aname, cid)
values (6, '110106', '丰台区', '110100');
insert into AREA (id, aid, aname, cid)
values (7, '110107', '石景山区', '110100');
insert into AREA (id, aid, aname, cid)
values (8, '110108', '海淀区', '110100');
insert into AREA (id, aid, aname, cid)
values (9, '110109', '门头沟区', '110100');
insert into AREA (id, aid, aname, cid)
values (10, '110111', '房山区', '110100');
insert into AREA (id, aid, aname, cid)
values (11, '110112', '通州区', '110100');
insert into AREA (id, aid, aname, cid)
values (12, '110113', '顺义区', '110100');
insert into AREA (id, aid, aname, cid)
values (13, '110114', '昌平区', '110100');
insert into AREA (id, aid, aname, cid)
values (14, '110115', '大兴区', '110100');
insert into AREA (id, aid, aname, cid)
values (15, '110116', '怀柔区', '110100');
insert into AREA (id, aid, aname, cid)
values (16, '110117', '平谷区', '110100');
insert into AREA (id, aid, aname, cid)
values (17, '110228', '密云县', '110200');
insert into AREA (id, aid, aname, cid)
values (18, '110229', '延庆县', '110200');
insert into AREA (id, aid, aname, cid)
values (19, '120101', '和平区', '120100');
insert into AREA (id, aid, aname, cid)
values (20, '120102', '河东区', '120100');
insert into AREA (id, aid, aname, cid)
values (21, '120103', '河西区', '120100');
insert into AREA (id, aid, aname, cid)
values (22, '120104', '南开区', '120100');
insert into AREA (id, aid, aname, cid)
values (23, '120105', '河北区', '120100');
insert into AREA (id, aid, aname, cid)
values (24, '120106', '红桥区', '120100');
insert into AREA (id, aid, aname, cid)
values (25, '120107', '塘沽区', '120100');
insert into AREA (id, aid, aname, cid)
values (26, '120108', '汉沽区', '120100');
insert into AREA (id, aid, aname, cid)
values (27, '120109', '大港区', '120100');
insert into AREA (id, aid, aname, cid)
values (28, '120110', '东丽区', '120100');
insert into AREA (id, aid, aname, cid)
values (29, '120111', '西青区', '120100');
insert into AREA (id, aid, aname, cid)
values (30, '120112', '津南区', '120100');
insert into AREA (id, aid, aname, cid)
values (31, '120113', '北辰区', '120100');
insert into AREA (id, aid, aname, cid)
values (32, '120114', '武清区', '120100');
insert into AREA (id, aid, aname, cid)
values (33, '120115', '宝坻区', '120100');
insert into AREA (id, aid, aname, cid)
values (34, '120221', '宁河县', '120200');
insert into AREA (id, aid, aname, cid)
values (35, '120223', '静海县', '120200');
insert into AREA (id, aid, aname, cid)
values (36, '120225', '蓟　县', '120200');
insert into AREA (id, aid, aname, cid)
values (37, '130101', '市辖区', '130100');
insert into AREA (id, aid, aname, cid)
values (38, '130102', '长安区', '130100');
insert into AREA (id, aid, aname, cid)
values (39, '130103', '桥东区', '130100');
insert into AREA (id, aid, aname, cid)
values (40, '130104', '桥西区', '130100');
insert into AREA (id, aid, aname, cid)
values (41, '130105', '新华区', '130100');
insert into AREA (id, aid, aname, cid)
values (42, '130107', '井陉矿区', '130100');
insert into AREA (id, aid, aname, cid)
values (43, '130108', '裕华区', '130100');
insert into AREA (id, aid, aname, cid)
values (44, '130121', '井陉县', '130100');
insert into AREA (id, aid, aname, cid)
values (45, '130123', '正定县', '130100');
insert into AREA (id, aid, aname, cid)
values (46, '130124', '栾城县', '130100');
insert into AREA (id, aid, aname, cid)
values (47, '130125', '行唐县', '130100');
insert into AREA (id, aid, aname, cid)
values (48, '130126', '灵寿县', '130100');
insert into AREA (id, aid, aname, cid)
values (49, '130127', '高邑县', '130100');
insert into AREA (id, aid, aname, cid)
values (50, '130128', '深泽县', '130100');
insert into AREA (id, aid, aname, cid)
values (51, '130129', '赞皇县', '130100');
insert into AREA (id, aid, aname, cid)
values (52, '130130', '无极县', '130100');
insert into AREA (id, aid, aname, cid)
values (53, '130131', '平山县', '130100');
insert into AREA (id, aid, aname, cid)
values (54, '130132', '元氏县', '130100');
insert into AREA (id, aid, aname, cid)
values (55, '130133', '赵　县', '130100');
insert into AREA (id, aid, aname, cid)
values (56, '130181', '辛集市', '130100');
insert into AREA (id, aid, aname, cid)
values (57, '130182', '藁城市', '130100');
insert into AREA (id, aid, aname, cid)
values (58, '130183', '晋州市', '130100');
insert into AREA (id, aid, aname, cid)
values (59, '130184', '新乐市', '130100');
insert into AREA (id, aid, aname, cid)
values (60, '130185', '鹿泉市', '130100');
insert into AREA (id, aid, aname, cid)
values (61, '130201', '市辖区', '130200');
insert into AREA (id, aid, aname, cid)
values (62, '130202', '路南区', '130200');
insert into AREA (id, aid, aname, cid)
values (63, '130203', '路北区', '130200');
insert into AREA (id, aid, aname, cid)
values (64, '130204', '古冶区', '130200');
insert into AREA (id, aid, aname, cid)
values (65, '130205', '开平区', '130200');
insert into AREA (id, aid, aname, cid)
values (66, '130207', '丰南区', '130200');
insert into AREA (id, aid, aname, cid)
values (67, '130208', '丰润区', '130200');
insert into AREA (id, aid, aname, cid)
values (68, '130223', '滦　县', '130200');
insert into AREA (id, aid, aname, cid)
values (69, '130224', '滦南县', '130200');
insert into AREA (id, aid, aname, cid)
values (70, '130225', '乐亭县', '130200');
insert into AREA (id, aid, aname, cid)
values (71, '130227', '迁西县', '130200');
insert into AREA (id, aid, aname, cid)
values (72, '130229', '玉田县', '130200');
insert into AREA (id, aid, aname, cid)
values (73, '130230', '唐海县', '130200');
insert into AREA (id, aid, aname, cid)
values (74, '130281', '遵化市', '130200');
insert into AREA (id, aid, aname, cid)
values (75, '130283', '迁安市', '130200');
insert into AREA (id, aid, aname, cid)
values (76, '130301', '市辖区', '130300');
insert into AREA (id, aid, aname, cid)
values (77, '130302', '海港区', '130300');
insert into AREA (id, aid, aname, cid)
values (78, '130303', '山海关区', '130300');
insert into AREA (id, aid, aname, cid)
values (79, '130304', '北戴河区', '130300');
insert into AREA (id, aid, aname, cid)
values (80, '130321', '青龙满族自治县', '130300');
insert into AREA (id, aid, aname, cid)
values (81, '130322', '昌黎县', '130300');
insert into AREA (id, aid, aname, cid)
values (82, '130323', '抚宁县', '130300');
insert into AREA (id, aid, aname, cid)
values (83, '130324', '卢龙县', '130300');
commit;
prompt 800 records committed...
insert into AREA (id, aid, aname, cid)
values (84, '130401', '市辖区', '130400');
insert into AREA (id, aid, aname, cid)
values (85, '130402', '邯山区', '130400');
insert into AREA (id, aid, aname, cid)
values (86, '130403', '丛台区', '130400');
insert into AREA (id, aid, aname, cid)
values (87, '130404', '复兴区', '130400');
insert into AREA (id, aid, aname, cid)
values (88, '130406', '峰峰矿区', '130400');
insert into AREA (id, aid, aname, cid)
values (89, '130421', '邯郸县', '130400');
insert into AREA (id, aid, aname, cid)
values (90, '130423', '临漳县', '130400');
insert into AREA (id, aid, aname, cid)
values (91, '130424', '成安县', '130400');
insert into AREA (id, aid, aname, cid)
values (92, '130425', '大名县', '130400');
insert into AREA (id, aid, aname, cid)
values (93, '130426', '涉　县', '130400');
insert into AREA (id, aid, aname, cid)
values (94, '130427', '磁　县', '130400');
insert into AREA (id, aid, aname, cid)
values (95, '130428', '肥乡县', '130400');
insert into AREA (id, aid, aname, cid)
values (96, '130429', '永年县', '130400');
insert into AREA (id, aid, aname, cid)
values (97, '130430', '邱　县', '130400');
insert into AREA (id, aid, aname, cid)
values (98, '130431', '鸡泽县', '130400');
insert into AREA (id, aid, aname, cid)
values (99, '130432', '广平县', '130400');
insert into AREA (id, aid, aname, cid)
values (100, '130433', '馆陶县', '130400');
insert into AREA (id, aid, aname, cid)
values (101, '130434', '魏　县', '130400');
insert into AREA (id, aid, aname, cid)
values (102, '130435', '曲周县', '130400');
insert into AREA (id, aid, aname, cid)
values (103, '130481', '武安市', '130400');
insert into AREA (id, aid, aname, cid)
values (104, '130501', '市辖区', '130500');
insert into AREA (id, aid, aname, cid)
values (105, '130502', '桥东区', '130500');
insert into AREA (id, aid, aname, cid)
values (106, '130503', '桥西区', '130500');
insert into AREA (id, aid, aname, cid)
values (107, '130521', '邢台县', '130500');
insert into AREA (id, aid, aname, cid)
values (108, '130522', '临城县', '130500');
insert into AREA (id, aid, aname, cid)
values (109, '130523', '内丘县', '130500');
insert into AREA (id, aid, aname, cid)
values (110, '130524', '柏乡县', '130500');
insert into AREA (id, aid, aname, cid)
values (111, '130525', '隆尧县', '130500');
insert into AREA (id, aid, aname, cid)
values (112, '130526', '任　县', '130500');
insert into AREA (id, aid, aname, cid)
values (113, '130527', '南和县', '130500');
insert into AREA (id, aid, aname, cid)
values (114, '130528', '宁晋县', '130500');
insert into AREA (id, aid, aname, cid)
values (115, '130529', '巨鹿县', '130500');
insert into AREA (id, aid, aname, cid)
values (116, '130530', '新河县', '130500');
insert into AREA (id, aid, aname, cid)
values (117, '130531', '广宗县', '130500');
insert into AREA (id, aid, aname, cid)
values (118, '130532', '平乡县', '130500');
insert into AREA (id, aid, aname, cid)
values (119, '130533', '威　县', '130500');
insert into AREA (id, aid, aname, cid)
values (120, '130534', '清河县', '130500');
insert into AREA (id, aid, aname, cid)
values (121, '130535', '临西县', '130500');
insert into AREA (id, aid, aname, cid)
values (122, '130581', '南宫市', '130500');
insert into AREA (id, aid, aname, cid)
values (123, '130582', '沙河市', '130500');
insert into AREA (id, aid, aname, cid)
values (124, '130601', '市辖区', '130600');
insert into AREA (id, aid, aname, cid)
values (125, '130602', '新市区', '130600');
insert into AREA (id, aid, aname, cid)
values (126, '130603', '北市区', '130600');
insert into AREA (id, aid, aname, cid)
values (127, '130604', '南市区', '130600');
insert into AREA (id, aid, aname, cid)
values (128, '130621', '满城县', '130600');
insert into AREA (id, aid, aname, cid)
values (129, '130622', '清苑县', '130600');
insert into AREA (id, aid, aname, cid)
values (130, '130623', '涞水县', '130600');
insert into AREA (id, aid, aname, cid)
values (131, '130624', '阜平县', '130600');
insert into AREA (id, aid, aname, cid)
values (132, '130625', '徐水县', '130600');
insert into AREA (id, aid, aname, cid)
values (133, '130626', '定兴县', '130600');
insert into AREA (id, aid, aname, cid)
values (134, '130627', '唐　县', '130600');
insert into AREA (id, aid, aname, cid)
values (135, '130628', '高阳县', '130600');
insert into AREA (id, aid, aname, cid)
values (136, '130629', '容城县', '130600');
insert into AREA (id, aid, aname, cid)
values (137, '130630', '涞源县', '130600');
insert into AREA (id, aid, aname, cid)
values (138, '130631', '望都县', '130600');
insert into AREA (id, aid, aname, cid)
values (139, '130632', '安新县', '130600');
insert into AREA (id, aid, aname, cid)
values (140, '130633', '易　县', '130600');
insert into AREA (id, aid, aname, cid)
values (141, '130634', '曲阳县', '130600');
insert into AREA (id, aid, aname, cid)
values (142, '130635', '蠡　县', '130600');
insert into AREA (id, aid, aname, cid)
values (143, '130636', '顺平县', '130600');
insert into AREA (id, aid, aname, cid)
values (144, '130637', '博野县', '130600');
insert into AREA (id, aid, aname, cid)
values (145, '130638', '雄　县', '130600');
insert into AREA (id, aid, aname, cid)
values (146, '130681', '涿州市', '130600');
insert into AREA (id, aid, aname, cid)
values (147, '130682', '定州市', '130600');
insert into AREA (id, aid, aname, cid)
values (148, '130683', '安国市', '130600');
insert into AREA (id, aid, aname, cid)
values (149, '130684', '高碑店市', '130600');
insert into AREA (id, aid, aname, cid)
values (150, '130701', '市辖区', '130700');
insert into AREA (id, aid, aname, cid)
values (151, '130702', '桥东区', '130700');
insert into AREA (id, aid, aname, cid)
values (152, '130703', '桥西区', '130700');
insert into AREA (id, aid, aname, cid)
values (153, '130705', '宣化区', '130700');
insert into AREA (id, aid, aname, cid)
values (154, '130706', '下花园区', '130700');
insert into AREA (id, aid, aname, cid)
values (155, '130721', '宣化县', '130700');
insert into AREA (id, aid, aname, cid)
values (156, '130722', '张北县', '130700');
insert into AREA (id, aid, aname, cid)
values (157, '130723', '康保县', '130700');
insert into AREA (id, aid, aname, cid)
values (158, '130724', '沽源县', '130700');
insert into AREA (id, aid, aname, cid)
values (159, '130725', '尚义县', '130700');
insert into AREA (id, aid, aname, cid)
values (160, '130726', '蔚　县', '130700');
insert into AREA (id, aid, aname, cid)
values (161, '130727', '阳原县', '130700');
insert into AREA (id, aid, aname, cid)
values (162, '130728', '怀安县', '130700');
insert into AREA (id, aid, aname, cid)
values (163, '130729', '万全县', '130700');
insert into AREA (id, aid, aname, cid)
values (164, '130730', '怀来县', '130700');
insert into AREA (id, aid, aname, cid)
values (165, '130731', '涿鹿县', '130700');
insert into AREA (id, aid, aname, cid)
values (166, '130732', '赤城县', '130700');
insert into AREA (id, aid, aname, cid)
values (167, '130733', '崇礼县', '130700');
insert into AREA (id, aid, aname, cid)
values (168, '130801', '市辖区', '130800');
insert into AREA (id, aid, aname, cid)
values (169, '130802', '双桥区', '130800');
insert into AREA (id, aid, aname, cid)
values (170, '130803', '双滦区', '130800');
insert into AREA (id, aid, aname, cid)
values (171, '130804', '鹰手营子矿区', '130800');
insert into AREA (id, aid, aname, cid)
values (172, '130821', '承德县', '130800');
insert into AREA (id, aid, aname, cid)
values (173, '130822', '兴隆县', '130800');
insert into AREA (id, aid, aname, cid)
values (174, '130823', '平泉县', '130800');
insert into AREA (id, aid, aname, cid)
values (175, '130824', '滦平县', '130800');
insert into AREA (id, aid, aname, cid)
values (176, '130825', '隆化县', '130800');
insert into AREA (id, aid, aname, cid)
values (177, '130826', '丰宁满族自治县', '130800');
insert into AREA (id, aid, aname, cid)
values (178, '130827', '宽城满族自治县', '130800');
insert into AREA (id, aid, aname, cid)
values (179, '130828', '围场满族蒙古族自治县', '130800');
insert into AREA (id, aid, aname, cid)
values (180, '130901', '市辖区', '130900');
insert into AREA (id, aid, aname, cid)
values (181, '130902', '新华区', '130900');
insert into AREA (id, aid, aname, cid)
values (182, '130903', '运河区', '130900');
insert into AREA (id, aid, aname, cid)
values (183, '130921', '沧　县', '130900');
commit;
prompt 900 records committed...
insert into AREA (id, aid, aname, cid)
values (184, '130922', '青　县', '130900');
insert into AREA (id, aid, aname, cid)
values (185, '130923', '东光县', '130900');
insert into AREA (id, aid, aname, cid)
values (186, '130924', '海兴县', '130900');
insert into AREA (id, aid, aname, cid)
values (187, '130925', '盐山县', '130900');
insert into AREA (id, aid, aname, cid)
values (188, '130926', '肃宁县', '130900');
insert into AREA (id, aid, aname, cid)
values (189, '130927', '南皮县', '130900');
insert into AREA (id, aid, aname, cid)
values (190, '130928', '吴桥县', '130900');
insert into AREA (id, aid, aname, cid)
values (191, '130929', '献　县', '130900');
insert into AREA (id, aid, aname, cid)
values (192, '130930', '孟村回族自治县', '130900');
insert into AREA (id, aid, aname, cid)
values (193, '130981', '泊头市', '130900');
insert into AREA (id, aid, aname, cid)
values (194, '130982', '任丘市', '130900');
insert into AREA (id, aid, aname, cid)
values (195, '130983', '黄骅市', '130900');
insert into AREA (id, aid, aname, cid)
values (196, '130984', '河间市', '130900');
insert into AREA (id, aid, aname, cid)
values (197, '131001', '市辖区', '131000');
insert into AREA (id, aid, aname, cid)
values (198, '131002', '安次区', '131000');
insert into AREA (id, aid, aname, cid)
values (199, '131003', '广阳区', '131000');
insert into AREA (id, aid, aname, cid)
values (200, '131022', '固安县', '131000');
insert into AREA (id, aid, aname, cid)
values (201, '131023', '永清县', '131000');
insert into AREA (id, aid, aname, cid)
values (202, '131024', '香河县', '131000');
insert into AREA (id, aid, aname, cid)
values (203, '131025', '大城县', '131000');
insert into AREA (id, aid, aname, cid)
values (204, '131026', '文安县', '131000');
insert into AREA (id, aid, aname, cid)
values (205, '131028', '大厂回族自治县', '131000');
insert into AREA (id, aid, aname, cid)
values (206, '131081', '霸州市', '131000');
insert into AREA (id, aid, aname, cid)
values (207, '131082', '三河市', '131000');
insert into AREA (id, aid, aname, cid)
values (208, '131101', '市辖区', '131100');
insert into AREA (id, aid, aname, cid)
values (209, '131102', '桃城区', '131100');
insert into AREA (id, aid, aname, cid)
values (210, '131121', '枣强县', '131100');
insert into AREA (id, aid, aname, cid)
values (211, '131122', '武邑县', '131100');
insert into AREA (id, aid, aname, cid)
values (212, '131123', '武强县', '131100');
insert into AREA (id, aid, aname, cid)
values (213, '131124', '饶阳县', '131100');
insert into AREA (id, aid, aname, cid)
values (214, '131125', '安平县', '131100');
insert into AREA (id, aid, aname, cid)
values (215, '131126', '故城县', '131100');
insert into AREA (id, aid, aname, cid)
values (216, '131127', '景　县', '131100');
insert into AREA (id, aid, aname, cid)
values (217, '131128', '阜城县', '131100');
insert into AREA (id, aid, aname, cid)
values (218, '131181', '冀州市', '131100');
insert into AREA (id, aid, aname, cid)
values (219, '131182', '深州市', '131100');
insert into AREA (id, aid, aname, cid)
values (220, '140101', '市辖区', '140100');
insert into AREA (id, aid, aname, cid)
values (221, '140105', '小店区', '140100');
insert into AREA (id, aid, aname, cid)
values (222, '140106', '迎泽区', '140100');
insert into AREA (id, aid, aname, cid)
values (223, '140107', '杏花岭区', '140100');
insert into AREA (id, aid, aname, cid)
values (224, '140108', '尖草坪区', '140100');
insert into AREA (id, aid, aname, cid)
values (225, '140109', '万柏林区', '140100');
insert into AREA (id, aid, aname, cid)
values (226, '140110', '晋源区', '140100');
insert into AREA (id, aid, aname, cid)
values (227, '140121', '清徐县', '140100');
insert into AREA (id, aid, aname, cid)
values (228, '140122', '阳曲县', '140100');
insert into AREA (id, aid, aname, cid)
values (229, '140123', '娄烦县', '140100');
insert into AREA (id, aid, aname, cid)
values (230, '140181', '古交市', '140100');
insert into AREA (id, aid, aname, cid)
values (231, '140201', '市辖区', '140200');
insert into AREA (id, aid, aname, cid)
values (232, '140202', '城　区', '140200');
insert into AREA (id, aid, aname, cid)
values (233, '140203', '矿　区', '140200');
insert into AREA (id, aid, aname, cid)
values (234, '140211', '南郊区', '140200');
insert into AREA (id, aid, aname, cid)
values (235, '140212', '新荣区', '140200');
insert into AREA (id, aid, aname, cid)
values (236, '140221', '阳高县', '140200');
insert into AREA (id, aid, aname, cid)
values (237, '140222', '天镇县', '140200');
insert into AREA (id, aid, aname, cid)
values (238, '140223', '广灵县', '140200');
insert into AREA (id, aid, aname, cid)
values (239, '140224', '灵丘县', '140200');
insert into AREA (id, aid, aname, cid)
values (240, '140225', '浑源县', '140200');
insert into AREA (id, aid, aname, cid)
values (241, '140226', '左云县', '140200');
insert into AREA (id, aid, aname, cid)
values (242, '140227', '大同县', '140200');
insert into AREA (id, aid, aname, cid)
values (243, '140301', '市辖区', '140300');
insert into AREA (id, aid, aname, cid)
values (244, '140302', '城　区', '140300');
insert into AREA (id, aid, aname, cid)
values (245, '140303', '矿　区', '140300');
insert into AREA (id, aid, aname, cid)
values (246, '140311', '郊　区', '140300');
insert into AREA (id, aid, aname, cid)
values (247, '140321', '平定县', '140300');
insert into AREA (id, aid, aname, cid)
values (248, '140322', '盂　县', '140300');
insert into AREA (id, aid, aname, cid)
values (249, '140401', '市辖区', '140400');
insert into AREA (id, aid, aname, cid)
values (250, '140402', '城　区', '140400');
insert into AREA (id, aid, aname, cid)
values (251, '140411', '郊　区', '140400');
insert into AREA (id, aid, aname, cid)
values (252, '140421', '长治县', '140400');
insert into AREA (id, aid, aname, cid)
values (253, '140423', '襄垣县', '140400');
insert into AREA (id, aid, aname, cid)
values (254, '140424', '屯留县', '140400');
insert into AREA (id, aid, aname, cid)
values (255, '140425', '平顺县', '140400');
insert into AREA (id, aid, aname, cid)
values (256, '140426', '黎城县', '140400');
insert into AREA (id, aid, aname, cid)
values (257, '140427', '壶关县', '140400');
insert into AREA (id, aid, aname, cid)
values (258, '140428', '长子县', '140400');
insert into AREA (id, aid, aname, cid)
values (259, '140429', '武乡县', '140400');
insert into AREA (id, aid, aname, cid)
values (260, '140430', '沁　县', '140400');
insert into AREA (id, aid, aname, cid)
values (261, '140431', '沁源县', '140400');
insert into AREA (id, aid, aname, cid)
values (262, '140481', '潞城市', '140400');
insert into AREA (id, aid, aname, cid)
values (263, '140501', '市辖区', '140500');
insert into AREA (id, aid, aname, cid)
values (264, '140502', '城　区', '140500');
insert into AREA (id, aid, aname, cid)
values (265, '140521', '沁水县', '140500');
insert into AREA (id, aid, aname, cid)
values (266, '140522', '阳城县', '140500');
insert into AREA (id, aid, aname, cid)
values (267, '140524', '陵川县', '140500');
insert into AREA (id, aid, aname, cid)
values (268, '140525', '泽州县', '140500');
insert into AREA (id, aid, aname, cid)
values (269, '140581', '高平市', '140500');
insert into AREA (id, aid, aname, cid)
values (270, '140601', '市辖区', '140600');
insert into AREA (id, aid, aname, cid)
values (271, '140602', '朔城区', '140600');
insert into AREA (id, aid, aname, cid)
values (272, '140603', '平鲁区', '140600');
insert into AREA (id, aid, aname, cid)
values (273, '140621', '山阴县', '140600');
insert into AREA (id, aid, aname, cid)
values (274, '140622', '应　县', '140600');
insert into AREA (id, aid, aname, cid)
values (275, '140623', '右玉县', '140600');
insert into AREA (id, aid, aname, cid)
values (276, '140624', '怀仁县', '140600');
insert into AREA (id, aid, aname, cid)
values (277, '140701', '市辖区', '140700');
insert into AREA (id, aid, aname, cid)
values (278, '140702', '榆次区', '140700');
insert into AREA (id, aid, aname, cid)
values (279, '140721', '榆社县', '140700');
insert into AREA (id, aid, aname, cid)
values (280, '140722', '左权县', '140700');
insert into AREA (id, aid, aname, cid)
values (281, '140723', '和顺县', '140700');
insert into AREA (id, aid, aname, cid)
values (282, '140724', '昔阳县', '140700');
insert into AREA (id, aid, aname, cid)
values (283, '140725', '寿阳县', '140700');
commit;
prompt 1000 records committed...
insert into AREA (id, aid, aname, cid)
values (284, '140726', '太谷县', '140700');
insert into AREA (id, aid, aname, cid)
values (285, '140727', '祁　县', '140700');
insert into AREA (id, aid, aname, cid)
values (286, '140728', '平遥县', '140700');
insert into AREA (id, aid, aname, cid)
values (287, '140729', '灵石县', '140700');
insert into AREA (id, aid, aname, cid)
values (288, '140781', '介休市', '140700');
insert into AREA (id, aid, aname, cid)
values (289, '140801', '市辖区', '140800');
insert into AREA (id, aid, aname, cid)
values (290, '140802', '盐湖区', '140800');
insert into AREA (id, aid, aname, cid)
values (291, '140821', '临猗县', '140800');
insert into AREA (id, aid, aname, cid)
values (292, '140822', '万荣县', '140800');
insert into AREA (id, aid, aname, cid)
values (293, '140823', '闻喜县', '140800');
insert into AREA (id, aid, aname, cid)
values (294, '140824', '稷山县', '140800');
insert into AREA (id, aid, aname, cid)
values (295, '140825', '新绛县', '140800');
insert into AREA (id, aid, aname, cid)
values (296, '140826', '绛　县', '140800');
insert into AREA (id, aid, aname, cid)
values (297, '140827', '垣曲县', '140800');
insert into AREA (id, aid, aname, cid)
values (298, '140828', '夏　县', '140800');
insert into AREA (id, aid, aname, cid)
values (299, '140829', '平陆县', '140800');
insert into AREA (id, aid, aname, cid)
values (300, '140830', '芮城县', '140800');
insert into AREA (id, aid, aname, cid)
values (301, '140881', '永济市', '140800');
insert into AREA (id, aid, aname, cid)
values (302, '140882', '河津市', '140800');
insert into AREA (id, aid, aname, cid)
values (303, '140901', '市辖区', '140900');
insert into AREA (id, aid, aname, cid)
values (304, '140902', '忻府区', '140900');
insert into AREA (id, aid, aname, cid)
values (305, '140921', '定襄县', '140900');
insert into AREA (id, aid, aname, cid)
values (306, '140922', '五台县', '140900');
insert into AREA (id, aid, aname, cid)
values (307, '140923', '代　县', '140900');
insert into AREA (id, aid, aname, cid)
values (308, '140924', '繁峙县', '140900');
insert into AREA (id, aid, aname, cid)
values (309, '140925', '宁武县', '140900');
insert into AREA (id, aid, aname, cid)
values (310, '140926', '静乐县', '140900');
insert into AREA (id, aid, aname, cid)
values (311, '140927', '神池县', '140900');
insert into AREA (id, aid, aname, cid)
values (312, '140928', '五寨县', '140900');
insert into AREA (id, aid, aname, cid)
values (313, '140929', '岢岚县', '140900');
insert into AREA (id, aid, aname, cid)
values (314, '140930', '河曲县', '140900');
insert into AREA (id, aid, aname, cid)
values (315, '140931', '保德县', '140900');
insert into AREA (id, aid, aname, cid)
values (316, '140932', '偏关县', '140900');
insert into AREA (id, aid, aname, cid)
values (317, '140981', '原平市', '140900');
insert into AREA (id, aid, aname, cid)
values (318, '141001', '市辖区', '141000');
insert into AREA (id, aid, aname, cid)
values (319, '141002', '尧都区', '141000');
insert into AREA (id, aid, aname, cid)
values (320, '141021', '曲沃县', '141000');
insert into AREA (id, aid, aname, cid)
values (321, '141022', '翼城县', '141000');
insert into AREA (id, aid, aname, cid)
values (322, '141023', '襄汾县', '141000');
insert into AREA (id, aid, aname, cid)
values (323, '141024', '洪洞县', '141000');
insert into AREA (id, aid, aname, cid)
values (324, '141025', '古　县', '141000');
insert into AREA (id, aid, aname, cid)
values (325, '141026', '安泽县', '141000');
insert into AREA (id, aid, aname, cid)
values (326, '141027', '浮山县', '141000');
insert into AREA (id, aid, aname, cid)
values (327, '141028', '吉　县', '141000');
insert into AREA (id, aid, aname, cid)
values (328, '141029', '乡宁县', '141000');
insert into AREA (id, aid, aname, cid)
values (329, '141030', '大宁县', '141000');
insert into AREA (id, aid, aname, cid)
values (330, '141031', '隰　县', '141000');
insert into AREA (id, aid, aname, cid)
values (331, '141032', '永和县', '141000');
insert into AREA (id, aid, aname, cid)
values (332, '141033', '蒲　县', '141000');
insert into AREA (id, aid, aname, cid)
values (333, '141034', '汾西县', '141000');
insert into AREA (id, aid, aname, cid)
values (334, '141081', '侯马市', '141000');
insert into AREA (id, aid, aname, cid)
values (335, '141082', '霍州市', '141000');
insert into AREA (id, aid, aname, cid)
values (336, '141101', '市辖区', '141100');
insert into AREA (id, aid, aname, cid)
values (337, '141102', '离石区', '141100');
insert into AREA (id, aid, aname, cid)
values (338, '141121', '文水县', '141100');
insert into AREA (id, aid, aname, cid)
values (339, '141122', '交城县', '141100');
insert into AREA (id, aid, aname, cid)
values (340, '141123', '兴　县', '141100');
insert into AREA (id, aid, aname, cid)
values (341, '141124', '临　县', '141100');
insert into AREA (id, aid, aname, cid)
values (342, '141125', '柳林县', '141100');
insert into AREA (id, aid, aname, cid)
values (343, '141126', '石楼县', '141100');
insert into AREA (id, aid, aname, cid)
values (344, '141127', '岚　县', '141100');
insert into AREA (id, aid, aname, cid)
values (345, '141128', '方山县', '141100');
insert into AREA (id, aid, aname, cid)
values (346, '141129', '中阳县', '141100');
insert into AREA (id, aid, aname, cid)
values (347, '141130', '交口县', '141100');
insert into AREA (id, aid, aname, cid)
values (348, '141181', '孝义市', '141100');
insert into AREA (id, aid, aname, cid)
values (349, '141182', '汾阳市', '141100');
insert into AREA (id, aid, aname, cid)
values (350, '150101', '市辖区', '150100');
insert into AREA (id, aid, aname, cid)
values (351, '150102', '新城区', '150100');
insert into AREA (id, aid, aname, cid)
values (352, '150103', '回民区', '150100');
insert into AREA (id, aid, aname, cid)
values (353, '150104', '玉泉区', '150100');
insert into AREA (id, aid, aname, cid)
values (354, '150105', '赛罕区', '150100');
insert into AREA (id, aid, aname, cid)
values (355, '150121', '土默特左旗', '150100');
insert into AREA (id, aid, aname, cid)
values (356, '150122', '托克托县', '150100');
insert into AREA (id, aid, aname, cid)
values (357, '150123', '和林格尔县', '150100');
insert into AREA (id, aid, aname, cid)
values (358, '150124', '清水河县', '150100');
insert into AREA (id, aid, aname, cid)
values (359, '150125', '武川县', '150100');
insert into AREA (id, aid, aname, cid)
values (360, '150201', '市辖区', '150200');
insert into AREA (id, aid, aname, cid)
values (361, '150202', '东河区', '150200');
insert into AREA (id, aid, aname, cid)
values (362, '150203', '昆都仑区', '150200');
insert into AREA (id, aid, aname, cid)
values (363, '150204', '青山区', '150200');
insert into AREA (id, aid, aname, cid)
values (364, '150205', '石拐区', '150200');
insert into AREA (id, aid, aname, cid)
values (365, '150206', '白云矿区', '150200');
insert into AREA (id, aid, aname, cid)
values (366, '150207', '九原区', '150200');
insert into AREA (id, aid, aname, cid)
values (367, '150221', '土默特右旗', '150200');
insert into AREA (id, aid, aname, cid)
values (368, '150222', '固阳县', '150200');
insert into AREA (id, aid, aname, cid)
values (369, '150223', '达尔罕茂明安联合旗', '150200');
insert into AREA (id, aid, aname, cid)
values (370, '150301', '市辖区', '150300');
insert into AREA (id, aid, aname, cid)
values (371, '150302', '海勃湾区', '150300');
insert into AREA (id, aid, aname, cid)
values (372, '150303', '海南区', '150300');
insert into AREA (id, aid, aname, cid)
values (373, '150304', '乌达区', '150300');
insert into AREA (id, aid, aname, cid)
values (374, '150401', '市辖区', '150400');
insert into AREA (id, aid, aname, cid)
values (375, '150402', '红山区', '150400');
insert into AREA (id, aid, aname, cid)
values (376, '150403', '元宝山区', '150400');
insert into AREA (id, aid, aname, cid)
values (377, '150404', '松山区', '150400');
insert into AREA (id, aid, aname, cid)
values (378, '150421', '阿鲁科尔沁旗', '150400');
insert into AREA (id, aid, aname, cid)
values (379, '150422', '巴林左旗', '150400');
insert into AREA (id, aid, aname, cid)
values (380, '150423', '巴林右旗', '150400');
insert into AREA (id, aid, aname, cid)
values (381, '150424', '林西县', '150400');
insert into AREA (id, aid, aname, cid)
values (382, '150425', '克什克腾旗', '150400');
insert into AREA (id, aid, aname, cid)
values (383, '150426', '翁牛特旗', '150400');
commit;
prompt 1100 records committed...
insert into AREA (id, aid, aname, cid)
values (384, '150428', '喀喇沁旗', '150400');
insert into AREA (id, aid, aname, cid)
values (385, '150429', '宁城县', '150400');
insert into AREA (id, aid, aname, cid)
values (386, '150430', '敖汉旗', '150400');
insert into AREA (id, aid, aname, cid)
values (387, '150501', '市辖区', '150500');
insert into AREA (id, aid, aname, cid)
values (388, '150502', '科尔沁区', '150500');
insert into AREA (id, aid, aname, cid)
values (389, '150521', '科尔沁左翼中旗', '150500');
insert into AREA (id, aid, aname, cid)
values (390, '150522', '科尔沁左翼后旗', '150500');
insert into AREA (id, aid, aname, cid)
values (391, '150523', '开鲁县', '150500');
insert into AREA (id, aid, aname, cid)
values (392, '150524', '库伦旗', '150500');
insert into AREA (id, aid, aname, cid)
values (393, '150525', '奈曼旗', '150500');
insert into AREA (id, aid, aname, cid)
values (394, '150526', '扎鲁特旗', '150500');
insert into AREA (id, aid, aname, cid)
values (395, '150581', '霍林郭勒市', '150500');
insert into AREA (id, aid, aname, cid)
values (396, '150602', '东胜区', '150600');
insert into AREA (id, aid, aname, cid)
values (397, '150621', '达拉特旗', '150600');
insert into AREA (id, aid, aname, cid)
values (398, '150622', '准格尔旗', '150600');
insert into AREA (id, aid, aname, cid)
values (399, '150623', '鄂托克前旗', '150600');
insert into AREA (id, aid, aname, cid)
values (400, '150624', '鄂托克旗', '150600');
insert into AREA (id, aid, aname, cid)
values (401, '150625', '杭锦旗', '150600');
insert into AREA (id, aid, aname, cid)
values (402, '150626', '乌审旗', '150600');
insert into AREA (id, aid, aname, cid)
values (403, '150627', '伊金霍洛旗', '150600');
insert into AREA (id, aid, aname, cid)
values (404, '150701', '市辖区', '150700');
insert into AREA (id, aid, aname, cid)
values (405, '150702', '海拉尔区', '150700');
insert into AREA (id, aid, aname, cid)
values (406, '150721', '阿荣旗', '150700');
insert into AREA (id, aid, aname, cid)
values (407, '150722', '莫力达瓦达斡尔族自治旗', '150700');
insert into AREA (id, aid, aname, cid)
values (408, '150723', '鄂伦春自治旗', '150700');
insert into AREA (id, aid, aname, cid)
values (409, '150724', '鄂温克族自治旗', '150700');
insert into AREA (id, aid, aname, cid)
values (410, '150725', '陈巴尔虎旗', '150700');
insert into AREA (id, aid, aname, cid)
values (411, '150726', '新巴尔虎左旗', '150700');
insert into AREA (id, aid, aname, cid)
values (412, '150727', '新巴尔虎右旗', '150700');
insert into AREA (id, aid, aname, cid)
values (413, '150781', '满洲里市', '150700');
insert into AREA (id, aid, aname, cid)
values (414, '150782', '牙克石市', '150700');
insert into AREA (id, aid, aname, cid)
values (415, '150783', '扎兰屯市', '150700');
insert into AREA (id, aid, aname, cid)
values (416, '150784', '额尔古纳市', '150700');
insert into AREA (id, aid, aname, cid)
values (417, '150785', '根河市', '150700');
insert into AREA (id, aid, aname, cid)
values (418, '150801', '市辖区', '150800');
insert into AREA (id, aid, aname, cid)
values (419, '150802', '临河区', '150800');
insert into AREA (id, aid, aname, cid)
values (420, '150821', '五原县', '150800');
insert into AREA (id, aid, aname, cid)
values (421, '150822', '磴口县', '150800');
insert into AREA (id, aid, aname, cid)
values (422, '150823', '乌拉特前旗', '150800');
insert into AREA (id, aid, aname, cid)
values (423, '150824', '乌拉特中旗', '150800');
insert into AREA (id, aid, aname, cid)
values (424, '150825', '乌拉特后旗', '150800');
insert into AREA (id, aid, aname, cid)
values (425, '150826', '杭锦后旗', '150800');
insert into AREA (id, aid, aname, cid)
values (426, '150901', '市辖区', '150900');
insert into AREA (id, aid, aname, cid)
values (427, '150902', '集宁区', '150900');
insert into AREA (id, aid, aname, cid)
values (428, '150921', '卓资县', '150900');
insert into AREA (id, aid, aname, cid)
values (429, '150922', '化德县', '150900');
insert into AREA (id, aid, aname, cid)
values (430, '150923', '商都县', '150900');
insert into AREA (id, aid, aname, cid)
values (431, '150924', '兴和县', '150900');
insert into AREA (id, aid, aname, cid)
values (432, '150925', '凉城县', '150900');
insert into AREA (id, aid, aname, cid)
values (433, '150926', '察哈尔右翼前旗', '150900');
insert into AREA (id, aid, aname, cid)
values (434, '150927', '察哈尔右翼中旗', '150900');
insert into AREA (id, aid, aname, cid)
values (435, '150928', '察哈尔右翼后旗', '150900');
insert into AREA (id, aid, aname, cid)
values (436, '150929', '四子王旗', '150900');
insert into AREA (id, aid, aname, cid)
values (437, '150981', '丰镇市', '150900');
insert into AREA (id, aid, aname, cid)
values (438, '152201', '乌兰浩特市', '152200');
insert into AREA (id, aid, aname, cid)
values (439, '152202', '阿尔山市', '152200');
insert into AREA (id, aid, aname, cid)
values (440, '152221', '科尔沁右翼前旗', '152200');
insert into AREA (id, aid, aname, cid)
values (441, '152222', '科尔沁右翼中旗', '152200');
insert into AREA (id, aid, aname, cid)
values (442, '152223', '扎赉特旗', '152200');
insert into AREA (id, aid, aname, cid)
values (443, '152224', '突泉县', '152200');
insert into AREA (id, aid, aname, cid)
values (444, '152501', '二连浩特市', '152500');
insert into AREA (id, aid, aname, cid)
values (445, '152502', '锡林浩特市', '152500');
insert into AREA (id, aid, aname, cid)
values (446, '152522', '阿巴嘎旗', '152500');
insert into AREA (id, aid, aname, cid)
values (447, '152523', '苏尼特左旗', '152500');
insert into AREA (id, aid, aname, cid)
values (448, '152524', '苏尼特右旗', '152500');
insert into AREA (id, aid, aname, cid)
values (449, '152525', '东乌珠穆沁旗', '152500');
insert into AREA (id, aid, aname, cid)
values (450, '152526', '西乌珠穆沁旗', '152500');
insert into AREA (id, aid, aname, cid)
values (451, '152527', '太仆寺旗', '152500');
insert into AREA (id, aid, aname, cid)
values (452, '152528', '镶黄旗', '152500');
insert into AREA (id, aid, aname, cid)
values (453, '152529', '正镶白旗', '152500');
insert into AREA (id, aid, aname, cid)
values (454, '152530', '正蓝旗', '152500');
insert into AREA (id, aid, aname, cid)
values (455, '152531', '多伦县', '152500');
insert into AREA (id, aid, aname, cid)
values (456, '152921', '阿拉善左旗', '152900');
insert into AREA (id, aid, aname, cid)
values (457, '152922', '阿拉善右旗', '152900');
insert into AREA (id, aid, aname, cid)
values (458, '152923', '额济纳旗', '152900');
insert into AREA (id, aid, aname, cid)
values (459, '210101', '市辖区', '210100');
insert into AREA (id, aid, aname, cid)
values (460, '210102', '和平区', '210100');
insert into AREA (id, aid, aname, cid)
values (461, '210103', '沈河区', '210100');
insert into AREA (id, aid, aname, cid)
values (462, '210104', '大东区', '210100');
insert into AREA (id, aid, aname, cid)
values (463, '210105', '皇姑区', '210100');
insert into AREA (id, aid, aname, cid)
values (464, '210106', '铁西区', '210100');
insert into AREA (id, aid, aname, cid)
values (465, '210111', '苏家屯区', '210100');
insert into AREA (id, aid, aname, cid)
values (466, '210112', '东陵区', '210100');
insert into AREA (id, aid, aname, cid)
values (467, '210113', '新城子区', '210100');
insert into AREA (id, aid, aname, cid)
values (468, '210114', '于洪区', '210100');
insert into AREA (id, aid, aname, cid)
values (469, '210122', '辽中县', '210100');
insert into AREA (id, aid, aname, cid)
values (470, '210123', '康平县', '210100');
insert into AREA (id, aid, aname, cid)
values (471, '210124', '法库县', '210100');
insert into AREA (id, aid, aname, cid)
values (472, '210181', '新民市', '210100');
insert into AREA (id, aid, aname, cid)
values (473, '210201', '市辖区', '210200');
insert into AREA (id, aid, aname, cid)
values (474, '210202', '中山区', '210200');
insert into AREA (id, aid, aname, cid)
values (475, '210203', '西岗区', '210200');
insert into AREA (id, aid, aname, cid)
values (2851, '610826', '绥德县', '610800');
insert into AREA (id, aid, aname, cid)
values (2852, '610827', '米脂县', '610800');
insert into AREA (id, aid, aname, cid)
values (2853, '610828', '佳　县', '610800');
insert into AREA (id, aid, aname, cid)
values (2854, '610829', '吴堡县', '610800');
insert into AREA (id, aid, aname, cid)
values (2855, '610830', '清涧县', '610800');
insert into AREA (id, aid, aname, cid)
values (2856, '610831', '子洲县', '610800');
insert into AREA (id, aid, aname, cid)
values (2857, '610901', '市辖区', '610900');
insert into AREA (id, aid, aname, cid)
values (2858, '610902', '汉滨区', '610900');
commit;
prompt 1200 records committed...
insert into AREA (id, aid, aname, cid)
values (2859, '610921', '汉阴县', '610900');
insert into AREA (id, aid, aname, cid)
values (2860, '610922', '石泉县', '610900');
insert into AREA (id, aid, aname, cid)
values (2861, '610923', '宁陕县', '610900');
insert into AREA (id, aid, aname, cid)
values (2862, '610924', '紫阳县', '610900');
insert into AREA (id, aid, aname, cid)
values (2863, '610925', '岚皋县', '610900');
insert into AREA (id, aid, aname, cid)
values (2864, '610926', '平利县', '610900');
insert into AREA (id, aid, aname, cid)
values (2865, '610927', '镇坪县', '610900');
insert into AREA (id, aid, aname, cid)
values (2866, '610928', '旬阳县', '610900');
insert into AREA (id, aid, aname, cid)
values (2867, '610929', '白河县', '610900');
insert into AREA (id, aid, aname, cid)
values (2868, '611001', '市辖区', '611000');
insert into AREA (id, aid, aname, cid)
values (2869, '611002', '商州区', '611000');
insert into AREA (id, aid, aname, cid)
values (2870, '611021', '洛南县', '611000');
insert into AREA (id, aid, aname, cid)
values (2871, '611022', '丹凤县', '611000');
insert into AREA (id, aid, aname, cid)
values (2872, '611023', '商南县', '611000');
insert into AREA (id, aid, aname, cid)
values (2873, '611024', '山阳县', '611000');
insert into AREA (id, aid, aname, cid)
values (2874, '611025', '镇安县', '611000');
insert into AREA (id, aid, aname, cid)
values (2875, '611026', '柞水县', '611000');
insert into AREA (id, aid, aname, cid)
values (2876, '620101', '市辖区', '620100');
insert into AREA (id, aid, aname, cid)
values (2877, '620102', '城关区', '620100');
insert into AREA (id, aid, aname, cid)
values (2878, '620103', '七里河区', '620100');
insert into AREA (id, aid, aname, cid)
values (2879, '620104', '西固区', '620100');
insert into AREA (id, aid, aname, cid)
values (2880, '620105', '安宁区', '620100');
insert into AREA (id, aid, aname, cid)
values (2881, '620111', '红古区', '620100');
insert into AREA (id, aid, aname, cid)
values (2882, '620121', '永登县', '620100');
insert into AREA (id, aid, aname, cid)
values (2883, '620122', '皋兰县', '620100');
insert into AREA (id, aid, aname, cid)
values (2884, '620123', '榆中县', '620100');
insert into AREA (id, aid, aname, cid)
values (2885, '620201', '市辖区', '620200');
insert into AREA (id, aid, aname, cid)
values (2886, '620301', '市辖区', '620300');
insert into AREA (id, aid, aname, cid)
values (2887, '620302', '金川区', '620300');
insert into AREA (id, aid, aname, cid)
values (2888, '620321', '永昌县', '620300');
insert into AREA (id, aid, aname, cid)
values (2889, '620401', '市辖区', '620400');
insert into AREA (id, aid, aname, cid)
values (2890, '620402', '白银区', '620400');
insert into AREA (id, aid, aname, cid)
values (2891, '620403', '平川区', '620400');
insert into AREA (id, aid, aname, cid)
values (2892, '620421', '靖远县', '620400');
insert into AREA (id, aid, aname, cid)
values (2893, '620422', '会宁县', '620400');
insert into AREA (id, aid, aname, cid)
values (2894, '620423', '景泰县', '620400');
insert into AREA (id, aid, aname, cid)
values (2895, '620501', '市辖区', '620500');
insert into AREA (id, aid, aname, cid)
values (2896, '620502', '秦城区', '620500');
insert into AREA (id, aid, aname, cid)
values (2897, '620503', '北道区', '620500');
insert into AREA (id, aid, aname, cid)
values (2898, '620521', '清水县', '620500');
insert into AREA (id, aid, aname, cid)
values (2899, '620522', '秦安县', '620500');
insert into AREA (id, aid, aname, cid)
values (2900, '620523', '甘谷县', '620500');
insert into AREA (id, aid, aname, cid)
values (2901, '620524', '武山县', '620500');
insert into AREA (id, aid, aname, cid)
values (2902, '620525', '张家川回族自治县', '620500');
insert into AREA (id, aid, aname, cid)
values (2903, '620601', '市辖区', '620600');
insert into AREA (id, aid, aname, cid)
values (2904, '620602', '凉州区', '620600');
insert into AREA (id, aid, aname, cid)
values (2905, '620621', '民勤县', '620600');
insert into AREA (id, aid, aname, cid)
values (2906, '620622', '古浪县', '620600');
insert into AREA (id, aid, aname, cid)
values (2907, '620623', '天祝藏族自治县', '620600');
insert into AREA (id, aid, aname, cid)
values (2908, '620701', '市辖区', '620700');
insert into AREA (id, aid, aname, cid)
values (2909, '620702', '甘州区', '620700');
insert into AREA (id, aid, aname, cid)
values (2910, '620721', '肃南裕固族自治县', '620700');
insert into AREA (id, aid, aname, cid)
values (2911, '620722', '民乐县', '620700');
insert into AREA (id, aid, aname, cid)
values (2912, '620723', '临泽县', '620700');
insert into AREA (id, aid, aname, cid)
values (2913, '620724', '高台县', '620700');
insert into AREA (id, aid, aname, cid)
values (2914, '620725', '山丹县', '620700');
insert into AREA (id, aid, aname, cid)
values (2915, '620801', '市辖区', '620800');
insert into AREA (id, aid, aname, cid)
values (2916, '620802', '崆峒区', '620800');
insert into AREA (id, aid, aname, cid)
values (2917, '620821', '泾川县', '620800');
insert into AREA (id, aid, aname, cid)
values (2918, '620822', '灵台县', '620800');
insert into AREA (id, aid, aname, cid)
values (2919, '620823', '崇信县', '620800');
insert into AREA (id, aid, aname, cid)
values (2920, '620824', '华亭县', '620800');
insert into AREA (id, aid, aname, cid)
values (2921, '620825', '庄浪县', '620800');
insert into AREA (id, aid, aname, cid)
values (2922, '620826', '静宁县', '620800');
insert into AREA (id, aid, aname, cid)
values (2923, '620901', '市辖区', '620900');
insert into AREA (id, aid, aname, cid)
values (2924, '620902', '肃州区', '620900');
insert into AREA (id, aid, aname, cid)
values (2925, '620921', '金塔县', '620900');
insert into AREA (id, aid, aname, cid)
values (2926, '620922', '安西县', '620900');
insert into AREA (id, aid, aname, cid)
values (2927, '620923', '肃北蒙古族自治县', '620900');
insert into AREA (id, aid, aname, cid)
values (2928, '620924', '阿克塞哈萨克族自治县', '620900');
insert into AREA (id, aid, aname, cid)
values (2929, '620981', '玉门市', '620900');
insert into AREA (id, aid, aname, cid)
values (2930, '620982', '敦煌市', '620900');
insert into AREA (id, aid, aname, cid)
values (2931, '621001', '市辖区', '621000');
insert into AREA (id, aid, aname, cid)
values (2932, '621002', '西峰区', '621000');
insert into AREA (id, aid, aname, cid)
values (2933, '621021', '庆城县', '621000');
insert into AREA (id, aid, aname, cid)
values (2934, '621022', '环　县', '621000');
insert into AREA (id, aid, aname, cid)
values (2935, '621023', '华池县', '621000');
insert into AREA (id, aid, aname, cid)
values (2936, '621024', '合水县', '621000');
insert into AREA (id, aid, aname, cid)
values (2937, '621025', '正宁县', '621000');
insert into AREA (id, aid, aname, cid)
values (2938, '621026', '宁　县', '621000');
insert into AREA (id, aid, aname, cid)
values (2939, '621027', '镇原县', '621000');
insert into AREA (id, aid, aname, cid)
values (2940, '621101', '市辖区', '621100');
insert into AREA (id, aid, aname, cid)
values (2941, '621102', '安定区', '621100');
insert into AREA (id, aid, aname, cid)
values (2942, '621121', '通渭县', '621100');
insert into AREA (id, aid, aname, cid)
values (2943, '621122', '陇西县', '621100');
insert into AREA (id, aid, aname, cid)
values (2944, '621123', '渭源县', '621100');
insert into AREA (id, aid, aname, cid)
values (2945, '621124', '临洮县', '621100');
insert into AREA (id, aid, aname, cid)
values (2946, '621125', '漳　县', '621100');
insert into AREA (id, aid, aname, cid)
values (2947, '621126', '岷　县', '621100');
insert into AREA (id, aid, aname, cid)
values (2948, '621201', '市辖区', '621200');
insert into AREA (id, aid, aname, cid)
values (2949, '621202', '武都区', '621200');
insert into AREA (id, aid, aname, cid)
values (2950, '621221', '成　县', '621200');
insert into AREA (id, aid, aname, cid)
values (2951, '621222', '文　县', '621200');
insert into AREA (id, aid, aname, cid)
values (2952, '621223', '宕昌县', '621200');
insert into AREA (id, aid, aname, cid)
values (2953, '621224', '康　县', '621200');
insert into AREA (id, aid, aname, cid)
values (2954, '621225', '西和县', '621200');
insert into AREA (id, aid, aname, cid)
values (2955, '621226', '礼　县', '621200');
insert into AREA (id, aid, aname, cid)
values (2956, '621227', '徽　县', '621200');
insert into AREA (id, aid, aname, cid)
values (2957, '621228', '两当县', '621200');
insert into AREA (id, aid, aname, cid)
values (2958, '622901', '临夏市', '622900');
commit;
prompt 1300 records committed...
insert into AREA (id, aid, aname, cid)
values (2959, '622921', '临夏县', '622900');
insert into AREA (id, aid, aname, cid)
values (2960, '622922', '康乐县', '622900');
insert into AREA (id, aid, aname, cid)
values (2961, '622923', '永靖县', '622900');
insert into AREA (id, aid, aname, cid)
values (2962, '622924', '广河县', '622900');
insert into AREA (id, aid, aname, cid)
values (2963, '622925', '和政县', '622900');
insert into AREA (id, aid, aname, cid)
values (2964, '622926', '东乡族自治县', '622900');
insert into AREA (id, aid, aname, cid)
values (2965, '622927', '积石山保安族东乡族撒拉族自治县', '622900');
insert into AREA (id, aid, aname, cid)
values (2966, '623001', '合作市', '623000');
insert into AREA (id, aid, aname, cid)
values (2967, '623021', '临潭县', '623000');
insert into AREA (id, aid, aname, cid)
values (2968, '623022', '卓尼县', '623000');
insert into AREA (id, aid, aname, cid)
values (2969, '623023', '舟曲县', '623000');
insert into AREA (id, aid, aname, cid)
values (2970, '623024', '迭部县', '623000');
insert into AREA (id, aid, aname, cid)
values (2971, '623025', '玛曲县', '623000');
insert into AREA (id, aid, aname, cid)
values (2972, '623026', '碌曲县', '623000');
insert into AREA (id, aid, aname, cid)
values (2973, '623027', '夏河县', '623000');
insert into AREA (id, aid, aname, cid)
values (2974, '630101', '市辖区', '630100');
insert into AREA (id, aid, aname, cid)
values (2975, '630102', '城东区', '630100');
insert into AREA (id, aid, aname, cid)
values (2976, '630103', '城中区', '630100');
insert into AREA (id, aid, aname, cid)
values (2977, '630104', '城西区', '630100');
insert into AREA (id, aid, aname, cid)
values (2978, '630105', '城北区', '630100');
insert into AREA (id, aid, aname, cid)
values (2979, '630121', '大通回族土族自治县', '630100');
insert into AREA (id, aid, aname, cid)
values (2980, '630122', '湟中县', '630100');
insert into AREA (id, aid, aname, cid)
values (2981, '630123', '湟源县', '630100');
insert into AREA (id, aid, aname, cid)
values (2982, '632121', '平安县', '632100');
insert into AREA (id, aid, aname, cid)
values (2983, '632122', '民和回族土族自治县', '632100');
insert into AREA (id, aid, aname, cid)
values (2984, '632123', '乐都县', '632100');
insert into AREA (id, aid, aname, cid)
values (2985, '632126', '互助土族自治县', '632100');
insert into AREA (id, aid, aname, cid)
values (2986, '632127', '化隆回族自治县', '632100');
insert into AREA (id, aid, aname, cid)
values (2987, '632128', '循化撒拉族自治县', '632100');
insert into AREA (id, aid, aname, cid)
values (2988, '632221', '门源回族自治县', '632200');
insert into AREA (id, aid, aname, cid)
values (2989, '632222', '祁连县', '632200');
insert into AREA (id, aid, aname, cid)
values (2990, '632223', '海晏县', '632200');
insert into AREA (id, aid, aname, cid)
values (2991, '632224', '刚察县', '632200');
insert into AREA (id, aid, aname, cid)
values (2992, '632321', '同仁县', '632300');
insert into AREA (id, aid, aname, cid)
values (2993, '632322', '尖扎县', '632300');
insert into AREA (id, aid, aname, cid)
values (2994, '632323', '泽库县', '632300');
insert into AREA (id, aid, aname, cid)
values (2995, '632324', '河南蒙古族自治县', '632300');
insert into AREA (id, aid, aname, cid)
values (2996, '632521', '共和县', '632500');
insert into AREA (id, aid, aname, cid)
values (2997, '632522', '同德县', '632500');
insert into AREA (id, aid, aname, cid)
values (2998, '632523', '贵德县', '632500');
insert into AREA (id, aid, aname, cid)
values (2999, '632524', '兴海县', '632500');
insert into AREA (id, aid, aname, cid)
values (3000, '632525', '贵南县', '632500');
insert into AREA (id, aid, aname, cid)
values (3001, '632621', '玛沁县', '632600');
insert into AREA (id, aid, aname, cid)
values (3002, '632622', '班玛县', '632600');
insert into AREA (id, aid, aname, cid)
values (3003, '632623', '甘德县', '632600');
insert into AREA (id, aid, aname, cid)
values (3004, '632624', '达日县', '632600');
insert into AREA (id, aid, aname, cid)
values (3005, '632625', '久治县', '632600');
insert into AREA (id, aid, aname, cid)
values (3006, '632626', '玛多县', '632600');
insert into AREA (id, aid, aname, cid)
values (3007, '632721', '玉树县', '632700');
insert into AREA (id, aid, aname, cid)
values (3008, '632722', '杂多县', '632700');
insert into AREA (id, aid, aname, cid)
values (3009, '632723', '称多县', '632700');
insert into AREA (id, aid, aname, cid)
values (3010, '632724', '治多县', '632700');
insert into AREA (id, aid, aname, cid)
values (3011, '632725', '囊谦县', '632700');
insert into AREA (id, aid, aname, cid)
values (3012, '632726', '曲麻莱县', '632700');
insert into AREA (id, aid, aname, cid)
values (3013, '632801', '格尔木市', '632800');
insert into AREA (id, aid, aname, cid)
values (3014, '632802', '德令哈市', '632800');
insert into AREA (id, aid, aname, cid)
values (3015, '632821', '乌兰县', '632800');
insert into AREA (id, aid, aname, cid)
values (3016, '632822', '都兰县', '632800');
insert into AREA (id, aid, aname, cid)
values (3017, '632823', '天峻县', '632800');
insert into AREA (id, aid, aname, cid)
values (3018, '640101', '市辖区', '640100');
insert into AREA (id, aid, aname, cid)
values (3019, '640104', '兴庆区', '640100');
insert into AREA (id, aid, aname, cid)
values (3020, '640105', '西夏区', '640100');
insert into AREA (id, aid, aname, cid)
values (3021, '640106', '金凤区', '640100');
insert into AREA (id, aid, aname, cid)
values (3022, '640121', '永宁县', '640100');
insert into AREA (id, aid, aname, cid)
values (3023, '640122', '贺兰县', '640100');
insert into AREA (id, aid, aname, cid)
values (3024, '640181', '灵武市', '640100');
insert into AREA (id, aid, aname, cid)
values (3025, '640201', '市辖区', '640200');
insert into AREA (id, aid, aname, cid)
values (3026, '640202', '大武口区', '640200');
insert into AREA (id, aid, aname, cid)
values (3027, '640205', '惠农区', '640200');
insert into AREA (id, aid, aname, cid)
values (3028, '640221', '平罗县', '640200');
insert into AREA (id, aid, aname, cid)
values (3029, '640301', '市辖区', '640300');
insert into AREA (id, aid, aname, cid)
values (3030, '640302', '利通区', '640300');
insert into AREA (id, aid, aname, cid)
values (3031, '640323', '盐池县', '640300');
insert into AREA (id, aid, aname, cid)
values (3032, '640324', '同心县', '640300');
insert into AREA (id, aid, aname, cid)
values (3033, '640381', '青铜峡市', '640300');
insert into AREA (id, aid, aname, cid)
values (3034, '640401', '市辖区', '640400');
insert into AREA (id, aid, aname, cid)
values (3035, '640402', '原州区', '640400');
insert into AREA (id, aid, aname, cid)
values (3036, '640422', '西吉县', '640400');
insert into AREA (id, aid, aname, cid)
values (3037, '640423', '隆德县', '640400');
insert into AREA (id, aid, aname, cid)
values (3038, '640424', '泾源县', '640400');
insert into AREA (id, aid, aname, cid)
values (3039, '640425', '彭阳县', '640400');
insert into AREA (id, aid, aname, cid)
values (3040, '640501', '市辖区', '640500');
insert into AREA (id, aid, aname, cid)
values (3041, '640502', '沙坡头区', '640500');
insert into AREA (id, aid, aname, cid)
values (3042, '640521', '中宁县', '640500');
insert into AREA (id, aid, aname, cid)
values (3043, '640522', '海原县', '640500');
insert into AREA (id, aid, aname, cid)
values (3044, '650101', '市辖区', '650100');
insert into AREA (id, aid, aname, cid)
values (3045, '650102', '天山区', '650100');
insert into AREA (id, aid, aname, cid)
values (3046, '650103', '沙依巴克区', '650100');
insert into AREA (id, aid, aname, cid)
values (3047, '650104', '新市区', '650100');
insert into AREA (id, aid, aname, cid)
values (3048, '650105', '水磨沟区', '650100');
insert into AREA (id, aid, aname, cid)
values (3049, '650106', '头屯河区', '650100');
insert into AREA (id, aid, aname, cid)
values (3050, '650107', '达坂城区', '650100');
insert into AREA (id, aid, aname, cid)
values (3051, '650108', '东山区', '650100');
insert into AREA (id, aid, aname, cid)
values (3052, '650121', '乌鲁木齐县', '650100');
insert into AREA (id, aid, aname, cid)
values (3053, '650201', '市辖区', '650200');
insert into AREA (id, aid, aname, cid)
values (3054, '650202', '独山子区', '650200');
insert into AREA (id, aid, aname, cid)
values (3055, '650203', '克拉玛依区', '650200');
insert into AREA (id, aid, aname, cid)
values (3056, '650204', '白碱滩区', '650200');
insert into AREA (id, aid, aname, cid)
values (3057, '650205', '乌尔禾区', '650200');
insert into AREA (id, aid, aname, cid)
values (3058, '652101', '吐鲁番市', '652100');
commit;
prompt 1400 records committed...
insert into AREA (id, aid, aname, cid)
values (3059, '652122', '鄯善县', '652100');
insert into AREA (id, aid, aname, cid)
values (3060, '652123', '托克逊县', '652100');
insert into AREA (id, aid, aname, cid)
values (3061, '652201', '哈密市', '652200');
insert into AREA (id, aid, aname, cid)
values (3062, '652222', '巴里坤哈萨克自治县', '652200');
insert into AREA (id, aid, aname, cid)
values (3063, '652223', '伊吾县', '652200');
insert into AREA (id, aid, aname, cid)
values (3064, '652301', '昌吉市', '652300');
insert into AREA (id, aid, aname, cid)
values (3065, '652302', '阜康市', '652300');
insert into AREA (id, aid, aname, cid)
values (3066, '652303', '米泉市', '652300');
insert into AREA (id, aid, aname, cid)
values (3067, '652323', '呼图壁县', '652300');
insert into AREA (id, aid, aname, cid)
values (3068, '652324', '玛纳斯县', '652300');
insert into AREA (id, aid, aname, cid)
values (3069, '652325', '奇台县', '652300');
insert into AREA (id, aid, aname, cid)
values (3070, '652327', '吉木萨尔县', '652300');
insert into AREA (id, aid, aname, cid)
values (3071, '652328', '木垒哈萨克自治县', '652300');
insert into AREA (id, aid, aname, cid)
values (3072, '652701', '博乐市', '652700');
insert into AREA (id, aid, aname, cid)
values (3073, '652722', '精河县', '652700');
insert into AREA (id, aid, aname, cid)
values (3074, '652723', '温泉县', '652700');
insert into AREA (id, aid, aname, cid)
values (3075, '652801', '库尔勒市', '652800');
insert into AREA (id, aid, aname, cid)
values (3076, '652822', '轮台县', '652800');
insert into AREA (id, aid, aname, cid)
values (3077, '652823', '尉犁县', '652800');
insert into AREA (id, aid, aname, cid)
values (3078, '652824', '若羌县', '652800');
insert into AREA (id, aid, aname, cid)
values (3079, '652825', '且末县', '652800');
insert into AREA (id, aid, aname, cid)
values (3080, '652826', '焉耆回族自治县', '652800');
insert into AREA (id, aid, aname, cid)
values (3081, '652827', '和静县', '652800');
insert into AREA (id, aid, aname, cid)
values (3082, '652828', '和硕县', '652800');
insert into AREA (id, aid, aname, cid)
values (3083, '652829', '博湖县', '652800');
insert into AREA (id, aid, aname, cid)
values (3084, '652901', '阿克苏市', '652900');
insert into AREA (id, aid, aname, cid)
values (1193, '350527', '金门县', '350500');
insert into AREA (id, aid, aname, cid)
values (1194, '350581', '石狮市', '350500');
insert into AREA (id, aid, aname, cid)
values (1195, '350582', '晋江市', '350500');
insert into AREA (id, aid, aname, cid)
values (1196, '350583', '南安市', '350500');
insert into AREA (id, aid, aname, cid)
values (1197, '350601', '市辖区', '350600');
insert into AREA (id, aid, aname, cid)
values (1198, '350602', '芗城区', '350600');
insert into AREA (id, aid, aname, cid)
values (1199, '350603', '龙文区', '350600');
insert into AREA (id, aid, aname, cid)
values (1200, '350622', '云霄县', '350600');
insert into AREA (id, aid, aname, cid)
values (1201, '350623', '漳浦县', '350600');
insert into AREA (id, aid, aname, cid)
values (1202, '350624', '诏安县', '350600');
insert into AREA (id, aid, aname, cid)
values (1203, '350625', '长泰县', '350600');
insert into AREA (id, aid, aname, cid)
values (1204, '350626', '东山县', '350600');
insert into AREA (id, aid, aname, cid)
values (1205, '350627', '南靖县', '350600');
insert into AREA (id, aid, aname, cid)
values (1206, '350628', '平和县', '350600');
insert into AREA (id, aid, aname, cid)
values (1207, '350629', '华安县', '350600');
insert into AREA (id, aid, aname, cid)
values (1208, '350681', '龙海市', '350600');
insert into AREA (id, aid, aname, cid)
values (1209, '350701', '市辖区', '350700');
insert into AREA (id, aid, aname, cid)
values (1210, '350702', '延平区', '350700');
insert into AREA (id, aid, aname, cid)
values (1211, '350721', '顺昌县', '350700');
insert into AREA (id, aid, aname, cid)
values (1212, '350722', '浦城县', '350700');
insert into AREA (id, aid, aname, cid)
values (1213, '350723', '光泽县', '350700');
insert into AREA (id, aid, aname, cid)
values (1214, '350724', '松溪县', '350700');
insert into AREA (id, aid, aname, cid)
values (1215, '350725', '政和县', '350700');
insert into AREA (id, aid, aname, cid)
values (1216, '350781', '邵武市', '350700');
insert into AREA (id, aid, aname, cid)
values (1217, '350782', '武夷山市', '350700');
insert into AREA (id, aid, aname, cid)
values (1218, '350783', '建瓯市', '350700');
insert into AREA (id, aid, aname, cid)
values (1219, '350784', '建阳市', '350700');
insert into AREA (id, aid, aname, cid)
values (1220, '350801', '市辖区', '350800');
insert into AREA (id, aid, aname, cid)
values (1221, '350802', '新罗区', '350800');
insert into AREA (id, aid, aname, cid)
values (1222, '350821', '长汀县', '350800');
insert into AREA (id, aid, aname, cid)
values (1223, '350822', '永定县', '350800');
insert into AREA (id, aid, aname, cid)
values (1224, '350823', '上杭县', '350800');
insert into AREA (id, aid, aname, cid)
values (1225, '350824', '武平县', '350800');
insert into AREA (id, aid, aname, cid)
values (1226, '350825', '连城县', '350800');
insert into AREA (id, aid, aname, cid)
values (1227, '350881', '漳平市', '350800');
insert into AREA (id, aid, aname, cid)
values (1228, '350901', '市辖区', '350900');
insert into AREA (id, aid, aname, cid)
values (1229, '350902', '蕉城区', '350900');
insert into AREA (id, aid, aname, cid)
values (1230, '350921', '霞浦县', '350900');
insert into AREA (id, aid, aname, cid)
values (1231, '350922', '古田县', '350900');
insert into AREA (id, aid, aname, cid)
values (1232, '350923', '屏南县', '350900');
insert into AREA (id, aid, aname, cid)
values (1233, '350924', '寿宁县', '350900');
insert into AREA (id, aid, aname, cid)
values (1234, '350925', '周宁县', '350900');
insert into AREA (id, aid, aname, cid)
values (1235, '350926', '柘荣县', '350900');
insert into AREA (id, aid, aname, cid)
values (1236, '350981', '福安市', '350900');
insert into AREA (id, aid, aname, cid)
values (1237, '350982', '福鼎市', '350900');
insert into AREA (id, aid, aname, cid)
values (1238, '360101', '市辖区', '360100');
insert into AREA (id, aid, aname, cid)
values (1239, '360102', '东湖区', '360100');
insert into AREA (id, aid, aname, cid)
values (1240, '360103', '西湖区', '360100');
insert into AREA (id, aid, aname, cid)
values (1241, '360104', '青云谱区', '360100');
insert into AREA (id, aid, aname, cid)
values (1242, '360105', '湾里区', '360100');
insert into AREA (id, aid, aname, cid)
values (1243, '360111', '青山湖区', '360100');
insert into AREA (id, aid, aname, cid)
values (1244, '360121', '南昌县', '360100');
insert into AREA (id, aid, aname, cid)
values (1245, '360122', '新建县', '360100');
insert into AREA (id, aid, aname, cid)
values (1246, '360123', '安义县', '360100');
insert into AREA (id, aid, aname, cid)
values (1247, '360124', '进贤县', '360100');
insert into AREA (id, aid, aname, cid)
values (1248, '360201', '市辖区', '360200');
insert into AREA (id, aid, aname, cid)
values (1249, '360202', '昌江区', '360200');
insert into AREA (id, aid, aname, cid)
values (1250, '360203', '珠山区', '360200');
insert into AREA (id, aid, aname, cid)
values (1251, '360222', '浮梁县', '360200');
insert into AREA (id, aid, aname, cid)
values (1252, '360281', '乐平市', '360200');
insert into AREA (id, aid, aname, cid)
values (1253, '360301', '市辖区', '360300');
insert into AREA (id, aid, aname, cid)
values (1254, '360302', '安源区', '360300');
insert into AREA (id, aid, aname, cid)
values (1255, '360313', '湘东区', '360300');
insert into AREA (id, aid, aname, cid)
values (1256, '360321', '莲花县', '360300');
insert into AREA (id, aid, aname, cid)
values (1257, '360322', '上栗县', '360300');
insert into AREA (id, aid, aname, cid)
values (1258, '360323', '芦溪县', '360300');
insert into AREA (id, aid, aname, cid)
values (1259, '360401', '市辖区', '360400');
insert into AREA (id, aid, aname, cid)
values (1260, '360402', '庐山区', '360400');
insert into AREA (id, aid, aname, cid)
values (1261, '360403', '浔阳区', '360400');
insert into AREA (id, aid, aname, cid)
values (1262, '360421', '九江县', '360400');
insert into AREA (id, aid, aname, cid)
values (1263, '360423', '武宁县', '360400');
insert into AREA (id, aid, aname, cid)
values (1264, '360424', '修水县', '360400');
insert into AREA (id, aid, aname, cid)
values (1265, '360425', '永修县', '360400');
insert into AREA (id, aid, aname, cid)
values (1266, '360426', '德安县', '360400');
commit;
prompt 1500 records committed...
insert into AREA (id, aid, aname, cid)
values (1267, '360427', '星子县', '360400');
insert into AREA (id, aid, aname, cid)
values (1268, '360428', '都昌县', '360400');
insert into AREA (id, aid, aname, cid)
values (1269, '360429', '湖口县', '360400');
insert into AREA (id, aid, aname, cid)
values (1270, '360430', '彭泽县', '360400');
insert into AREA (id, aid, aname, cid)
values (1271, '360481', '瑞昌市', '360400');
insert into AREA (id, aid, aname, cid)
values (1272, '360501', '市辖区', '360500');
insert into AREA (id, aid, aname, cid)
values (1273, '360502', '渝水区', '360500');
insert into AREA (id, aid, aname, cid)
values (1274, '360521', '分宜县', '360500');
insert into AREA (id, aid, aname, cid)
values (1275, '360601', '市辖区', '360600');
insert into AREA (id, aid, aname, cid)
values (1276, '360602', '月湖区', '360600');
insert into AREA (id, aid, aname, cid)
values (1277, '360622', '余江县', '360600');
insert into AREA (id, aid, aname, cid)
values (1278, '360681', '贵溪市', '360600');
insert into AREA (id, aid, aname, cid)
values (1279, '360701', '市辖区', '360700');
insert into AREA (id, aid, aname, cid)
values (1280, '360702', '章贡区', '360700');
insert into AREA (id, aid, aname, cid)
values (1281, '360721', '赣　县', '360700');
insert into AREA (id, aid, aname, cid)
values (1282, '360722', '信丰县', '360700');
insert into AREA (id, aid, aname, cid)
values (1283, '360723', '大余县', '360700');
insert into AREA (id, aid, aname, cid)
values (1284, '360724', '上犹县', '360700');
insert into AREA (id, aid, aname, cid)
values (1285, '360725', '崇义县', '360700');
insert into AREA (id, aid, aname, cid)
values (1286, '360726', '安远县', '360700');
insert into AREA (id, aid, aname, cid)
values (1287, '360727', '龙南县', '360700');
insert into AREA (id, aid, aname, cid)
values (1288, '360728', '定南县', '360700');
insert into AREA (id, aid, aname, cid)
values (1289, '360729', '全南县', '360700');
insert into AREA (id, aid, aname, cid)
values (1290, '360730', '宁都县', '360700');
insert into AREA (id, aid, aname, cid)
values (1291, '360731', '于都县', '360700');
insert into AREA (id, aid, aname, cid)
values (1292, '360732', '兴国县', '360700');
insert into AREA (id, aid, aname, cid)
values (1293, '360733', '会昌县', '360700');
insert into AREA (id, aid, aname, cid)
values (1294, '360734', '寻乌县', '360700');
insert into AREA (id, aid, aname, cid)
values (1295, '360735', '石城县', '360700');
insert into AREA (id, aid, aname, cid)
values (1296, '360781', '瑞金市', '360700');
insert into AREA (id, aid, aname, cid)
values (1297, '360782', '南康市', '360700');
insert into AREA (id, aid, aname, cid)
values (1298, '360801', '市辖区', '360800');
insert into AREA (id, aid, aname, cid)
values (1299, '360802', '吉州区', '360800');
insert into AREA (id, aid, aname, cid)
values (1300, '360803', '青原区', '360800');
insert into AREA (id, aid, aname, cid)
values (1301, '360821', '吉安县', '360800');
insert into AREA (id, aid, aname, cid)
values (1302, '360822', '吉水县', '360800');
insert into AREA (id, aid, aname, cid)
values (1303, '360823', '峡江县', '360800');
insert into AREA (id, aid, aname, cid)
values (1304, '360824', '新干县', '360800');
insert into AREA (id, aid, aname, cid)
values (1305, '360825', '永丰县', '360800');
insert into AREA (id, aid, aname, cid)
values (1306, '360826', '泰和县', '360800');
insert into AREA (id, aid, aname, cid)
values (1307, '360827', '遂川县', '360800');
insert into AREA (id, aid, aname, cid)
values (1308, '360828', '万安县', '360800');
insert into AREA (id, aid, aname, cid)
values (1309, '360829', '安福县', '360800');
insert into AREA (id, aid, aname, cid)
values (1310, '360830', '永新县', '360800');
insert into AREA (id, aid, aname, cid)
values (1311, '360881', '井冈山市', '360800');
insert into AREA (id, aid, aname, cid)
values (1312, '360901', '市辖区', '360900');
insert into AREA (id, aid, aname, cid)
values (1313, '360902', '袁州区', '360900');
insert into AREA (id, aid, aname, cid)
values (1314, '360921', '奉新县', '360900');
insert into AREA (id, aid, aname, cid)
values (1315, '360922', '万载县', '360900');
insert into AREA (id, aid, aname, cid)
values (1316, '360923', '上高县', '360900');
insert into AREA (id, aid, aname, cid)
values (1317, '360924', '宜丰县', '360900');
insert into AREA (id, aid, aname, cid)
values (1318, '360925', '靖安县', '360900');
insert into AREA (id, aid, aname, cid)
values (1319, '360926', '铜鼓县', '360900');
insert into AREA (id, aid, aname, cid)
values (1320, '360981', '丰城市', '360900');
insert into AREA (id, aid, aname, cid)
values (1321, '360982', '樟树市', '360900');
insert into AREA (id, aid, aname, cid)
values (1322, '360983', '高安市', '360900');
insert into AREA (id, aid, aname, cid)
values (1323, '361001', '市辖区', '361000');
insert into AREA (id, aid, aname, cid)
values (1324, '361002', '临川区', '361000');
insert into AREA (id, aid, aname, cid)
values (1325, '361021', '南城县', '361000');
insert into AREA (id, aid, aname, cid)
values (1326, '361022', '黎川县', '361000');
insert into AREA (id, aid, aname, cid)
values (1327, '361023', '南丰县', '361000');
insert into AREA (id, aid, aname, cid)
values (1328, '361024', '崇仁县', '361000');
insert into AREA (id, aid, aname, cid)
values (1329, '361025', '乐安县', '361000');
insert into AREA (id, aid, aname, cid)
values (1330, '361026', '宜黄县', '361000');
insert into AREA (id, aid, aname, cid)
values (1331, '361027', '金溪县', '361000');
insert into AREA (id, aid, aname, cid)
values (1332, '361028', '资溪县', '361000');
insert into AREA (id, aid, aname, cid)
values (1333, '361029', '东乡县', '361000');
insert into AREA (id, aid, aname, cid)
values (1334, '361030', '广昌县', '361000');
insert into AREA (id, aid, aname, cid)
values (1335, '361101', '市辖区', '361100');
insert into AREA (id, aid, aname, cid)
values (1336, '361102', '信州区', '361100');
insert into AREA (id, aid, aname, cid)
values (1337, '361121', '上饶县', '361100');
insert into AREA (id, aid, aname, cid)
values (1338, '361122', '广丰县', '361100');
insert into AREA (id, aid, aname, cid)
values (1339, '361123', '玉山县', '361100');
insert into AREA (id, aid, aname, cid)
values (1340, '361124', '铅山县', '361100');
insert into AREA (id, aid, aname, cid)
values (1341, '361125', '横峰县', '361100');
insert into AREA (id, aid, aname, cid)
values (1342, '361126', '弋阳县', '361100');
insert into AREA (id, aid, aname, cid)
values (1343, '361127', '余干县', '361100');
insert into AREA (id, aid, aname, cid)
values (1344, '361128', '鄱阳县', '361100');
insert into AREA (id, aid, aname, cid)
values (1345, '361129', '万年县', '361100');
insert into AREA (id, aid, aname, cid)
values (1346, '361130', '婺源县', '361100');
insert into AREA (id, aid, aname, cid)
values (1347, '361181', '德兴市', '361100');
insert into AREA (id, aid, aname, cid)
values (1348, '370101', '市辖区', '370100');
insert into AREA (id, aid, aname, cid)
values (1349, '370102', '历下区', '370100');
insert into AREA (id, aid, aname, cid)
values (1350, '370103', '市中区', '370100');
insert into AREA (id, aid, aname, cid)
values (1351, '370104', '槐荫区', '370100');
insert into AREA (id, aid, aname, cid)
values (1352, '370105', '天桥区', '370100');
insert into AREA (id, aid, aname, cid)
values (1353, '370112', '历城区', '370100');
insert into AREA (id, aid, aname, cid)
values (1354, '370113', '长清区', '370100');
insert into AREA (id, aid, aname, cid)
values (1355, '370124', '平阴县', '370100');
insert into AREA (id, aid, aname, cid)
values (1356, '370125', '济阳县', '370100');
insert into AREA (id, aid, aname, cid)
values (1357, '370126', '商河县', '370100');
insert into AREA (id, aid, aname, cid)
values (1358, '370181', '章丘市', '370100');
insert into AREA (id, aid, aname, cid)
values (1359, '370201', '市辖区', '370200');
insert into AREA (id, aid, aname, cid)
values (1360, '370202', '市南区', '370200');
insert into AREA (id, aid, aname, cid)
values (1361, '370203', '市北区', '370200');
insert into AREA (id, aid, aname, cid)
values (1362, '370205', '四方区', '370200');
insert into AREA (id, aid, aname, cid)
values (1363, '370211', '黄岛区', '370200');
insert into AREA (id, aid, aname, cid)
values (1364, '370212', '崂山区', '370200');
insert into AREA (id, aid, aname, cid)
values (1365, '370213', '李沧区', '370200');
insert into AREA (id, aid, aname, cid)
values (1366, '370214', '城阳区', '370200');
commit;
prompt 1600 records committed...
insert into AREA (id, aid, aname, cid)
values (1367, '370281', '胶州市', '370200');
insert into AREA (id, aid, aname, cid)
values (1368, '370282', '即墨市', '370200');
insert into AREA (id, aid, aname, cid)
values (1369, '370283', '平度市', '370200');
insert into AREA (id, aid, aname, cid)
values (1370, '370284', '胶南市', '370200');
insert into AREA (id, aid, aname, cid)
values (1371, '370285', '莱西市', '370200');
insert into AREA (id, aid, aname, cid)
values (1372, '370301', '市辖区', '370300');
insert into AREA (id, aid, aname, cid)
values (1373, '370302', '淄川区', '370300');
insert into AREA (id, aid, aname, cid)
values (1374, '370303', '张店区', '370300');
insert into AREA (id, aid, aname, cid)
values (1375, '370304', '博山区', '370300');
insert into AREA (id, aid, aname, cid)
values (1376, '370305', '临淄区', '370300');
insert into AREA (id, aid, aname, cid)
values (1377, '370306', '周村区', '370300');
insert into AREA (id, aid, aname, cid)
values (1378, '370321', '桓台县', '370300');
insert into AREA (id, aid, aname, cid)
values (1379, '370322', '高青县', '370300');
insert into AREA (id, aid, aname, cid)
values (1380, '370323', '沂源县', '370300');
insert into AREA (id, aid, aname, cid)
values (1381, '370401', '市辖区', '370400');
insert into AREA (id, aid, aname, cid)
values (1382, '370402', '市中区', '370400');
insert into AREA (id, aid, aname, cid)
values (1383, '370403', '薛城区', '370400');
insert into AREA (id, aid, aname, cid)
values (1384, '370404', '峄城区', '370400');
insert into AREA (id, aid, aname, cid)
values (1385, '370405', '台儿庄区', '370400');
insert into AREA (id, aid, aname, cid)
values (1386, '370406', '山亭区', '370400');
insert into AREA (id, aid, aname, cid)
values (1387, '370481', '滕州市', '370400');
insert into AREA (id, aid, aname, cid)
values (1388, '370501', '市辖区', '370500');
insert into AREA (id, aid, aname, cid)
values (1389, '370502', '东营区', '370500');
insert into AREA (id, aid, aname, cid)
values (1390, '370503', '河口区', '370500');
insert into AREA (id, aid, aname, cid)
values (1391, '370521', '垦利县', '370500');
insert into AREA (id, aid, aname, cid)
values (1392, '370522', '利津县', '370500');
insert into AREA (id, aid, aname, cid)
values (1393, '370523', '广饶县', '370500');
insert into AREA (id, aid, aname, cid)
values (1394, '370601', '市辖区', '370600');
insert into AREA (id, aid, aname, cid)
values (1395, '370602', '芝罘区', '370600');
insert into AREA (id, aid, aname, cid)
values (1396, '370611', '福山区', '370600');
insert into AREA (id, aid, aname, cid)
values (1397, '370612', '牟平区', '370600');
insert into AREA (id, aid, aname, cid)
values (1398, '370613', '莱山区', '370600');
insert into AREA (id, aid, aname, cid)
values (1399, '370634', '长岛县', '370600');
insert into AREA (id, aid, aname, cid)
values (1400, '370681', '龙口市', '370600');
insert into AREA (id, aid, aname, cid)
values (1401, '370682', '莱阳市', '370600');
insert into AREA (id, aid, aname, cid)
values (1402, '370683', '莱州市', '370600');
insert into AREA (id, aid, aname, cid)
values (1403, '370684', '蓬莱市', '370600');
insert into AREA (id, aid, aname, cid)
values (1404, '370685', '招远市', '370600');
insert into AREA (id, aid, aname, cid)
values (1405, '370686', '栖霞市', '370600');
insert into AREA (id, aid, aname, cid)
values (1406, '370687', '海阳市', '370600');
insert into AREA (id, aid, aname, cid)
values (1407, '370701', '市辖区', '370700');
insert into AREA (id, aid, aname, cid)
values (1408, '370702', '潍城区', '370700');
insert into AREA (id, aid, aname, cid)
values (1409, '370703', '寒亭区', '370700');
insert into AREA (id, aid, aname, cid)
values (1410, '370704', '坊子区', '370700');
insert into AREA (id, aid, aname, cid)
values (1411, '370705', '奎文区', '370700');
insert into AREA (id, aid, aname, cid)
values (1412, '370724', '临朐县', '370700');
insert into AREA (id, aid, aname, cid)
values (1413, '370725', '昌乐县', '370700');
insert into AREA (id, aid, aname, cid)
values (1414, '370781', '青州市', '370700');
insert into AREA (id, aid, aname, cid)
values (1415, '370782', '诸城市', '370700');
insert into AREA (id, aid, aname, cid)
values (1416, '370783', '寿光市', '370700');
insert into AREA (id, aid, aname, cid)
values (1417, '370784', '安丘市', '370700');
insert into AREA (id, aid, aname, cid)
values (1418, '370785', '高密市', '370700');
insert into AREA (id, aid, aname, cid)
values (1419, '370786', '昌邑市', '370700');
insert into AREA (id, aid, aname, cid)
values (1420, '370801', '市辖区', '370800');
insert into AREA (id, aid, aname, cid)
values (1421, '370802', '市中区', '370800');
insert into AREA (id, aid, aname, cid)
values (1422, '370811', '任城区', '370800');
insert into AREA (id, aid, aname, cid)
values (1423, '370826', '微山县', '370800');
insert into AREA (id, aid, aname, cid)
values (1424, '370827', '鱼台县', '370800');
insert into AREA (id, aid, aname, cid)
values (1425, '370828', '金乡县', '370800');
insert into AREA (id, aid, aname, cid)
values (1426, '370829', '嘉祥县', '370800');
insert into AREA (id, aid, aname, cid)
values (1427, '370830', '汶上县', '370800');
insert into AREA (id, aid, aname, cid)
values (1428, '370831', '泗水县', '370800');
insert into AREA (id, aid, aname, cid)
values (1429, '370832', '梁山县', '370800');
insert into AREA (id, aid, aname, cid)
values (1430, '370881', '曲阜市', '370800');
insert into AREA (id, aid, aname, cid)
values (1431, '370882', '兖州市', '370800');
insert into AREA (id, aid, aname, cid)
values (1432, '370883', '邹城市', '370800');
insert into AREA (id, aid, aname, cid)
values (1433, '370901', '市辖区', '370900');
insert into AREA (id, aid, aname, cid)
values (1434, '370902', '泰山区', '370900');
insert into AREA (id, aid, aname, cid)
values (1435, '370903', '岱岳区', '370900');
insert into AREA (id, aid, aname, cid)
values (1436, '370921', '宁阳县', '370900');
insert into AREA (id, aid, aname, cid)
values (1437, '370923', '东平县', '370900');
insert into AREA (id, aid, aname, cid)
values (1438, '370982', '新泰市', '370900');
insert into AREA (id, aid, aname, cid)
values (1439, '370983', '肥城市', '370900');
insert into AREA (id, aid, aname, cid)
values (1440, '371001', '市辖区', '371000');
insert into AREA (id, aid, aname, cid)
values (1441, '371002', '环翠区', '371000');
insert into AREA (id, aid, aname, cid)
values (1442, '371081', '文登市', '371000');
insert into AREA (id, aid, aname, cid)
values (1443, '371082', '荣成市', '371000');
insert into AREA (id, aid, aname, cid)
values (1444, '371083', '乳山市', '371000');
insert into AREA (id, aid, aname, cid)
values (1445, '371101', '市辖区', '371100');
insert into AREA (id, aid, aname, cid)
values (1446, '371102', '东港区', '371100');
insert into AREA (id, aid, aname, cid)
values (1447, '371103', '岚山区', '371100');
insert into AREA (id, aid, aname, cid)
values (1448, '371121', '五莲县', '371100');
insert into AREA (id, aid, aname, cid)
values (1449, '371122', '莒　县', '371100');
insert into AREA (id, aid, aname, cid)
values (1450, '371201', '市辖区', '371200');
insert into AREA (id, aid, aname, cid)
values (1451, '371202', '莱城区', '371200');
insert into AREA (id, aid, aname, cid)
values (1452, '371203', '钢城区', '371200');
insert into AREA (id, aid, aname, cid)
values (1453, '371301', '市辖区', '371300');
insert into AREA (id, aid, aname, cid)
values (1454, '371302', '兰山区', '371300');
insert into AREA (id, aid, aname, cid)
values (1455, '371311', '罗庄区', '371300');
insert into AREA (id, aid, aname, cid)
values (1456, '371312', '河东区', '371300');
insert into AREA (id, aid, aname, cid)
values (1457, '371321', '沂南县', '371300');
insert into AREA (id, aid, aname, cid)
values (1458, '371322', '郯城县', '371300');
insert into AREA (id, aid, aname, cid)
values (1459, '371323', '沂水县', '371300');
insert into AREA (id, aid, aname, cid)
values (1460, '371324', '苍山县', '371300');
insert into AREA (id, aid, aname, cid)
values (1461, '371325', '费　县', '371300');
insert into AREA (id, aid, aname, cid)
values (1462, '371326', '平邑县', '371300');
insert into AREA (id, aid, aname, cid)
values (1463, '371327', '莒南县', '371300');
insert into AREA (id, aid, aname, cid)
values (1464, '371328', '蒙阴县', '371300');
insert into AREA (id, aid, aname, cid)
values (1465, '371329', '临沭县', '371300');
insert into AREA (id, aid, aname, cid)
values (1466, '371401', '市辖区', '371400');
commit;
prompt 1700 records committed...
insert into AREA (id, aid, aname, cid)
values (1467, '371402', '德城区', '371400');
insert into AREA (id, aid, aname, cid)
values (1468, '371421', '陵　县', '371400');
insert into AREA (id, aid, aname, cid)
values (1469, '371422', '宁津县', '371400');
insert into AREA (id, aid, aname, cid)
values (1470, '371423', '庆云县', '371400');
insert into AREA (id, aid, aname, cid)
values (1471, '371424', '临邑县', '371400');
insert into AREA (id, aid, aname, cid)
values (1472, '371425', '齐河县', '371400');
insert into AREA (id, aid, aname, cid)
values (1473, '371426', '平原县', '371400');
insert into AREA (id, aid, aname, cid)
values (1474, '371427', '夏津县', '371400');
insert into AREA (id, aid, aname, cid)
values (1475, '371428', '武城县', '371400');
insert into AREA (id, aid, aname, cid)
values (1476, '371481', '乐陵市', '371400');
insert into AREA (id, aid, aname, cid)
values (1477, '371482', '禹城市', '371400');
insert into AREA (id, aid, aname, cid)
values (1478, '371501', '市辖区', '371500');
insert into AREA (id, aid, aname, cid)
values (1479, '371502', '东昌府区', '371500');
insert into AREA (id, aid, aname, cid)
values (1480, '371521', '阳谷县', '371500');
insert into AREA (id, aid, aname, cid)
values (1481, '371522', '莘　县', '371500');
insert into AREA (id, aid, aname, cid)
values (1482, '371523', '茌平县', '371500');
insert into AREA (id, aid, aname, cid)
values (1483, '371524', '东阿县', '371500');
insert into AREA (id, aid, aname, cid)
values (1484, '371525', '冠　县', '371500');
insert into AREA (id, aid, aname, cid)
values (1485, '371526', '高唐县', '371500');
insert into AREA (id, aid, aname, cid)
values (1486, '371581', '临清市', '371500');
insert into AREA (id, aid, aname, cid)
values (1487, '371601', '市辖区', '371600');
insert into AREA (id, aid, aname, cid)
values (1488, '371602', '滨城区', '371600');
insert into AREA (id, aid, aname, cid)
values (1489, '371621', '惠民县', '371600');
insert into AREA (id, aid, aname, cid)
values (1490, '371622', '阳信县', '371600');
insert into AREA (id, aid, aname, cid)
values (1491, '371623', '无棣县', '371600');
insert into AREA (id, aid, aname, cid)
values (1492, '371624', '沾化县', '371600');
insert into AREA (id, aid, aname, cid)
values (1493, '371625', '博兴县', '371600');
insert into AREA (id, aid, aname, cid)
values (1494, '371626', '邹平县', '371600');
insert into AREA (id, aid, aname, cid)
values (1495, '371701', '市辖区', '371700');
insert into AREA (id, aid, aname, cid)
values (1496, '371702', '牡丹区', '371700');
insert into AREA (id, aid, aname, cid)
values (1497, '371721', '曹　县', '371700');
insert into AREA (id, aid, aname, cid)
values (1498, '371722', '单　县', '371700');
insert into AREA (id, aid, aname, cid)
values (1499, '371723', '成武县', '371700');
insert into AREA (id, aid, aname, cid)
values (1500, '371724', '巨野县', '371700');
insert into AREA (id, aid, aname, cid)
values (1501, '371725', '郓城县', '371700');
insert into AREA (id, aid, aname, cid)
values (1502, '371726', '鄄城县', '371700');
insert into AREA (id, aid, aname, cid)
values (1503, '371727', '定陶县', '371700');
insert into AREA (id, aid, aname, cid)
values (1504, '371728', '东明县', '371700');
insert into AREA (id, aid, aname, cid)
values (1505, '410101', '市辖区', '410100');
insert into AREA (id, aid, aname, cid)
values (1506, '410102', '中原区', '410100');
insert into AREA (id, aid, aname, cid)
values (1507, '410103', '二七区', '410100');
insert into AREA (id, aid, aname, cid)
values (1508, '410104', '管城回族区', '410100');
insert into AREA (id, aid, aname, cid)
values (1509, '410105', '金水区', '410100');
insert into AREA (id, aid, aname, cid)
values (1510, '410106', '上街区', '410100');
insert into AREA (id, aid, aname, cid)
values (1511, '410108', '邙山区', '410100');
insert into AREA (id, aid, aname, cid)
values (1512, '410122', '中牟县', '410100');
insert into AREA (id, aid, aname, cid)
values (1513, '410181', '巩义市', '410100');
insert into AREA (id, aid, aname, cid)
values (1514, '410182', '荥阳市', '410100');
insert into AREA (id, aid, aname, cid)
values (1515, '410183', '新密市', '410100');
insert into AREA (id, aid, aname, cid)
values (1516, '410184', '新郑市', '410100');
insert into AREA (id, aid, aname, cid)
values (1517, '410185', '登封市', '410100');
insert into AREA (id, aid, aname, cid)
values (1518, '410201', '市辖区', '410200');
insert into AREA (id, aid, aname, cid)
values (1519, '410202', '龙亭区', '410200');
insert into AREA (id, aid, aname, cid)
values (1520, '410203', '顺河回族区', '410200');
insert into AREA (id, aid, aname, cid)
values (1521, '410204', '鼓楼区', '410200');
insert into AREA (id, aid, aname, cid)
values (1522, '410205', '南关区', '410200');
insert into AREA (id, aid, aname, cid)
values (1523, '410211', '郊　区', '410200');
insert into AREA (id, aid, aname, cid)
values (1524, '410221', '杞　县', '410200');
insert into AREA (id, aid, aname, cid)
values (1525, '410222', '通许县', '410200');
insert into AREA (id, aid, aname, cid)
values (1526, '410223', '尉氏县', '410200');
insert into AREA (id, aid, aname, cid)
values (1527, '410224', '开封县', '410200');
insert into AREA (id, aid, aname, cid)
values (1528, '410225', '兰考县', '410200');
insert into AREA (id, aid, aname, cid)
values (1529, '410301', '市辖区', '410300');
insert into AREA (id, aid, aname, cid)
values (1530, '410302', '老城区', '410300');
insert into AREA (id, aid, aname, cid)
values (1531, '410303', '西工区', '410300');
insert into AREA (id, aid, aname, cid)
values (1532, '410304', '廛河回族区', '410300');
insert into AREA (id, aid, aname, cid)
values (1533, '410305', '涧西区', '410300');
insert into AREA (id, aid, aname, cid)
values (1534, '410306', '吉利区', '410300');
insert into AREA (id, aid, aname, cid)
values (1535, '410307', '洛龙区', '410300');
insert into AREA (id, aid, aname, cid)
values (1536, '410322', '孟津县', '410300');
insert into AREA (id, aid, aname, cid)
values (1537, '410323', '新安县', '410300');
insert into AREA (id, aid, aname, cid)
values (1538, '410324', '栾川县', '410300');
insert into AREA (id, aid, aname, cid)
values (1539, '410325', '嵩　县', '410300');
insert into AREA (id, aid, aname, cid)
values (1540, '410326', '汝阳县', '410300');
insert into AREA (id, aid, aname, cid)
values (1541, '410327', '宜阳县', '410300');
insert into AREA (id, aid, aname, cid)
values (1542, '410328', '洛宁县', '410300');
insert into AREA (id, aid, aname, cid)
values (1543, '410329', '伊川县', '410300');
insert into AREA (id, aid, aname, cid)
values (1544, '410381', '偃师市', '410300');
insert into AREA (id, aid, aname, cid)
values (1545, '410401', '市辖区', '410400');
insert into AREA (id, aid, aname, cid)
values (1546, '410402', '新华区', '410400');
insert into AREA (id, aid, aname, cid)
values (1547, '410403', '卫东区', '410400');
insert into AREA (id, aid, aname, cid)
values (1548, '410404', '石龙区', '410400');
insert into AREA (id, aid, aname, cid)
values (1549, '410411', '湛河区', '410400');
insert into AREA (id, aid, aname, cid)
values (1550, '410421', '宝丰县', '410400');
insert into AREA (id, aid, aname, cid)
values (1551, '410422', '叶　县', '410400');
insert into AREA (id, aid, aname, cid)
values (1552, '410423', '鲁山县', '410400');
insert into AREA (id, aid, aname, cid)
values (1553, '410425', '郏　县', '410400');
insert into AREA (id, aid, aname, cid)
values (1554, '410481', '舞钢市', '410400');
insert into AREA (id, aid, aname, cid)
values (1555, '410482', '汝州市', '410400');
insert into AREA (id, aid, aname, cid)
values (1556, '410501', '市辖区', '410500');
insert into AREA (id, aid, aname, cid)
values (1557, '410502', '文峰区', '410500');
insert into AREA (id, aid, aname, cid)
values (1558, '410503', '北关区', '410500');
insert into AREA (id, aid, aname, cid)
values (1559, '410505', '殷都区', '410500');
insert into AREA (id, aid, aname, cid)
values (1560, '410506', '龙安区', '410500');
insert into AREA (id, aid, aname, cid)
values (1561, '410522', '安阳县', '410500');
insert into AREA (id, aid, aname, cid)
values (1562, '410523', '汤阴县', '410500');
insert into AREA (id, aid, aname, cid)
values (1563, '410526', '滑　县', '410500');
insert into AREA (id, aid, aname, cid)
values (1564, '410527', '内黄县', '410500');
insert into AREA (id, aid, aname, cid)
values (1565, '410581', '林州市', '410500');
insert into AREA (id, aid, aname, cid)
values (1566, '410601', '市辖区', '410600');
commit;
prompt 1800 records committed...
insert into AREA (id, aid, aname, cid)
values (1567, '410602', '鹤山区', '410600');
insert into AREA (id, aid, aname, cid)
values (1568, '410603', '山城区', '410600');
insert into AREA (id, aid, aname, cid)
values (1569, '410611', '淇滨区', '410600');
insert into AREA (id, aid, aname, cid)
values (1570, '410621', '浚　县', '410600');
insert into AREA (id, aid, aname, cid)
values (1571, '410622', '淇　县', '410600');
insert into AREA (id, aid, aname, cid)
values (1572, '410701', '市辖区', '410700');
insert into AREA (id, aid, aname, cid)
values (1573, '410702', '红旗区', '410700');
insert into AREA (id, aid, aname, cid)
values (1574, '410703', '卫滨区', '410700');
insert into AREA (id, aid, aname, cid)
values (1575, '410704', '凤泉区', '410700');
insert into AREA (id, aid, aname, cid)
values (1576, '410711', '牧野区', '410700');
insert into AREA (id, aid, aname, cid)
values (1577, '410721', '新乡县', '410700');
insert into AREA (id, aid, aname, cid)
values (1578, '410724', '获嘉县', '410700');
insert into AREA (id, aid, aname, cid)
values (1579, '410725', '原阳县', '410700');
insert into AREA (id, aid, aname, cid)
values (1580, '410726', '延津县', '410700');
insert into AREA (id, aid, aname, cid)
values (1581, '410727', '封丘县', '410700');
insert into AREA (id, aid, aname, cid)
values (1582, '410728', '长垣县', '410700');
insert into AREA (id, aid, aname, cid)
values (1583, '410781', '卫辉市', '410700');
insert into AREA (id, aid, aname, cid)
values (1584, '410782', '辉县市', '410700');
insert into AREA (id, aid, aname, cid)
values (1585, '410801', '市辖区', '410800');
insert into AREA (id, aid, aname, cid)
values (1586, '410802', '解放区', '410800');
insert into AREA (id, aid, aname, cid)
values (1587, '410803', '中站区', '410800');
insert into AREA (id, aid, aname, cid)
values (1588, '410804', '马村区', '410800');
insert into AREA (id, aid, aname, cid)
values (1589, '410811', '山阳区', '410800');
insert into AREA (id, aid, aname, cid)
values (1590, '410821', '修武县', '410800');
insert into AREA (id, aid, aname, cid)
values (1591, '410822', '博爱县', '410800');
insert into AREA (id, aid, aname, cid)
values (1592, '410823', '武陟县', '410800');
insert into AREA (id, aid, aname, cid)
values (1593, '410825', '温　县', '410800');
insert into AREA (id, aid, aname, cid)
values (1594, '410881', '济源市', '410800');
insert into AREA (id, aid, aname, cid)
values (1595, '410882', '沁阳市', '410800');
insert into AREA (id, aid, aname, cid)
values (1596, '410883', '孟州市', '410800');
insert into AREA (id, aid, aname, cid)
values (1597, '410901', '市辖区', '410900');
insert into AREA (id, aid, aname, cid)
values (1598, '410902', '华龙区', '410900');
insert into AREA (id, aid, aname, cid)
values (1599, '410922', '清丰县', '410900');
insert into AREA (id, aid, aname, cid)
values (1600, '410923', '南乐县', '410900');
insert into AREA (id, aid, aname, cid)
values (1601, '410926', '范　县', '410900');
insert into AREA (id, aid, aname, cid)
values (1602, '410927', '台前县', '410900');
insert into AREA (id, aid, aname, cid)
values (1603, '410928', '濮阳县', '410900');
insert into AREA (id, aid, aname, cid)
values (1604, '411001', '市辖区', '411000');
insert into AREA (id, aid, aname, cid)
values (1605, '411002', '魏都区', '411000');
insert into AREA (id, aid, aname, cid)
values (1606, '411023', '许昌县', '411000');
insert into AREA (id, aid, aname, cid)
values (1607, '411024', '鄢陵县', '411000');
insert into AREA (id, aid, aname, cid)
values (1608, '411025', '襄城县', '411000');
insert into AREA (id, aid, aname, cid)
values (1609, '411081', '禹州市', '411000');
insert into AREA (id, aid, aname, cid)
values (1610, '411082', '长葛市', '411000');
insert into AREA (id, aid, aname, cid)
values (1611, '411101', '市辖区', '411100');
insert into AREA (id, aid, aname, cid)
values (1612, '411102', '源汇区', '411100');
insert into AREA (id, aid, aname, cid)
values (1613, '411103', '郾城区', '411100');
insert into AREA (id, aid, aname, cid)
values (1614, '411104', '召陵区', '411100');
insert into AREA (id, aid, aname, cid)
values (1615, '411121', '舞阳县', '411100');
insert into AREA (id, aid, aname, cid)
values (1616, '411122', '临颍县', '411100');
insert into AREA (id, aid, aname, cid)
values (1617, '411201', '市辖区', '411200');
insert into AREA (id, aid, aname, cid)
values (1618, '411202', '湖滨区', '411200');
insert into AREA (id, aid, aname, cid)
values (1619, '411221', '渑池县', '411200');
insert into AREA (id, aid, aname, cid)
values (1620, '411222', '陕　县', '411200');
insert into AREA (id, aid, aname, cid)
values (1621, '411224', '卢氏县', '411200');
insert into AREA (id, aid, aname, cid)
values (1622, '411281', '义马市', '411200');
insert into AREA (id, aid, aname, cid)
values (1623, '411282', '灵宝市', '411200');
insert into AREA (id, aid, aname, cid)
values (1624, '411301', '市辖区', '411300');
insert into AREA (id, aid, aname, cid)
values (1625, '411302', '宛城区', '411300');
insert into AREA (id, aid, aname, cid)
values (1626, '411303', '卧龙区', '411300');
insert into AREA (id, aid, aname, cid)
values (1627, '411321', '南召县', '411300');
insert into AREA (id, aid, aname, cid)
values (1628, '411322', '方城县', '411300');
insert into AREA (id, aid, aname, cid)
values (1629, '411323', '西峡县', '411300');
insert into AREA (id, aid, aname, cid)
values (1630, '411324', '镇平县', '411300');
insert into AREA (id, aid, aname, cid)
values (1631, '411325', '内乡县', '411300');
insert into AREA (id, aid, aname, cid)
values (1632, '411326', '淅川县', '411300');
insert into AREA (id, aid, aname, cid)
values (1633, '411327', '社旗县', '411300');
insert into AREA (id, aid, aname, cid)
values (1634, '411328', '唐河县', '411300');
insert into AREA (id, aid, aname, cid)
values (1635, '411329', '新野县', '411300');
insert into AREA (id, aid, aname, cid)
values (1636, '411330', '桐柏县', '411300');
insert into AREA (id, aid, aname, cid)
values (1637, '411381', '邓州市', '411300');
insert into AREA (id, aid, aname, cid)
values (1638, '411401', '市辖区', '411400');
insert into AREA (id, aid, aname, cid)
values (1639, '411402', '梁园区', '411400');
insert into AREA (id, aid, aname, cid)
values (1640, '411403', '睢阳区', '411400');
insert into AREA (id, aid, aname, cid)
values (1641, '411421', '民权县', '411400');
insert into AREA (id, aid, aname, cid)
values (1642, '411422', '睢　县', '411400');
insert into AREA (id, aid, aname, cid)
values (1643, '411423', '宁陵县', '411400');
insert into AREA (id, aid, aname, cid)
values (1644, '411424', '柘城县', '411400');
insert into AREA (id, aid, aname, cid)
values (1645, '411425', '虞城县', '411400');
insert into AREA (id, aid, aname, cid)
values (1646, '411426', '夏邑县', '411400');
insert into AREA (id, aid, aname, cid)
values (1647, '411481', '永城市', '411400');
insert into AREA (id, aid, aname, cid)
values (1648, '411501', '市辖区', '411500');
insert into AREA (id, aid, aname, cid)
values (1649, '411502', '师河区', '411500');
insert into AREA (id, aid, aname, cid)
values (1650, '411503', '平桥区', '411500');
insert into AREA (id, aid, aname, cid)
values (1651, '411521', '罗山县', '411500');
insert into AREA (id, aid, aname, cid)
values (1652, '411522', '光山县', '411500');
insert into AREA (id, aid, aname, cid)
values (1653, '411523', '新　县', '411500');
insert into AREA (id, aid, aname, cid)
values (1654, '411524', '商城县', '411500');
insert into AREA (id, aid, aname, cid)
values (1655, '411525', '固始县', '411500');
insert into AREA (id, aid, aname, cid)
values (1656, '411526', '潢川县', '411500');
insert into AREA (id, aid, aname, cid)
values (1657, '411527', '淮滨县', '411500');
insert into AREA (id, aid, aname, cid)
values (1658, '411528', '息　县', '411500');
insert into AREA (id, aid, aname, cid)
values (1659, '411601', '市辖区', '411600');
insert into AREA (id, aid, aname, cid)
values (1660, '411602', '川汇区', '411600');
insert into AREA (id, aid, aname, cid)
values (1661, '411621', '扶沟县', '411600');
insert into AREA (id, aid, aname, cid)
values (1662, '411622', '西华县', '411600');
insert into AREA (id, aid, aname, cid)
values (1663, '411623', '商水县', '411600');
insert into AREA (id, aid, aname, cid)
values (1664, '411624', '沈丘县', '411600');
insert into AREA (id, aid, aname, cid)
values (1665, '411625', '郸城县', '411600');
insert into AREA (id, aid, aname, cid)
values (1666, '411626', '淮阳县', '411600');
commit;
prompt 1900 records committed...
insert into AREA (id, aid, aname, cid)
values (1667, '411627', '太康县', '411600');
insert into AREA (id, aid, aname, cid)
values (1668, '411628', '鹿邑县', '411600');
insert into AREA (id, aid, aname, cid)
values (1669, '411681', '项城市', '411600');
insert into AREA (id, aid, aname, cid)
values (1670, '411701', '市辖区', '411700');
insert into AREA (id, aid, aname, cid)
values (1671, '411702', '驿城区', '411700');
insert into AREA (id, aid, aname, cid)
values (1672, '411721', '西平县', '411700');
insert into AREA (id, aid, aname, cid)
values (1673, '411722', '上蔡县', '411700');
insert into AREA (id, aid, aname, cid)
values (1674, '411723', '平舆县', '411700');
insert into AREA (id, aid, aname, cid)
values (1675, '411724', '正阳县', '411700');
insert into AREA (id, aid, aname, cid)
values (1676, '411725', '确山县', '411700');
insert into AREA (id, aid, aname, cid)
values (1677, '411726', '泌阳县', '411700');
insert into AREA (id, aid, aname, cid)
values (1678, '411727', '汝南县', '411700');
insert into AREA (id, aid, aname, cid)
values (1679, '411728', '遂平县', '411700');
insert into AREA (id, aid, aname, cid)
values (1680, '411729', '新蔡县', '411700');
insert into AREA (id, aid, aname, cid)
values (1681, '420101', '市辖区', '420100');
insert into AREA (id, aid, aname, cid)
values (1682, '420102', '江岸区', '420100');
insert into AREA (id, aid, aname, cid)
values (1683, '420103', '江汉区', '420100');
insert into AREA (id, aid, aname, cid)
values (1684, '420104', '乔口区', '420100');
insert into AREA (id, aid, aname, cid)
values (1685, '420105', '汉阳区', '420100');
insert into AREA (id, aid, aname, cid)
values (1686, '420106', '武昌区', '420100');
insert into AREA (id, aid, aname, cid)
values (1687, '420107', '青山区', '420100');
insert into AREA (id, aid, aname, cid)
values (1688, '420111', '洪山区', '420100');
insert into AREA (id, aid, aname, cid)
values (1689, '420112', '东西湖区', '420100');
insert into AREA (id, aid, aname, cid)
values (1690, '420113', '汉南区', '420100');
insert into AREA (id, aid, aname, cid)
values (1691, '420114', '蔡甸区', '420100');
insert into AREA (id, aid, aname, cid)
values (1692, '420115', '江夏区', '420100');
insert into AREA (id, aid, aname, cid)
values (1693, '420116', '黄陂区', '420100');
insert into AREA (id, aid, aname, cid)
values (1694, '420117', '新洲区', '420100');
insert into AREA (id, aid, aname, cid)
values (1695, '420201', '市辖区', '420200');
insert into AREA (id, aid, aname, cid)
values (1696, '420202', '黄石港区', '420200');
insert into AREA (id, aid, aname, cid)
values (1697, '420203', '西塞山区', '420200');
insert into AREA (id, aid, aname, cid)
values (1698, '420204', '下陆区', '420200');
insert into AREA (id, aid, aname, cid)
values (1699, '420205', '铁山区', '420200');
insert into AREA (id, aid, aname, cid)
values (1700, '420222', '阳新县', '420200');
insert into AREA (id, aid, aname, cid)
values (1701, '420281', '大冶市', '420200');
insert into AREA (id, aid, aname, cid)
values (1702, '420301', '市辖区', '420300');
insert into AREA (id, aid, aname, cid)
values (1703, '420302', '茅箭区', '420300');
insert into AREA (id, aid, aname, cid)
values (1704, '420303', '张湾区', '420300');
insert into AREA (id, aid, aname, cid)
values (1705, '420321', '郧　县', '420300');
insert into AREA (id, aid, aname, cid)
values (1706, '420322', '郧西县', '420300');
insert into AREA (id, aid, aname, cid)
values (1707, '420323', '竹山县', '420300');
insert into AREA (id, aid, aname, cid)
values (1708, '420324', '竹溪县', '420300');
insert into AREA (id, aid, aname, cid)
values (1709, '420325', '房　县', '420300');
insert into AREA (id, aid, aname, cid)
values (1710, '420381', '丹江口市', '420300');
insert into AREA (id, aid, aname, cid)
values (1711, '420501', '市辖区', '420500');
insert into AREA (id, aid, aname, cid)
values (1712, '420502', '西陵区', '420500');
insert into AREA (id, aid, aname, cid)
values (1713, '420503', '伍家岗区', '420500');
insert into AREA (id, aid, aname, cid)
values (1714, '420504', '点军区', '420500');
insert into AREA (id, aid, aname, cid)
values (1715, '420505', '猇亭区', '420500');
insert into AREA (id, aid, aname, cid)
values (1716, '420506', '夷陵区', '420500');
insert into AREA (id, aid, aname, cid)
values (1717, '420525', '远安县', '420500');
insert into AREA (id, aid, aname, cid)
values (1718, '420526', '兴山县', '420500');
insert into AREA (id, aid, aname, cid)
values (1719, '420527', '秭归县', '420500');
insert into AREA (id, aid, aname, cid)
values (1720, '420528', '长阳土家族自治县', '420500');
insert into AREA (id, aid, aname, cid)
values (1721, '420529', '五峰土家族自治县', '420500');
insert into AREA (id, aid, aname, cid)
values (1722, '420581', '宜都市', '420500');
insert into AREA (id, aid, aname, cid)
values (1723, '420582', '当阳市', '420500');
insert into AREA (id, aid, aname, cid)
values (1724, '420583', '枝江市', '420500');
insert into AREA (id, aid, aname, cid)
values (1725, '420601', '市辖区', '420600');
insert into AREA (id, aid, aname, cid)
values (1726, '420602', '襄城区', '420600');
insert into AREA (id, aid, aname, cid)
values (1727, '420606', '樊城区', '420600');
insert into AREA (id, aid, aname, cid)
values (1728, '420607', '襄阳区', '420600');
insert into AREA (id, aid, aname, cid)
values (1729, '420624', '南漳县', '420600');
insert into AREA (id, aid, aname, cid)
values (1730, '420625', '谷城县', '420600');
insert into AREA (id, aid, aname, cid)
values (1731, '420626', '保康县', '420600');
insert into AREA (id, aid, aname, cid)
values (1732, '420682', '老河口市', '420600');
insert into AREA (id, aid, aname, cid)
values (1733, '420683', '枣阳市', '420600');
insert into AREA (id, aid, aname, cid)
values (1734, '420684', '宜城市', '420600');
insert into AREA (id, aid, aname, cid)
values (1735, '420701', '市辖区', '420700');
insert into AREA (id, aid, aname, cid)
values (1736, '420702', '梁子湖区', '420700');
insert into AREA (id, aid, aname, cid)
values (1737, '420703', '华容区', '420700');
insert into AREA (id, aid, aname, cid)
values (1738, '420704', '鄂城区', '420700');
insert into AREA (id, aid, aname, cid)
values (1739, '420801', '市辖区', '420800');
insert into AREA (id, aid, aname, cid)
values (1740, '420802', '东宝区', '420800');
insert into AREA (id, aid, aname, cid)
values (1741, '420804', '掇刀区', '420800');
insert into AREA (id, aid, aname, cid)
values (1742, '420821', '京山县', '420800');
insert into AREA (id, aid, aname, cid)
values (1743, '420822', '沙洋县', '420800');
insert into AREA (id, aid, aname, cid)
values (1744, '420881', '钟祥市', '420800');
insert into AREA (id, aid, aname, cid)
values (1745, '420901', '市辖区', '420900');
insert into AREA (id, aid, aname, cid)
values (1746, '420902', '孝南区', '420900');
insert into AREA (id, aid, aname, cid)
values (1747, '420921', '孝昌县', '420900');
insert into AREA (id, aid, aname, cid)
values (1748, '420922', '大悟县', '420900');
insert into AREA (id, aid, aname, cid)
values (1749, '420923', '云梦县', '420900');
insert into AREA (id, aid, aname, cid)
values (1750, '420981', '应城市', '420900');
insert into AREA (id, aid, aname, cid)
values (1751, '420982', '安陆市', '420900');
insert into AREA (id, aid, aname, cid)
values (1752, '420984', '汉川市', '420900');
insert into AREA (id, aid, aname, cid)
values (1753, '421001', '市辖区', '421000');
insert into AREA (id, aid, aname, cid)
values (1754, '421002', '沙市区', '421000');
insert into AREA (id, aid, aname, cid)
values (1755, '421003', '荆州区', '421000');
insert into AREA (id, aid, aname, cid)
values (1756, '421022', '公安县', '421000');
insert into AREA (id, aid, aname, cid)
values (1757, '421023', '监利县', '421000');
insert into AREA (id, aid, aname, cid)
values (1758, '421024', '江陵县', '421000');
insert into AREA (id, aid, aname, cid)
values (1759, '421081', '石首市', '421000');
insert into AREA (id, aid, aname, cid)
values (1760, '421083', '洪湖市', '421000');
insert into AREA (id, aid, aname, cid)
values (1761, '421087', '松滋市', '421000');
insert into AREA (id, aid, aname, cid)
values (1762, '421101', '市辖区', '421100');
insert into AREA (id, aid, aname, cid)
values (1763, '421102', '黄州区', '421100');
insert into AREA (id, aid, aname, cid)
values (1764, '421121', '团风县', '421100');
insert into AREA (id, aid, aname, cid)
values (1765, '421122', '红安县', '421100');
insert into AREA (id, aid, aname, cid)
values (1766, '421123', '罗田县', '421100');
commit;
prompt 2000 records committed...
insert into AREA (id, aid, aname, cid)
values (1767, '421124', '英山县', '421100');
insert into AREA (id, aid, aname, cid)
values (1768, '421125', '浠水县', '421100');
insert into AREA (id, aid, aname, cid)
values (1769, '421126', '蕲春县', '421100');
insert into AREA (id, aid, aname, cid)
values (1770, '421127', '黄梅县', '421100');
insert into AREA (id, aid, aname, cid)
values (1771, '421181', '麻城市', '421100');
insert into AREA (id, aid, aname, cid)
values (1772, '421182', '武穴市', '421100');
insert into AREA (id, aid, aname, cid)
values (1773, '421201', '市辖区', '421200');
insert into AREA (id, aid, aname, cid)
values (1774, '421202', '咸安区', '421200');
insert into AREA (id, aid, aname, cid)
values (1775, '421221', '嘉鱼县', '421200');
insert into AREA (id, aid, aname, cid)
values (1776, '421222', '通城县', '421200');
insert into AREA (id, aid, aname, cid)
values (1777, '421223', '崇阳县', '421200');
insert into AREA (id, aid, aname, cid)
values (1778, '421224', '通山县', '421200');
insert into AREA (id, aid, aname, cid)
values (1779, '421281', '赤壁市', '421200');
insert into AREA (id, aid, aname, cid)
values (1780, '421301', '市辖区', '421300');
insert into AREA (id, aid, aname, cid)
values (1781, '421302', '曾都区', '421300');
insert into AREA (id, aid, aname, cid)
values (1782, '421381', '广水市', '421300');
insert into AREA (id, aid, aname, cid)
values (1783, '422801', '恩施市', '422800');
insert into AREA (id, aid, aname, cid)
values (1784, '422802', '利川市', '422800');
insert into AREA (id, aid, aname, cid)
values (1785, '422822', '建始县', '422800');
insert into AREA (id, aid, aname, cid)
values (1786, '422823', '巴东县', '422800');
insert into AREA (id, aid, aname, cid)
values (1787, '422825', '宣恩县', '422800');
insert into AREA (id, aid, aname, cid)
values (1788, '422826', '咸丰县', '422800');
insert into AREA (id, aid, aname, cid)
values (1789, '422827', '来凤县', '422800');
insert into AREA (id, aid, aname, cid)
values (1790, '422828', '鹤峰县', '422800');
insert into AREA (id, aid, aname, cid)
values (1791, '429004', '仙桃市', '429000');
insert into AREA (id, aid, aname, cid)
values (1792, '429005', '潜江市', '429000');
insert into AREA (id, aid, aname, cid)
values (1793, '429006', '天门市', '429000');
insert into AREA (id, aid, aname, cid)
values (1794, '429021', '神农架林区', '429000');
insert into AREA (id, aid, aname, cid)
values (1795, '430101', '市辖区', '430100');
insert into AREA (id, aid, aname, cid)
values (1796, '430102', '芙蓉区', '430100');
insert into AREA (id, aid, aname, cid)
values (1797, '430103', '天心区', '430100');
insert into AREA (id, aid, aname, cid)
values (1798, '430104', '岳麓区', '430100');
insert into AREA (id, aid, aname, cid)
values (1799, '430105', '开福区', '430100');
insert into AREA (id, aid, aname, cid)
values (1800, '430111', '雨花区', '430100');
insert into AREA (id, aid, aname, cid)
values (1801, '430121', '长沙县', '430100');
insert into AREA (id, aid, aname, cid)
values (1802, '430122', '望城县', '430100');
insert into AREA (id, aid, aname, cid)
values (1803, '430124', '宁乡县', '430100');
insert into AREA (id, aid, aname, cid)
values (1804, '430181', '浏阳市', '430100');
insert into AREA (id, aid, aname, cid)
values (1805, '430201', '市辖区', '430200');
insert into AREA (id, aid, aname, cid)
values (1806, '430202', '荷塘区', '430200');
insert into AREA (id, aid, aname, cid)
values (1807, '430203', '芦淞区', '430200');
insert into AREA (id, aid, aname, cid)
values (1808, '430204', '石峰区', '430200');
insert into AREA (id, aid, aname, cid)
values (1809, '430211', '天元区', '430200');
insert into AREA (id, aid, aname, cid)
values (1810, '430221', '株洲县', '430200');
insert into AREA (id, aid, aname, cid)
values (1811, '430223', '攸　县', '430200');
insert into AREA (id, aid, aname, cid)
values (1812, '430224', '茶陵县', '430200');
insert into AREA (id, aid, aname, cid)
values (1813, '430225', '炎陵县', '430200');
insert into AREA (id, aid, aname, cid)
values (1814, '430281', '醴陵市', '430200');
insert into AREA (id, aid, aname, cid)
values (1815, '430301', '市辖区', '430300');
insert into AREA (id, aid, aname, cid)
values (1816, '430302', '雨湖区', '430300');
insert into AREA (id, aid, aname, cid)
values (1817, '430304', '岳塘区', '430300');
insert into AREA (id, aid, aname, cid)
values (1818, '430321', '湘潭县', '430300');
insert into AREA (id, aid, aname, cid)
values (1819, '430381', '湘乡市', '430300');
insert into AREA (id, aid, aname, cid)
values (1820, '430382', '韶山市', '430300');
insert into AREA (id, aid, aname, cid)
values (1821, '430401', '市辖区', '430400');
insert into AREA (id, aid, aname, cid)
values (1822, '430405', '珠晖区', '430400');
insert into AREA (id, aid, aname, cid)
values (1823, '430406', '雁峰区', '430400');
insert into AREA (id, aid, aname, cid)
values (1824, '430407', '石鼓区', '430400');
insert into AREA (id, aid, aname, cid)
values (1825, '430408', '蒸湘区', '430400');
insert into AREA (id, aid, aname, cid)
values (1826, '430412', '南岳区', '430400');
insert into AREA (id, aid, aname, cid)
values (1827, '430421', '衡阳县', '430400');
insert into AREA (id, aid, aname, cid)
values (1828, '430422', '衡南县', '430400');
insert into AREA (id, aid, aname, cid)
values (1829, '430423', '衡山县', '430400');
insert into AREA (id, aid, aname, cid)
values (1830, '430424', '衡东县', '430400');
insert into AREA (id, aid, aname, cid)
values (1831, '430426', '祁东县', '430400');
insert into AREA (id, aid, aname, cid)
values (1832, '430481', '耒阳市', '430400');
insert into AREA (id, aid, aname, cid)
values (1833, '430482', '常宁市', '430400');
insert into AREA (id, aid, aname, cid)
values (1834, '430501', '市辖区', '430500');
insert into AREA (id, aid, aname, cid)
values (1835, '430502', '双清区', '430500');
insert into AREA (id, aid, aname, cid)
values (1836, '430503', '大祥区', '430500');
insert into AREA (id, aid, aname, cid)
values (1837, '430511', '北塔区', '430500');
insert into AREA (id, aid, aname, cid)
values (1838, '430521', '邵东县', '430500');
insert into AREA (id, aid, aname, cid)
values (1839, '430522', '新邵县', '430500');
insert into AREA (id, aid, aname, cid)
values (1840, '430523', '邵阳县', '430500');
insert into AREA (id, aid, aname, cid)
values (1841, '430524', '隆回县', '430500');
insert into AREA (id, aid, aname, cid)
values (1842, '430525', '洞口县', '430500');
insert into AREA (id, aid, aname, cid)
values (1843, '430527', '绥宁县', '430500');
insert into AREA (id, aid, aname, cid)
values (1844, '430528', '新宁县', '430500');
insert into AREA (id, aid, aname, cid)
values (1845, '430529', '城步苗族自治县', '430500');
insert into AREA (id, aid, aname, cid)
values (1846, '430581', '武冈市', '430500');
insert into AREA (id, aid, aname, cid)
values (1847, '430601', '市辖区', '430600');
insert into AREA (id, aid, aname, cid)
values (1848, '430602', '岳阳楼区', '430600');
insert into AREA (id, aid, aname, cid)
values (1849, '430603', '云溪区', '430600');
insert into AREA (id, aid, aname, cid)
values (1850, '430611', '君山区', '430600');
insert into AREA (id, aid, aname, cid)
values (1851, '430621', '岳阳县', '430600');
insert into AREA (id, aid, aname, cid)
values (1852, '430623', '华容县', '430600');
insert into AREA (id, aid, aname, cid)
values (1853, '430624', '湘阴县', '430600');
insert into AREA (id, aid, aname, cid)
values (1854, '430626', '平江县', '430600');
insert into AREA (id, aid, aname, cid)
values (1855, '430681', '汨罗市', '430600');
insert into AREA (id, aid, aname, cid)
values (1856, '430682', '临湘市', '430600');
insert into AREA (id, aid, aname, cid)
values (1857, '430701', '市辖区', '430700');
insert into AREA (id, aid, aname, cid)
values (1858, '430702', '武陵区', '430700');
insert into AREA (id, aid, aname, cid)
values (1859, '430703', '鼎城区', '430700');
insert into AREA (id, aid, aname, cid)
values (1860, '430721', '安乡县', '430700');
insert into AREA (id, aid, aname, cid)
values (1861, '430722', '汉寿县', '430700');
insert into AREA (id, aid, aname, cid)
values (1862, '430723', '澧　县', '430700');
insert into AREA (id, aid, aname, cid)
values (1863, '430724', '临澧县', '430700');
insert into AREA (id, aid, aname, cid)
values (1864, '430725', '桃源县', '430700');
insert into AREA (id, aid, aname, cid)
values (1865, '430726', '石门县', '430700');
insert into AREA (id, aid, aname, cid)
values (1866, '430781', '津市市', '430700');
commit;
prompt 2100 records committed...
insert into AREA (id, aid, aname, cid)
values (1867, '430801', '市辖区', '430800');
insert into AREA (id, aid, aname, cid)
values (1868, '430802', '永定区', '430800');
insert into AREA (id, aid, aname, cid)
values (1869, '430811', '武陵源区', '430800');
insert into AREA (id, aid, aname, cid)
values (1870, '430821', '慈利县', '430800');
insert into AREA (id, aid, aname, cid)
values (1871, '430822', '桑植县', '430800');
insert into AREA (id, aid, aname, cid)
values (1872, '430901', '市辖区', '430900');
insert into AREA (id, aid, aname, cid)
values (1873, '430902', '资阳区', '430900');
insert into AREA (id, aid, aname, cid)
values (1874, '430903', '赫山区', '430900');
insert into AREA (id, aid, aname, cid)
values (1875, '430921', '南　县', '430900');
insert into AREA (id, aid, aname, cid)
values (1876, '430922', '桃江县', '430900');
insert into AREA (id, aid, aname, cid)
values (1877, '430923', '安化县', '430900');
insert into AREA (id, aid, aname, cid)
values (1878, '430981', '沅江市', '430900');
insert into AREA (id, aid, aname, cid)
values (1879, '431001', '市辖区', '431000');
insert into AREA (id, aid, aname, cid)
values (1880, '431002', '北湖区', '431000');
insert into AREA (id, aid, aname, cid)
values (1881, '431003', '苏仙区', '431000');
insert into AREA (id, aid, aname, cid)
values (1882, '431021', '桂阳县', '431000');
insert into AREA (id, aid, aname, cid)
values (1883, '431022', '宜章县', '431000');
insert into AREA (id, aid, aname, cid)
values (1884, '431023', '永兴县', '431000');
insert into AREA (id, aid, aname, cid)
values (1885, '431024', '嘉禾县', '431000');
insert into AREA (id, aid, aname, cid)
values (1886, '431025', '临武县', '431000');
insert into AREA (id, aid, aname, cid)
values (1887, '431026', '汝城县', '431000');
insert into AREA (id, aid, aname, cid)
values (1888, '431027', '桂东县', '431000');
insert into AREA (id, aid, aname, cid)
values (1889, '431028', '安仁县', '431000');
insert into AREA (id, aid, aname, cid)
values (1890, '431081', '资兴市', '431000');
insert into AREA (id, aid, aname, cid)
values (1891, '431101', '市辖区', '431100');
insert into AREA (id, aid, aname, cid)
values (1892, '431102', '芝山区', '431100');
insert into AREA (id, aid, aname, cid)
values (1893, '431103', '冷水滩区', '431100');
insert into AREA (id, aid, aname, cid)
values (1894, '431121', '祁阳县', '431100');
insert into AREA (id, aid, aname, cid)
values (1895, '431122', '东安县', '431100');
insert into AREA (id, aid, aname, cid)
values (1896, '431123', '双牌县', '431100');
insert into AREA (id, aid, aname, cid)
values (1897, '431124', '道　县', '431100');
insert into AREA (id, aid, aname, cid)
values (1898, '431125', '江永县', '431100');
insert into AREA (id, aid, aname, cid)
values (1899, '431126', '宁远县', '431100');
insert into AREA (id, aid, aname, cid)
values (1900, '431127', '蓝山县', '431100');
insert into AREA (id, aid, aname, cid)
values (1901, '431128', '新田县', '431100');
insert into AREA (id, aid, aname, cid)
values (1902, '431129', '江华瑶族自治县', '431100');
insert into AREA (id, aid, aname, cid)
values (1903, '431201', '市辖区', '431200');
insert into AREA (id, aid, aname, cid)
values (1904, '431202', '鹤城区', '431200');
insert into AREA (id, aid, aname, cid)
values (1905, '431221', '中方县', '431200');
insert into AREA (id, aid, aname, cid)
values (1906, '431222', '沅陵县', '431200');
insert into AREA (id, aid, aname, cid)
values (1907, '431223', '辰溪县', '431200');
insert into AREA (id, aid, aname, cid)
values (1908, '431224', '溆浦县', '431200');
insert into AREA (id, aid, aname, cid)
values (1909, '431225', '会同县', '431200');
insert into AREA (id, aid, aname, cid)
values (1910, '431226', '麻阳苗族自治县', '431200');
insert into AREA (id, aid, aname, cid)
values (1911, '431227', '新晃侗族自治县', '431200');
insert into AREA (id, aid, aname, cid)
values (1912, '431228', '芷江侗族自治县', '431200');
insert into AREA (id, aid, aname, cid)
values (1913, '431229', '靖州苗族侗族自治县', '431200');
insert into AREA (id, aid, aname, cid)
values (1914, '431230', '通道侗族自治县', '431200');
insert into AREA (id, aid, aname, cid)
values (1915, '431281', '洪江市', '431200');
insert into AREA (id, aid, aname, cid)
values (1916, '431301', '市辖区', '431300');
insert into AREA (id, aid, aname, cid)
values (1917, '431302', '娄星区', '431300');
insert into AREA (id, aid, aname, cid)
values (1918, '431321', '双峰县', '431300');
insert into AREA (id, aid, aname, cid)
values (1919, '431322', '新化县', '431300');
insert into AREA (id, aid, aname, cid)
values (1920, '431381', '冷水江市', '431300');
insert into AREA (id, aid, aname, cid)
values (1921, '431382', '涟源市', '431300');
insert into AREA (id, aid, aname, cid)
values (1922, '433101', '吉首市', '433100');
insert into AREA (id, aid, aname, cid)
values (1923, '433122', '泸溪县', '433100');
insert into AREA (id, aid, aname, cid)
values (1924, '433123', '凤凰县', '433100');
insert into AREA (id, aid, aname, cid)
values (1925, '433124', '花垣县', '433100');
insert into AREA (id, aid, aname, cid)
values (1926, '433125', '保靖县', '433100');
insert into AREA (id, aid, aname, cid)
values (1927, '433126', '古丈县', '433100');
insert into AREA (id, aid, aname, cid)
values (1928, '433127', '永顺县', '433100');
insert into AREA (id, aid, aname, cid)
values (1929, '433130', '龙山县', '433100');
insert into AREA (id, aid, aname, cid)
values (1930, '440101', '市辖区', '440100');
insert into AREA (id, aid, aname, cid)
values (1931, '440102', '东山区', '440100');
insert into AREA (id, aid, aname, cid)
values (1932, '440103', '荔湾区', '440100');
insert into AREA (id, aid, aname, cid)
values (1933, '440104', '越秀区', '440100');
insert into AREA (id, aid, aname, cid)
values (1934, '440105', '海珠区', '440100');
insert into AREA (id, aid, aname, cid)
values (1935, '440106', '天河区', '440100');
insert into AREA (id, aid, aname, cid)
values (1936, '440107', '芳村区', '440100');
insert into AREA (id, aid, aname, cid)
values (1937, '440111', '白云区', '440100');
insert into AREA (id, aid, aname, cid)
values (1938, '440112', '黄埔区', '440100');
insert into AREA (id, aid, aname, cid)
values (1939, '440113', '番禺区', '440100');
insert into AREA (id, aid, aname, cid)
values (1940, '440114', '花都区', '440100');
insert into AREA (id, aid, aname, cid)
values (1941, '440183', '增城市', '440100');
insert into AREA (id, aid, aname, cid)
values (1942, '440184', '从化市', '440100');
insert into AREA (id, aid, aname, cid)
values (1943, '440201', '市辖区', '440200');
insert into AREA (id, aid, aname, cid)
values (1944, '440203', '武江区', '440200');
insert into AREA (id, aid, aname, cid)
values (1945, '440204', '浈江区', '440200');
insert into AREA (id, aid, aname, cid)
values (1946, '440205', '曲江区', '440200');
insert into AREA (id, aid, aname, cid)
values (1947, '440222', '始兴县', '440200');
insert into AREA (id, aid, aname, cid)
values (1948, '440224', '仁化县', '440200');
insert into AREA (id, aid, aname, cid)
values (1949, '440229', '翁源县', '440200');
insert into AREA (id, aid, aname, cid)
values (1950, '440232', '乳源瑶族自治县', '440200');
insert into AREA (id, aid, aname, cid)
values (1951, '440233', '新丰县', '440200');
insert into AREA (id, aid, aname, cid)
values (1952, '440281', '乐昌市', '440200');
insert into AREA (id, aid, aname, cid)
values (1953, '440282', '南雄市', '440200');
insert into AREA (id, aid, aname, cid)
values (1954, '440301', '市辖区', '440300');
insert into AREA (id, aid, aname, cid)
values (1955, '440303', '罗湖区', '440300');
insert into AREA (id, aid, aname, cid)
values (1956, '440304', '福田区', '440300');
insert into AREA (id, aid, aname, cid)
values (1957, '440305', '南山区', '440300');
insert into AREA (id, aid, aname, cid)
values (1958, '440306', '宝安区', '440300');
insert into AREA (id, aid, aname, cid)
values (1959, '440307', '龙岗区', '440300');
insert into AREA (id, aid, aname, cid)
values (1960, '440308', '盐田区', '440300');
insert into AREA (id, aid, aname, cid)
values (1961, '440401', '市辖区', '440400');
insert into AREA (id, aid, aname, cid)
values (1962, '440402', '香洲区', '440400');
insert into AREA (id, aid, aname, cid)
values (1963, '440403', '斗门区', '440400');
insert into AREA (id, aid, aname, cid)
values (1964, '440404', '金湾区', '440400');
insert into AREA (id, aid, aname, cid)
values (1965, '440501', '市辖区', '440500');
insert into AREA (id, aid, aname, cid)
values (1966, '440507', '龙湖区', '440500');
commit;
prompt 2200 records committed...
insert into AREA (id, aid, aname, cid)
values (1967, '440511', '金平区', '440500');
insert into AREA (id, aid, aname, cid)
values (1968, '440512', '濠江区', '440500');
insert into AREA (id, aid, aname, cid)
values (1969, '440513', '潮阳区', '440500');
insert into AREA (id, aid, aname, cid)
values (1970, '440514', '潮南区', '440500');
insert into AREA (id, aid, aname, cid)
values (1971, '440515', '澄海区', '440500');
insert into AREA (id, aid, aname, cid)
values (1972, '440523', '南澳县', '440500');
insert into AREA (id, aid, aname, cid)
values (1973, '440601', '市辖区', '440600');
insert into AREA (id, aid, aname, cid)
values (1974, '440604', '禅城区', '440600');
insert into AREA (id, aid, aname, cid)
values (1975, '440605', '南海区', '440600');
insert into AREA (id, aid, aname, cid)
values (1976, '440606', '顺德区', '440600');
insert into AREA (id, aid, aname, cid)
values (1977, '440607', '三水区', '440600');
insert into AREA (id, aid, aname, cid)
values (1978, '440608', '高明区', '440600');
insert into AREA (id, aid, aname, cid)
values (1979, '440701', '市辖区', '440700');
insert into AREA (id, aid, aname, cid)
values (1980, '440703', '蓬江区', '440700');
insert into AREA (id, aid, aname, cid)
values (1981, '440704', '江海区', '440700');
insert into AREA (id, aid, aname, cid)
values (1982, '440705', '新会区', '440700');
insert into AREA (id, aid, aname, cid)
values (1983, '440781', '台山市', '440700');
insert into AREA (id, aid, aname, cid)
values (1984, '440783', '开平市', '440700');
insert into AREA (id, aid, aname, cid)
values (1985, '440784', '鹤山市', '440700');
insert into AREA (id, aid, aname, cid)
values (1986, '440785', '恩平市', '440700');
insert into AREA (id, aid, aname, cid)
values (1987, '440801', '市辖区', '440800');
insert into AREA (id, aid, aname, cid)
values (1988, '440802', '赤坎区', '440800');
insert into AREA (id, aid, aname, cid)
values (1989, '440803', '霞山区', '440800');
insert into AREA (id, aid, aname, cid)
values (1990, '440804', '坡头区', '440800');
insert into AREA (id, aid, aname, cid)
values (1991, '440811', '麻章区', '440800');
insert into AREA (id, aid, aname, cid)
values (1992, '440823', '遂溪县', '440800');
insert into AREA (id, aid, aname, cid)
values (1993, '440825', '徐闻县', '440800');
insert into AREA (id, aid, aname, cid)
values (1994, '440881', '廉江市', '440800');
insert into AREA (id, aid, aname, cid)
values (1995, '440882', '雷州市', '440800');
insert into AREA (id, aid, aname, cid)
values (1996, '440883', '吴川市', '440800');
insert into AREA (id, aid, aname, cid)
values (1997, '440901', '市辖区', '440900');
insert into AREA (id, aid, aname, cid)
values (1998, '440902', '茂南区', '440900');
insert into AREA (id, aid, aname, cid)
values (1999, '440903', '茂港区', '440900');
insert into AREA (id, aid, aname, cid)
values (2000, '440923', '电白县', '440900');
insert into AREA (id, aid, aname, cid)
values (2001, '440981', '高州市', '440900');
insert into AREA (id, aid, aname, cid)
values (2002, '440982', '化州市', '440900');
insert into AREA (id, aid, aname, cid)
values (2003, '440983', '信宜市', '440900');
insert into AREA (id, aid, aname, cid)
values (2004, '441201', '市辖区', '441200');
insert into AREA (id, aid, aname, cid)
values (2005, '441202', '端州区', '441200');
insert into AREA (id, aid, aname, cid)
values (2006, '441203', '鼎湖区', '441200');
insert into AREA (id, aid, aname, cid)
values (2007, '441223', '广宁县', '441200');
insert into AREA (id, aid, aname, cid)
values (2008, '441224', '怀集县', '441200');
insert into AREA (id, aid, aname, cid)
values (2009, '441225', '封开县', '441200');
insert into AREA (id, aid, aname, cid)
values (2010, '441226', '德庆县', '441200');
insert into AREA (id, aid, aname, cid)
values (2011, '441283', '高要市', '441200');
insert into AREA (id, aid, aname, cid)
values (2012, '441284', '四会市', '441200');
insert into AREA (id, aid, aname, cid)
values (2013, '441301', '市辖区', '441300');
insert into AREA (id, aid, aname, cid)
values (2014, '441302', '惠城区', '441300');
insert into AREA (id, aid, aname, cid)
values (2015, '441303', '惠阳区', '441300');
insert into AREA (id, aid, aname, cid)
values (2016, '441322', '博罗县', '441300');
insert into AREA (id, aid, aname, cid)
values (2017, '441323', '惠东县', '441300');
insert into AREA (id, aid, aname, cid)
values (2018, '441324', '龙门县', '441300');
insert into AREA (id, aid, aname, cid)
values (2019, '441401', '市辖区', '441400');
insert into AREA (id, aid, aname, cid)
values (2020, '441402', '梅江区', '441400');
insert into AREA (id, aid, aname, cid)
values (2021, '441421', '梅　县', '441400');
insert into AREA (id, aid, aname, cid)
values (2022, '441422', '大埔县', '441400');
insert into AREA (id, aid, aname, cid)
values (2023, '441423', '丰顺县', '441400');
insert into AREA (id, aid, aname, cid)
values (2024, '441424', '五华县', '441400');
insert into AREA (id, aid, aname, cid)
values (2025, '441426', '平远县', '441400');
insert into AREA (id, aid, aname, cid)
values (2026, '441427', '蕉岭县', '441400');
insert into AREA (id, aid, aname, cid)
values (2027, '441481', '兴宁市', '441400');
insert into AREA (id, aid, aname, cid)
values (2028, '441501', '市辖区', '441500');
insert into AREA (id, aid, aname, cid)
values (2029, '441502', '城　区', '441500');
insert into AREA (id, aid, aname, cid)
values (2030, '441521', '海丰县', '441500');
insert into AREA (id, aid, aname, cid)
values (2031, '441523', '陆河县', '441500');
insert into AREA (id, aid, aname, cid)
values (2032, '441581', '陆丰市', '441500');
insert into AREA (id, aid, aname, cid)
values (2033, '441601', '市辖区', '441600');
insert into AREA (id, aid, aname, cid)
values (2034, '441602', '源城区', '441600');
insert into AREA (id, aid, aname, cid)
values (2035, '441621', '紫金县', '441600');
insert into AREA (id, aid, aname, cid)
values (2036, '441622', '龙川县', '441600');
insert into AREA (id, aid, aname, cid)
values (2037, '441623', '连平县', '441600');
insert into AREA (id, aid, aname, cid)
values (2038, '441624', '和平县', '441600');
insert into AREA (id, aid, aname, cid)
values (2039, '441625', '东源县', '441600');
insert into AREA (id, aid, aname, cid)
values (2040, '441701', '市辖区', '441700');
insert into AREA (id, aid, aname, cid)
values (2041, '441702', '江城区', '441700');
insert into AREA (id, aid, aname, cid)
values (2042, '441721', '阳西县', '441700');
insert into AREA (id, aid, aname, cid)
values (2043, '441723', '阳东县', '441700');
insert into AREA (id, aid, aname, cid)
values (2044, '441781', '阳春市', '441700');
insert into AREA (id, aid, aname, cid)
values (2045, '441801', '市辖区', '441800');
insert into AREA (id, aid, aname, cid)
values (2046, '441802', '清城区', '441800');
insert into AREA (id, aid, aname, cid)
values (2047, '441821', '佛冈县', '441800');
insert into AREA (id, aid, aname, cid)
values (2048, '441823', '阳山县', '441800');
insert into AREA (id, aid, aname, cid)
values (2049, '441825', '连山壮族瑶族自治县', '441800');
insert into AREA (id, aid, aname, cid)
values (2050, '441826', '连南瑶族自治县', '441800');
insert into AREA (id, aid, aname, cid)
values (2051, '441827', '清新县', '441800');
insert into AREA (id, aid, aname, cid)
values (2052, '441881', '英德市', '441800');
insert into AREA (id, aid, aname, cid)
values (2053, '441882', '连州市', '441800');
insert into AREA (id, aid, aname, cid)
values (2054, '445101', '市辖区', '445100');
insert into AREA (id, aid, aname, cid)
values (2055, '445102', '湘桥区', '445100');
insert into AREA (id, aid, aname, cid)
values (2056, '445121', '潮安县', '445100');
insert into AREA (id, aid, aname, cid)
values (2057, '445122', '饶平县', '445100');
insert into AREA (id, aid, aname, cid)
values (2058, '445201', '市辖区', '445200');
insert into AREA (id, aid, aname, cid)
values (2059, '445202', '榕城区', '445200');
insert into AREA (id, aid, aname, cid)
values (2060, '445221', '揭东县', '445200');
insert into AREA (id, aid, aname, cid)
values (2061, '445222', '揭西县', '445200');
insert into AREA (id, aid, aname, cid)
values (2062, '445224', '惠来县', '445200');
insert into AREA (id, aid, aname, cid)
values (2063, '445281', '普宁市', '445200');
insert into AREA (id, aid, aname, cid)
values (2064, '445301', '市辖区', '445300');
insert into AREA (id, aid, aname, cid)
values (2065, '445302', '云城区', '445300');
insert into AREA (id, aid, aname, cid)
values (2066, '445321', '新兴县', '445300');
commit;
prompt 2300 records committed...
insert into AREA (id, aid, aname, cid)
values (2067, '445322', '郁南县', '445300');
insert into AREA (id, aid, aname, cid)
values (2068, '445323', '云安县', '445300');
insert into AREA (id, aid, aname, cid)
values (2069, '445381', '罗定市', '445300');
insert into AREA (id, aid, aname, cid)
values (2070, '450101', '市辖区', '450100');
insert into AREA (id, aid, aname, cid)
values (2071, '450102', '兴宁区', '450100');
insert into AREA (id, aid, aname, cid)
values (2072, '450103', '青秀区', '450100');
insert into AREA (id, aid, aname, cid)
values (2073, '450105', '江南区', '450100');
insert into AREA (id, aid, aname, cid)
values (2074, '450107', '西乡塘区', '450100');
insert into AREA (id, aid, aname, cid)
values (2075, '450108', '良庆区', '450100');
insert into AREA (id, aid, aname, cid)
values (2076, '450109', '邕宁区', '450100');
insert into AREA (id, aid, aname, cid)
values (2077, '450122', '武鸣县', '450100');
insert into AREA (id, aid, aname, cid)
values (2078, '450123', '隆安县', '450100');
insert into AREA (id, aid, aname, cid)
values (2079, '450124', '马山县', '450100');
insert into AREA (id, aid, aname, cid)
values (2080, '450125', '上林县', '450100');
insert into AREA (id, aid, aname, cid)
values (2081, '450126', '宾阳县', '450100');
insert into AREA (id, aid, aname, cid)
values (2082, '450127', '横　县', '450100');
insert into AREA (id, aid, aname, cid)
values (2083, '450201', '市辖区', '450200');
insert into AREA (id, aid, aname, cid)
values (2084, '450202', '城中区', '450200');
insert into AREA (id, aid, aname, cid)
values (2085, '450203', '鱼峰区', '450200');
insert into AREA (id, aid, aname, cid)
values (2086, '450204', '柳南区', '450200');
insert into AREA (id, aid, aname, cid)
values (2087, '450205', '柳北区', '450200');
insert into AREA (id, aid, aname, cid)
values (2088, '450221', '柳江县', '450200');
insert into AREA (id, aid, aname, cid)
values (2089, '450222', '柳城县', '450200');
insert into AREA (id, aid, aname, cid)
values (2090, '450223', '鹿寨县', '450200');
insert into AREA (id, aid, aname, cid)
values (2091, '450224', '融安县', '450200');
insert into AREA (id, aid, aname, cid)
values (2092, '450225', '融水苗族自治县', '450200');
insert into AREA (id, aid, aname, cid)
values (2093, '450226', '三江侗族自治县', '450200');
insert into AREA (id, aid, aname, cid)
values (2094, '450301', '市辖区', '450300');
insert into AREA (id, aid, aname, cid)
values (2095, '450302', '秀峰区', '450300');
insert into AREA (id, aid, aname, cid)
values (2096, '450303', '叠彩区', '450300');
insert into AREA (id, aid, aname, cid)
values (2097, '450304', '象山区', '450300');
insert into AREA (id, aid, aname, cid)
values (2098, '450305', '七星区', '450300');
insert into AREA (id, aid, aname, cid)
values (2099, '450311', '雁山区', '450300');
insert into AREA (id, aid, aname, cid)
values (2100, '450321', '阳朔县', '450300');
insert into AREA (id, aid, aname, cid)
values (2101, '450322', '临桂县', '450300');
insert into AREA (id, aid, aname, cid)
values (2102, '450323', '灵川县', '450300');
insert into AREA (id, aid, aname, cid)
values (2103, '450324', '全州县', '450300');
insert into AREA (id, aid, aname, cid)
values (2104, '450325', '兴安县', '450300');
insert into AREA (id, aid, aname, cid)
values (2105, '450326', '永福县', '450300');
insert into AREA (id, aid, aname, cid)
values (2106, '450327', '灌阳县', '450300');
insert into AREA (id, aid, aname, cid)
values (2107, '450328', '龙胜各族自治县', '450300');
insert into AREA (id, aid, aname, cid)
values (2108, '450329', '资源县', '450300');
insert into AREA (id, aid, aname, cid)
values (2109, '450330', '平乐县', '450300');
insert into AREA (id, aid, aname, cid)
values (2110, '450331', '荔蒲县', '450300');
insert into AREA (id, aid, aname, cid)
values (2111, '450332', '恭城瑶族自治县', '450300');
insert into AREA (id, aid, aname, cid)
values (2112, '450401', '市辖区', '450400');
insert into AREA (id, aid, aname, cid)
values (2113, '450403', '万秀区', '450400');
insert into AREA (id, aid, aname, cid)
values (2114, '450404', '蝶山区', '450400');
insert into AREA (id, aid, aname, cid)
values (2115, '450405', '长洲区', '450400');
insert into AREA (id, aid, aname, cid)
values (2116, '450421', '苍梧县', '450400');
insert into AREA (id, aid, aname, cid)
values (2117, '450422', '藤　县', '450400');
insert into AREA (id, aid, aname, cid)
values (2118, '450423', '蒙山县', '450400');
insert into AREA (id, aid, aname, cid)
values (2119, '450481', '岑溪市', '450400');
insert into AREA (id, aid, aname, cid)
values (2120, '450501', '市辖区', '450500');
insert into AREA (id, aid, aname, cid)
values (2121, '450502', '海城区', '450500');
insert into AREA (id, aid, aname, cid)
values (2122, '450503', '银海区', '450500');
insert into AREA (id, aid, aname, cid)
values (2123, '450512', '铁山港区', '450500');
insert into AREA (id, aid, aname, cid)
values (2124, '450521', '合浦县', '450500');
insert into AREA (id, aid, aname, cid)
values (2125, '450601', '市辖区', '450600');
insert into AREA (id, aid, aname, cid)
values (2126, '450602', '港口区', '450600');
insert into AREA (id, aid, aname, cid)
values (2127, '450603', '防城区', '450600');
insert into AREA (id, aid, aname, cid)
values (2128, '450621', '上思县', '450600');
insert into AREA (id, aid, aname, cid)
values (2129, '450681', '东兴市', '450600');
insert into AREA (id, aid, aname, cid)
values (2130, '450701', '市辖区', '450700');
insert into AREA (id, aid, aname, cid)
values (2131, '450702', '钦南区', '450700');
insert into AREA (id, aid, aname, cid)
values (2132, '450703', '钦北区', '450700');
insert into AREA (id, aid, aname, cid)
values (2133, '450721', '灵山县', '450700');
insert into AREA (id, aid, aname, cid)
values (2134, '450722', '浦北县', '450700');
insert into AREA (id, aid, aname, cid)
values (2135, '450801', '市辖区', '450800');
insert into AREA (id, aid, aname, cid)
values (2136, '450802', '港北区', '450800');
insert into AREA (id, aid, aname, cid)
values (2137, '450803', '港南区', '450800');
insert into AREA (id, aid, aname, cid)
values (2138, '450804', '覃塘区', '450800');
insert into AREA (id, aid, aname, cid)
values (2139, '450821', '平南县', '450800');
insert into AREA (id, aid, aname, cid)
values (2140, '450881', '桂平市', '450800');
insert into AREA (id, aid, aname, cid)
values (2141, '450901', '市辖区', '450900');
insert into AREA (id, aid, aname, cid)
values (2142, '450902', '玉州区', '450900');
insert into AREA (id, aid, aname, cid)
values (2143, '450921', '容　县', '450900');
insert into AREA (id, aid, aname, cid)
values (2144, '450922', '陆川县', '450900');
insert into AREA (id, aid, aname, cid)
values (2145, '450923', '博白县', '450900');
insert into AREA (id, aid, aname, cid)
values (2146, '450924', '兴业县', '450900');
insert into AREA (id, aid, aname, cid)
values (2147, '450981', '北流市', '450900');
insert into AREA (id, aid, aname, cid)
values (2148, '451001', '市辖区', '451000');
insert into AREA (id, aid, aname, cid)
values (2149, '451002', '右江区', '451000');
insert into AREA (id, aid, aname, cid)
values (2150, '451021', '田阳县', '451000');
insert into AREA (id, aid, aname, cid)
values (2151, '451022', '田东县', '451000');
insert into AREA (id, aid, aname, cid)
values (2152, '451023', '平果县', '451000');
insert into AREA (id, aid, aname, cid)
values (2153, '451024', '德保县', '451000');
insert into AREA (id, aid, aname, cid)
values (2154, '451025', '靖西县', '451000');
insert into AREA (id, aid, aname, cid)
values (2155, '451026', '那坡县', '451000');
insert into AREA (id, aid, aname, cid)
values (2156, '451027', '凌云县', '451000');
insert into AREA (id, aid, aname, cid)
values (2157, '451028', '乐业县', '451000');
insert into AREA (id, aid, aname, cid)
values (2158, '451029', '田林县', '451000');
insert into AREA (id, aid, aname, cid)
values (2159, '451030', '西林县', '451000');
insert into AREA (id, aid, aname, cid)
values (2160, '451031', '隆林各族自治县', '451000');
insert into AREA (id, aid, aname, cid)
values (2161, '451101', '市辖区', '451100');
insert into AREA (id, aid, aname, cid)
values (2162, '451102', '八步区', '451100');
insert into AREA (id, aid, aname, cid)
values (2163, '451121', '昭平县', '451100');
insert into AREA (id, aid, aname, cid)
values (2164, '451122', '钟山县', '451100');
insert into AREA (id, aid, aname, cid)
values (2165, '451123', '富川瑶族自治县', '451100');
insert into AREA (id, aid, aname, cid)
values (2166, '451201', '市辖区', '451200');
commit;
prompt 2400 records committed...
insert into AREA (id, aid, aname, cid)
values (2167, '451202', '金城江区', '451200');
insert into AREA (id, aid, aname, cid)
values (2168, '451221', '南丹县', '451200');
insert into AREA (id, aid, aname, cid)
values (2169, '451222', '天峨县', '451200');
insert into AREA (id, aid, aname, cid)
values (2170, '451223', '凤山县', '451200');
insert into AREA (id, aid, aname, cid)
values (2171, '451224', '东兰县', '451200');
insert into AREA (id, aid, aname, cid)
values (2172, '451225', '罗城仫佬族自治县', '451200');
insert into AREA (id, aid, aname, cid)
values (2173, '451226', '环江毛南族自治县', '451200');
insert into AREA (id, aid, aname, cid)
values (2174, '451227', '巴马瑶族自治县', '451200');
insert into AREA (id, aid, aname, cid)
values (2175, '451228', '都安瑶族自治县', '451200');
insert into AREA (id, aid, aname, cid)
values (2176, '451229', '大化瑶族自治县', '451200');
insert into AREA (id, aid, aname, cid)
values (2177, '451281', '宜州市', '451200');
insert into AREA (id, aid, aname, cid)
values (2178, '451301', '市辖区', '451300');
insert into AREA (id, aid, aname, cid)
values (2179, '451302', '兴宾区', '451300');
insert into AREA (id, aid, aname, cid)
values (2180, '451321', '忻城县', '451300');
insert into AREA (id, aid, aname, cid)
values (2181, '451322', '象州县', '451300');
insert into AREA (id, aid, aname, cid)
values (2182, '451323', '武宣县', '451300');
insert into AREA (id, aid, aname, cid)
values (2183, '451324', '金秀瑶族自治县', '451300');
insert into AREA (id, aid, aname, cid)
values (2184, '451381', '合山市', '451300');
insert into AREA (id, aid, aname, cid)
values (2185, '451401', '市辖区', '451400');
insert into AREA (id, aid, aname, cid)
values (2186, '451402', '江洲区', '451400');
insert into AREA (id, aid, aname, cid)
values (2187, '451421', '扶绥县', '451400');
insert into AREA (id, aid, aname, cid)
values (2188, '451422', '宁明县', '451400');
insert into AREA (id, aid, aname, cid)
values (2189, '451423', '龙州县', '451400');
insert into AREA (id, aid, aname, cid)
values (2190, '451424', '大新县', '451400');
insert into AREA (id, aid, aname, cid)
values (2191, '451425', '天等县', '451400');
insert into AREA (id, aid, aname, cid)
values (2192, '451481', '凭祥市', '451400');
insert into AREA (id, aid, aname, cid)
values (2193, '460101', '市辖区', '460100');
insert into AREA (id, aid, aname, cid)
values (2194, '460105', '秀英区', '460100');
insert into AREA (id, aid, aname, cid)
values (2195, '460106', '龙华区', '460100');
insert into AREA (id, aid, aname, cid)
values (2196, '460107', '琼山区', '460100');
insert into AREA (id, aid, aname, cid)
values (2197, '460108', '美兰区', '460100');
insert into AREA (id, aid, aname, cid)
values (2198, '460201', '市辖区', '460200');
insert into AREA (id, aid, aname, cid)
values (2199, '469001', '五指山市', '469000');
insert into AREA (id, aid, aname, cid)
values (2200, '469002', '琼海市', '469000');
insert into AREA (id, aid, aname, cid)
values (2201, '469003', '儋州市', '469000');
insert into AREA (id, aid, aname, cid)
values (2202, '469005', '文昌市', '469000');
insert into AREA (id, aid, aname, cid)
values (2203, '469006', '万宁市', '469000');
insert into AREA (id, aid, aname, cid)
values (2204, '469007', '东方市', '469000');
insert into AREA (id, aid, aname, cid)
values (2205, '469025', '定安县', '469000');
insert into AREA (id, aid, aname, cid)
values (2206, '469026', '屯昌县', '469000');
insert into AREA (id, aid, aname, cid)
values (2207, '469027', '澄迈县', '469000');
insert into AREA (id, aid, aname, cid)
values (2208, '469028', '临高县', '469000');
insert into AREA (id, aid, aname, cid)
values (2209, '469030', '白沙黎族自治县', '469000');
insert into AREA (id, aid, aname, cid)
values (2210, '469031', '昌江黎族自治县', '469000');
insert into AREA (id, aid, aname, cid)
values (2211, '469033', '乐东黎族自治县', '469000');
insert into AREA (id, aid, aname, cid)
values (2212, '469034', '陵水黎族自治县', '469000');
insert into AREA (id, aid, aname, cid)
values (2213, '469035', '保亭黎族苗族自治县', '469000');
insert into AREA (id, aid, aname, cid)
values (2214, '469036', '琼中黎族苗族自治县', '469000');
insert into AREA (id, aid, aname, cid)
values (2215, '469037', '西沙群岛', '469000');
insert into AREA (id, aid, aname, cid)
values (2216, '469038', '南沙群岛', '469000');
insert into AREA (id, aid, aname, cid)
values (2217, '469039', '中沙群岛的岛礁及其海域', '469000');
insert into AREA (id, aid, aname, cid)
values (2218, '500101', '万州区', '500100');
insert into AREA (id, aid, aname, cid)
values (2219, '500102', '涪陵区', '500100');
insert into AREA (id, aid, aname, cid)
values (2220, '500103', '渝中区', '500100');
insert into AREA (id, aid, aname, cid)
values (2221, '500104', '大渡口区', '500100');
insert into AREA (id, aid, aname, cid)
values (2222, '500105', '江北区', '500100');
insert into AREA (id, aid, aname, cid)
values (2223, '500106', '沙坪坝区', '500100');
insert into AREA (id, aid, aname, cid)
values (2224, '500107', '九龙坡区', '500100');
insert into AREA (id, aid, aname, cid)
values (2225, '500108', '南岸区', '500100');
insert into AREA (id, aid, aname, cid)
values (2226, '500109', '北碚区', '500100');
insert into AREA (id, aid, aname, cid)
values (2227, '500110', '万盛区', '500100');
insert into AREA (id, aid, aname, cid)
values (2228, '500111', '双桥区', '500100');
insert into AREA (id, aid, aname, cid)
values (2229, '500112', '渝北区', '500100');
insert into AREA (id, aid, aname, cid)
values (2230, '500113', '巴南区', '500100');
insert into AREA (id, aid, aname, cid)
values (2231, '500114', '黔江区', '500100');
insert into AREA (id, aid, aname, cid)
values (2232, '500115', '长寿区', '500100');
insert into AREA (id, aid, aname, cid)
values (2233, '500222', '綦江县', '500200');
insert into AREA (id, aid, aname, cid)
values (2234, '500223', '潼南县', '500200');
insert into AREA (id, aid, aname, cid)
values (2235, '500224', '铜梁县', '500200');
insert into AREA (id, aid, aname, cid)
values (2236, '500225', '大足县', '500200');
insert into AREA (id, aid, aname, cid)
values (2237, '500226', '荣昌县', '500200');
insert into AREA (id, aid, aname, cid)
values (2238, '500227', '璧山县', '500200');
insert into AREA (id, aid, aname, cid)
values (2239, '500228', '梁平县', '500200');
insert into AREA (id, aid, aname, cid)
values (2240, '500229', '城口县', '500200');
insert into AREA (id, aid, aname, cid)
values (2241, '500230', '丰都县', '500200');
insert into AREA (id, aid, aname, cid)
values (2242, '500231', '垫江县', '500200');
insert into AREA (id, aid, aname, cid)
values (2243, '500232', '武隆县', '500200');
insert into AREA (id, aid, aname, cid)
values (2244, '500233', '忠　县', '500200');
insert into AREA (id, aid, aname, cid)
values (2245, '500234', '开　县', '500200');
insert into AREA (id, aid, aname, cid)
values (2246, '500235', '云阳县', '500200');
insert into AREA (id, aid, aname, cid)
values (2247, '500236', '奉节县', '500200');
insert into AREA (id, aid, aname, cid)
values (2248, '500237', '巫山县', '500200');
insert into AREA (id, aid, aname, cid)
values (2249, '500238', '巫溪县', '500200');
insert into AREA (id, aid, aname, cid)
values (2250, '500240', '石柱土家族自治县', '500200');
insert into AREA (id, aid, aname, cid)
values (2251, '500241', '秀山土家族苗族自治县', '500200');
insert into AREA (id, aid, aname, cid)
values (2252, '500242', '酉阳土家族苗族自治县', '500200');
insert into AREA (id, aid, aname, cid)
values (2253, '500243', '彭水苗族土家族自治县', '500200');
insert into AREA (id, aid, aname, cid)
values (2254, '500381', '江津市', '500300');
insert into AREA (id, aid, aname, cid)
values (2255, '500382', '合川市', '500300');
insert into AREA (id, aid, aname, cid)
values (2256, '500383', '永川市', '500300');
insert into AREA (id, aid, aname, cid)
values (2257, '500384', '南川市', '500300');
insert into AREA (id, aid, aname, cid)
values (2258, '510101', '市辖区', '510100');
insert into AREA (id, aid, aname, cid)
values (2259, '510104', '锦江区', '510100');
insert into AREA (id, aid, aname, cid)
values (2260, '510105', '青羊区', '510100');
insert into AREA (id, aid, aname, cid)
values (2261, '510106', '金牛区', '510100');
insert into AREA (id, aid, aname, cid)
values (2262, '510107', '武侯区', '510100');
insert into AREA (id, aid, aname, cid)
values (2263, '510108', '成华区', '510100');
insert into AREA (id, aid, aname, cid)
values (2264, '510112', '龙泉驿区', '510100');
insert into AREA (id, aid, aname, cid)
values (2265, '510113', '青白江区', '510100');
insert into AREA (id, aid, aname, cid)
values (2266, '510114', '新都区', '510100');
commit;
prompt 2500 records committed...
insert into AREA (id, aid, aname, cid)
values (2267, '510115', '温江区', '510100');
insert into AREA (id, aid, aname, cid)
values (2268, '510121', '金堂县', '510100');
insert into AREA (id, aid, aname, cid)
values (2269, '510122', '双流县', '510100');
insert into AREA (id, aid, aname, cid)
values (2270, '510124', '郫　县', '510100');
insert into AREA (id, aid, aname, cid)
values (2271, '510129', '大邑县', '510100');
insert into AREA (id, aid, aname, cid)
values (2272, '510131', '蒲江县', '510100');
insert into AREA (id, aid, aname, cid)
values (2273, '510132', '新津县', '510100');
insert into AREA (id, aid, aname, cid)
values (2274, '510181', '都江堰市', '510100');
insert into AREA (id, aid, aname, cid)
values (2275, '510182', '彭州市', '510100');
insert into AREA (id, aid, aname, cid)
values (2276, '510183', '邛崃市', '510100');
insert into AREA (id, aid, aname, cid)
values (2277, '510184', '崇州市', '510100');
insert into AREA (id, aid, aname, cid)
values (2278, '510301', '市辖区', '510300');
insert into AREA (id, aid, aname, cid)
values (2279, '510302', '自流井区', '510300');
insert into AREA (id, aid, aname, cid)
values (2280, '510303', '贡井区', '510300');
insert into AREA (id, aid, aname, cid)
values (2281, '510304', '大安区', '510300');
insert into AREA (id, aid, aname, cid)
values (2282, '510311', '沿滩区', '510300');
insert into AREA (id, aid, aname, cid)
values (2283, '510321', '荣　县', '510300');
insert into AREA (id, aid, aname, cid)
values (2284, '510322', '富顺县', '510300');
insert into AREA (id, aid, aname, cid)
values (2285, '510401', '市辖区', '510400');
insert into AREA (id, aid, aname, cid)
values (2286, '510402', '东　区', '510400');
insert into AREA (id, aid, aname, cid)
values (2287, '510403', '西　区', '510400');
insert into AREA (id, aid, aname, cid)
values (2288, '510411', '仁和区', '510400');
insert into AREA (id, aid, aname, cid)
values (2289, '510421', '米易县', '510400');
insert into AREA (id, aid, aname, cid)
values (2290, '510422', '盐边县', '510400');
insert into AREA (id, aid, aname, cid)
values (2291, '510501', '市辖区', '510500');
insert into AREA (id, aid, aname, cid)
values (2292, '510502', '江阳区', '510500');
insert into AREA (id, aid, aname, cid)
values (2293, '510503', '纳溪区', '510500');
insert into AREA (id, aid, aname, cid)
values (2294, '510504', '龙马潭区', '510500');
insert into AREA (id, aid, aname, cid)
values (2295, '510521', '泸　县', '510500');
insert into AREA (id, aid, aname, cid)
values (2296, '510522', '合江县', '510500');
insert into AREA (id, aid, aname, cid)
values (2297, '510524', '叙永县', '510500');
insert into AREA (id, aid, aname, cid)
values (2298, '510525', '古蔺县', '510500');
insert into AREA (id, aid, aname, cid)
values (2299, '510601', '市辖区', '510600');
insert into AREA (id, aid, aname, cid)
values (2300, '510603', '旌阳区', '510600');
insert into AREA (id, aid, aname, cid)
values (2301, '510623', '中江县', '510600');
insert into AREA (id, aid, aname, cid)
values (2302, '510626', '罗江县', '510600');
insert into AREA (id, aid, aname, cid)
values (2303, '510681', '广汉市', '510600');
insert into AREA (id, aid, aname, cid)
values (2304, '510682', '什邡市', '510600');
insert into AREA (id, aid, aname, cid)
values (2305, '510683', '绵竹市', '510600');
insert into AREA (id, aid, aname, cid)
values (2306, '510701', '市辖区', '510700');
insert into AREA (id, aid, aname, cid)
values (2307, '510703', '涪城区', '510700');
insert into AREA (id, aid, aname, cid)
values (2308, '510704', '游仙区', '510700');
insert into AREA (id, aid, aname, cid)
values (2309, '510722', '三台县', '510700');
insert into AREA (id, aid, aname, cid)
values (2310, '510723', '盐亭县', '510700');
insert into AREA (id, aid, aname, cid)
values (2311, '510724', '安　县', '510700');
insert into AREA (id, aid, aname, cid)
values (2312, '510725', '梓潼县', '510700');
insert into AREA (id, aid, aname, cid)
values (2313, '510726', '北川羌族自治县', '510700');
insert into AREA (id, aid, aname, cid)
values (2314, '510727', '平武县', '510700');
insert into AREA (id, aid, aname, cid)
values (2315, '510781', '江油市', '510700');
insert into AREA (id, aid, aname, cid)
values (2316, '510801', '市辖区', '510800');
insert into AREA (id, aid, aname, cid)
values (2317, '510802', '市中区', '510800');
insert into AREA (id, aid, aname, cid)
values (2318, '510811', '元坝区', '510800');
insert into AREA (id, aid, aname, cid)
values (2319, '510812', '朝天区', '510800');
insert into AREA (id, aid, aname, cid)
values (2320, '510821', '旺苍县', '510800');
insert into AREA (id, aid, aname, cid)
values (2321, '510822', '青川县', '510800');
insert into AREA (id, aid, aname, cid)
values (2322, '510823', '剑阁县', '510800');
insert into AREA (id, aid, aname, cid)
values (2323, '510824', '苍溪县', '510800');
insert into AREA (id, aid, aname, cid)
values (2324, '510901', '市辖区', '510900');
insert into AREA (id, aid, aname, cid)
values (2325, '510903', '船山区', '510900');
insert into AREA (id, aid, aname, cid)
values (2326, '510904', '安居区', '510900');
insert into AREA (id, aid, aname, cid)
values (2327, '510921', '蓬溪县', '510900');
insert into AREA (id, aid, aname, cid)
values (2328, '510922', '射洪县', '510900');
insert into AREA (id, aid, aname, cid)
values (2329, '510923', '大英县', '510900');
insert into AREA (id, aid, aname, cid)
values (2330, '511001', '市辖区', '511000');
insert into AREA (id, aid, aname, cid)
values (2331, '511002', '市中区', '511000');
insert into AREA (id, aid, aname, cid)
values (2332, '511011', '东兴区', '511000');
insert into AREA (id, aid, aname, cid)
values (2333, '511024', '威远县', '511000');
insert into AREA (id, aid, aname, cid)
values (2334, '511025', '资中县', '511000');
insert into AREA (id, aid, aname, cid)
values (2335, '511028', '隆昌县', '511000');
insert into AREA (id, aid, aname, cid)
values (2336, '511101', '市辖区', '511100');
insert into AREA (id, aid, aname, cid)
values (2337, '511102', '市中区', '511100');
insert into AREA (id, aid, aname, cid)
values (2338, '511111', '沙湾区', '511100');
insert into AREA (id, aid, aname, cid)
values (2339, '511112', '五通桥区', '511100');
insert into AREA (id, aid, aname, cid)
values (2340, '511113', '金口河区', '511100');
insert into AREA (id, aid, aname, cid)
values (2341, '511123', '犍为县', '511100');
insert into AREA (id, aid, aname, cid)
values (2342, '511124', '井研县', '511100');
insert into AREA (id, aid, aname, cid)
values (2343, '511126', '夹江县', '511100');
insert into AREA (id, aid, aname, cid)
values (2344, '511129', '沐川县', '511100');
insert into AREA (id, aid, aname, cid)
values (2345, '511132', '峨边彝族自治县', '511100');
insert into AREA (id, aid, aname, cid)
values (2346, '511133', '马边彝族自治县', '511100');
insert into AREA (id, aid, aname, cid)
values (2347, '511181', '峨眉山市', '511100');
insert into AREA (id, aid, aname, cid)
values (2348, '511301', '市辖区', '511300');
insert into AREA (id, aid, aname, cid)
values (2349, '511302', '顺庆区', '511300');
insert into AREA (id, aid, aname, cid)
values (2350, '511303', '高坪区', '511300');
insert into AREA (id, aid, aname, cid)
values (2351, '511304', '嘉陵区', '511300');
insert into AREA (id, aid, aname, cid)
values (2352, '511321', '南部县', '511300');
insert into AREA (id, aid, aname, cid)
values (2353, '511322', '营山县', '511300');
insert into AREA (id, aid, aname, cid)
values (2354, '511323', '蓬安县', '511300');
insert into AREA (id, aid, aname, cid)
values (2355, '511324', '仪陇县', '511300');
insert into AREA (id, aid, aname, cid)
values (2356, '511325', '西充县', '511300');
insert into AREA (id, aid, aname, cid)
values (2357, '511381', '阆中市', '511300');
insert into AREA (id, aid, aname, cid)
values (2358, '511401', '市辖区', '511400');
insert into AREA (id, aid, aname, cid)
values (2359, '511402', '东坡区', '511400');
insert into AREA (id, aid, aname, cid)
values (2360, '511421', '仁寿县', '511400');
insert into AREA (id, aid, aname, cid)
values (2361, '511422', '彭山县', '511400');
insert into AREA (id, aid, aname, cid)
values (2362, '511423', '洪雅县', '511400');
insert into AREA (id, aid, aname, cid)
values (2363, '511424', '丹棱县', '511400');
insert into AREA (id, aid, aname, cid)
values (2364, '511425', '青神县', '511400');
insert into AREA (id, aid, aname, cid)
values (2365, '511501', '市辖区', '511500');
insert into AREA (id, aid, aname, cid)
values (2366, '511502', '翠屏区', '511500');
commit;
prompt 2600 records committed...
insert into AREA (id, aid, aname, cid)
values (2367, '511521', '宜宾县', '511500');
insert into AREA (id, aid, aname, cid)
values (2368, '511522', '南溪县', '511500');
insert into AREA (id, aid, aname, cid)
values (2369, '511523', '江安县', '511500');
insert into AREA (id, aid, aname, cid)
values (2370, '511524', '长宁县', '511500');
insert into AREA (id, aid, aname, cid)
values (2371, '511525', '高　县', '511500');
insert into AREA (id, aid, aname, cid)
values (2372, '511526', '珙　县', '511500');
insert into AREA (id, aid, aname, cid)
values (2373, '511527', '筠连县', '511500');
insert into AREA (id, aid, aname, cid)
values (2374, '511528', '兴文县', '511500');
insert into AREA (id, aid, aname, cid)
values (2375, '511529', '屏山县', '511500');
insert into AREA (id, aid, aname, cid)
values (2376, '511601', '市辖区', '511600');
insert into AREA (id, aid, aname, cid)
values (2377, '511602', '广安区', '511600');
insert into AREA (id, aid, aname, cid)
values (2378, '511621', '岳池县', '511600');
insert into AREA (id, aid, aname, cid)
values (2379, '511622', '武胜县', '511600');
insert into AREA (id, aid, aname, cid)
values (2380, '511623', '邻水县', '511600');
insert into AREA (id, aid, aname, cid)
values (2381, '511681', '华莹市', '511600');
insert into AREA (id, aid, aname, cid)
values (2382, '511701', '市辖区', '511700');
insert into AREA (id, aid, aname, cid)
values (2383, '511702', '通川区', '511700');
insert into AREA (id, aid, aname, cid)
values (2384, '511721', '达　县', '511700');
insert into AREA (id, aid, aname, cid)
values (2385, '511722', '宣汉县', '511700');
insert into AREA (id, aid, aname, cid)
values (2386, '511723', '开江县', '511700');
insert into AREA (id, aid, aname, cid)
values (2387, '511724', '大竹县', '511700');
insert into AREA (id, aid, aname, cid)
values (2388, '511725', '渠　县', '511700');
insert into AREA (id, aid, aname, cid)
values (2389, '511781', '万源市', '511700');
insert into AREA (id, aid, aname, cid)
values (2390, '511801', '市辖区', '511800');
insert into AREA (id, aid, aname, cid)
values (2391, '511802', '雨城区', '511800');
insert into AREA (id, aid, aname, cid)
values (2392, '511821', '名山县', '511800');
insert into AREA (id, aid, aname, cid)
values (2393, '511822', '荥经县', '511800');
insert into AREA (id, aid, aname, cid)
values (2394, '511823', '汉源县', '511800');
insert into AREA (id, aid, aname, cid)
values (2395, '511824', '石棉县', '511800');
insert into AREA (id, aid, aname, cid)
values (2396, '511825', '天全县', '511800');
insert into AREA (id, aid, aname, cid)
values (2397, '511826', '芦山县', '511800');
insert into AREA (id, aid, aname, cid)
values (2398, '511827', '宝兴县', '511800');
insert into AREA (id, aid, aname, cid)
values (2399, '511901', '市辖区', '511900');
insert into AREA (id, aid, aname, cid)
values (2400, '511902', '巴州区', '511900');
insert into AREA (id, aid, aname, cid)
values (2401, '511921', '通江县', '511900');
insert into AREA (id, aid, aname, cid)
values (2402, '511922', '南江县', '511900');
insert into AREA (id, aid, aname, cid)
values (2403, '511923', '平昌县', '511900');
insert into AREA (id, aid, aname, cid)
values (2404, '512001', '市辖区', '512000');
insert into AREA (id, aid, aname, cid)
values (2405, '512002', '雁江区', '512000');
insert into AREA (id, aid, aname, cid)
values (2406, '512021', '安岳县', '512000');
insert into AREA (id, aid, aname, cid)
values (2407, '512022', '乐至县', '512000');
insert into AREA (id, aid, aname, cid)
values (2408, '512081', '简阳市', '512000');
insert into AREA (id, aid, aname, cid)
values (2409, '513221', '汶川县', '513200');
insert into AREA (id, aid, aname, cid)
values (2410, '513222', '理　县', '513200');
insert into AREA (id, aid, aname, cid)
values (2411, '513223', '茂　县', '513200');
insert into AREA (id, aid, aname, cid)
values (2412, '513224', '松潘县', '513200');
insert into AREA (id, aid, aname, cid)
values (2413, '513225', '九寨沟县', '513200');
insert into AREA (id, aid, aname, cid)
values (2414, '513226', '金川县', '513200');
insert into AREA (id, aid, aname, cid)
values (2415, '513227', '小金县', '513200');
insert into AREA (id, aid, aname, cid)
values (2416, '513228', '黑水县', '513200');
insert into AREA (id, aid, aname, cid)
values (2417, '513229', '马尔康县', '513200');
insert into AREA (id, aid, aname, cid)
values (2418, '513230', '壤塘县', '513200');
insert into AREA (id, aid, aname, cid)
values (2419, '513231', '阿坝县', '513200');
insert into AREA (id, aid, aname, cid)
values (2420, '513232', '若尔盖县', '513200');
insert into AREA (id, aid, aname, cid)
values (2421, '513233', '红原县', '513200');
insert into AREA (id, aid, aname, cid)
values (2422, '513321', '康定县', '513300');
insert into AREA (id, aid, aname, cid)
values (2423, '513322', '泸定县', '513300');
insert into AREA (id, aid, aname, cid)
values (2424, '513323', '丹巴县', '513300');
insert into AREA (id, aid, aname, cid)
values (2425, '513324', '九龙县', '513300');
insert into AREA (id, aid, aname, cid)
values (2426, '513325', '雅江县', '513300');
insert into AREA (id, aid, aname, cid)
values (2427, '513326', '道孚县', '513300');
insert into AREA (id, aid, aname, cid)
values (2428, '513327', '炉霍县', '513300');
insert into AREA (id, aid, aname, cid)
values (2429, '513328', '甘孜县', '513300');
insert into AREA (id, aid, aname, cid)
values (2430, '513329', '新龙县', '513300');
insert into AREA (id, aid, aname, cid)
values (2431, '513330', '德格县', '513300');
insert into AREA (id, aid, aname, cid)
values (2432, '513331', '白玉县', '513300');
insert into AREA (id, aid, aname, cid)
values (2433, '513332', '石渠县', '513300');
insert into AREA (id, aid, aname, cid)
values (2434, '513333', '色达县', '513300');
insert into AREA (id, aid, aname, cid)
values (2435, '513334', '理塘县', '513300');
insert into AREA (id, aid, aname, cid)
values (2436, '513335', '巴塘县', '513300');
insert into AREA (id, aid, aname, cid)
values (2437, '513336', '乡城县', '513300');
insert into AREA (id, aid, aname, cid)
values (2438, '513337', '稻城县', '513300');
insert into AREA (id, aid, aname, cid)
values (2439, '513338', '得荣县', '513300');
insert into AREA (id, aid, aname, cid)
values (2440, '513401', '西昌市', '513400');
insert into AREA (id, aid, aname, cid)
values (2441, '513422', '木里藏族自治县', '513400');
insert into AREA (id, aid, aname, cid)
values (2442, '513423', '盐源县', '513400');
insert into AREA (id, aid, aname, cid)
values (2443, '513424', '德昌县', '513400');
insert into AREA (id, aid, aname, cid)
values (2444, '513425', '会理县', '513400');
insert into AREA (id, aid, aname, cid)
values (2445, '513426', '会东县', '513400');
insert into AREA (id, aid, aname, cid)
values (2446, '513427', '宁南县', '513400');
insert into AREA (id, aid, aname, cid)
values (2447, '513428', '普格县', '513400');
insert into AREA (id, aid, aname, cid)
values (2448, '513429', '布拖县', '513400');
insert into AREA (id, aid, aname, cid)
values (2449, '513430', '金阳县', '513400');
insert into AREA (id, aid, aname, cid)
values (2450, '513431', '昭觉县', '513400');
insert into AREA (id, aid, aname, cid)
values (2451, '513432', '喜德县', '513400');
insert into AREA (id, aid, aname, cid)
values (2452, '513433', '冕宁县', '513400');
insert into AREA (id, aid, aname, cid)
values (2453, '513434', '越西县', '513400');
insert into AREA (id, aid, aname, cid)
values (2454, '513435', '甘洛县', '513400');
insert into AREA (id, aid, aname, cid)
values (2455, '513436', '美姑县', '513400');
insert into AREA (id, aid, aname, cid)
values (2456, '513437', '雷波县', '513400');
insert into AREA (id, aid, aname, cid)
values (2457, '520101', '市辖区', '520100');
insert into AREA (id, aid, aname, cid)
values (2458, '520102', '南明区', '520100');
insert into AREA (id, aid, aname, cid)
values (2459, '520103', '云岩区', '520100');
insert into AREA (id, aid, aname, cid)
values (2460, '520111', '花溪区', '520100');
insert into AREA (id, aid, aname, cid)
values (2461, '520112', '乌当区', '520100');
insert into AREA (id, aid, aname, cid)
values (2462, '520113', '白云区', '520100');
insert into AREA (id, aid, aname, cid)
values (2463, '520114', '小河区', '520100');
insert into AREA (id, aid, aname, cid)
values (2464, '520121', '开阳县', '520100');
insert into AREA (id, aid, aname, cid)
values (2465, '520122', '息烽县', '520100');
insert into AREA (id, aid, aname, cid)
values (2466, '520123', '修文县', '520100');
commit;
prompt 2700 records committed...
insert into AREA (id, aid, aname, cid)
values (2467, '520181', '清镇市', '520100');
insert into AREA (id, aid, aname, cid)
values (2468, '520201', '钟山区', '520200');
insert into AREA (id, aid, aname, cid)
values (2469, '520203', '六枝特区', '520200');
insert into AREA (id, aid, aname, cid)
values (2470, '520221', '水城县', '520200');
insert into AREA (id, aid, aname, cid)
values (2471, '520222', '盘　县', '520200');
insert into AREA (id, aid, aname, cid)
values (2472, '520301', '市辖区', '520300');
insert into AREA (id, aid, aname, cid)
values (2473, '520302', '红花岗区', '520300');
insert into AREA (id, aid, aname, cid)
values (2474, '520303', '汇川区', '520300');
insert into AREA (id, aid, aname, cid)
values (2475, '520321', '遵义县', '520300');
insert into AREA (id, aid, aname, cid)
values (2476, '520322', '桐梓县', '520300');
insert into AREA (id, aid, aname, cid)
values (2477, '520323', '绥阳县', '520300');
insert into AREA (id, aid, aname, cid)
values (2478, '520324', '正安县', '520300');
insert into AREA (id, aid, aname, cid)
values (2479, '520325', '道真仡佬族苗族自治县', '520300');
insert into AREA (id, aid, aname, cid)
values (2480, '520326', '务川仡佬族苗族自治县', '520300');
insert into AREA (id, aid, aname, cid)
values (2481, '520327', '凤冈县', '520300');
insert into AREA (id, aid, aname, cid)
values (2482, '520328', '湄潭县', '520300');
insert into AREA (id, aid, aname, cid)
values (2483, '520329', '余庆县', '520300');
insert into AREA (id, aid, aname, cid)
values (2484, '520330', '习水县', '520300');
insert into AREA (id, aid, aname, cid)
values (2485, '520381', '赤水市', '520300');
insert into AREA (id, aid, aname, cid)
values (2486, '520382', '仁怀市', '520300');
insert into AREA (id, aid, aname, cid)
values (2487, '520401', '市辖区', '520400');
insert into AREA (id, aid, aname, cid)
values (2488, '520402', '西秀区', '520400');
insert into AREA (id, aid, aname, cid)
values (2489, '520421', '平坝县', '520400');
insert into AREA (id, aid, aname, cid)
values (2490, '520422', '普定县', '520400');
insert into AREA (id, aid, aname, cid)
values (2491, '520423', '镇宁布依族苗族自治县', '520400');
insert into AREA (id, aid, aname, cid)
values (2492, '520424', '关岭布依族苗族自治县', '520400');
insert into AREA (id, aid, aname, cid)
values (2493, '520425', '紫云苗族布依族自治县', '520400');
insert into AREA (id, aid, aname, cid)
values (2494, '522201', '铜仁市', '522200');
insert into AREA (id, aid, aname, cid)
values (2495, '522222', '江口县', '522200');
insert into AREA (id, aid, aname, cid)
values (2496, '522223', '玉屏侗族自治县', '522200');
insert into AREA (id, aid, aname, cid)
values (2497, '522224', '石阡县', '522200');
insert into AREA (id, aid, aname, cid)
values (2498, '522225', '思南县', '522200');
insert into AREA (id, aid, aname, cid)
values (2499, '522226', '印江土家族苗族自治县', '522200');
insert into AREA (id, aid, aname, cid)
values (2500, '522227', '德江县', '522200');
insert into AREA (id, aid, aname, cid)
values (2501, '522228', '沿河土家族自治县', '522200');
insert into AREA (id, aid, aname, cid)
values (2502, '522229', '松桃苗族自治县', '522200');
insert into AREA (id, aid, aname, cid)
values (2503, '522230', '万山特区', '522200');
insert into AREA (id, aid, aname, cid)
values (2504, '522301', '兴义市', '522300');
insert into AREA (id, aid, aname, cid)
values (2505, '522322', '兴仁县', '522300');
insert into AREA (id, aid, aname, cid)
values (2506, '522323', '普安县', '522300');
insert into AREA (id, aid, aname, cid)
values (2507, '522324', '晴隆县', '522300');
insert into AREA (id, aid, aname, cid)
values (2508, '522325', '贞丰县', '522300');
insert into AREA (id, aid, aname, cid)
values (2509, '522326', '望谟县', '522300');
insert into AREA (id, aid, aname, cid)
values (2510, '522327', '册亨县', '522300');
insert into AREA (id, aid, aname, cid)
values (2511, '522328', '安龙县', '522300');
insert into AREA (id, aid, aname, cid)
values (2512, '522401', '毕节市', '522400');
insert into AREA (id, aid, aname, cid)
values (2513, '522422', '大方县', '522400');
insert into AREA (id, aid, aname, cid)
values (2514, '522423', '黔西县', '522400');
insert into AREA (id, aid, aname, cid)
values (2515, '522424', '金沙县', '522400');
insert into AREA (id, aid, aname, cid)
values (2516, '522425', '织金县', '522400');
insert into AREA (id, aid, aname, cid)
values (2517, '522426', '纳雍县', '522400');
insert into AREA (id, aid, aname, cid)
values (2518, '522427', '威宁彝族回族苗族自治县', '522400');
insert into AREA (id, aid, aname, cid)
values (2519, '522428', '赫章县', '522400');
insert into AREA (id, aid, aname, cid)
values (2520, '522601', '凯里市', '522600');
insert into AREA (id, aid, aname, cid)
values (2521, '522622', '黄平县', '522600');
insert into AREA (id, aid, aname, cid)
values (2522, '522623', '施秉县', '522600');
insert into AREA (id, aid, aname, cid)
values (2523, '522624', '三穗县', '522600');
insert into AREA (id, aid, aname, cid)
values (2524, '522625', '镇远县', '522600');
insert into AREA (id, aid, aname, cid)
values (2525, '522626', '岑巩县', '522600');
insert into AREA (id, aid, aname, cid)
values (2526, '522627', '天柱县', '522600');
insert into AREA (id, aid, aname, cid)
values (2527, '522628', '锦屏县', '522600');
insert into AREA (id, aid, aname, cid)
values (2528, '522629', '剑河县', '522600');
insert into AREA (id, aid, aname, cid)
values (2529, '522630', '台江县', '522600');
insert into AREA (id, aid, aname, cid)
values (2530, '522631', '黎平县', '522600');
insert into AREA (id, aid, aname, cid)
values (2531, '522632', '榕江县', '522600');
insert into AREA (id, aid, aname, cid)
values (2532, '522633', '从江县', '522600');
insert into AREA (id, aid, aname, cid)
values (2533, '522634', '雷山县', '522600');
insert into AREA (id, aid, aname, cid)
values (2534, '522635', '麻江县', '522600');
insert into AREA (id, aid, aname, cid)
values (2535, '522636', '丹寨县', '522600');
insert into AREA (id, aid, aname, cid)
values (2536, '522701', '都匀市', '522700');
insert into AREA (id, aid, aname, cid)
values (2537, '522702', '福泉市', '522700');
insert into AREA (id, aid, aname, cid)
values (2538, '522722', '荔波县', '522700');
insert into AREA (id, aid, aname, cid)
values (2539, '522723', '贵定县', '522700');
insert into AREA (id, aid, aname, cid)
values (2540, '522725', '瓮安县', '522700');
insert into AREA (id, aid, aname, cid)
values (2541, '522726', '独山县', '522700');
insert into AREA (id, aid, aname, cid)
values (2542, '522727', '平塘县', '522700');
insert into AREA (id, aid, aname, cid)
values (2543, '522728', '罗甸县', '522700');
insert into AREA (id, aid, aname, cid)
values (2544, '522729', '长顺县', '522700');
insert into AREA (id, aid, aname, cid)
values (2545, '522730', '龙里县', '522700');
insert into AREA (id, aid, aname, cid)
values (2546, '522731', '惠水县', '522700');
insert into AREA (id, aid, aname, cid)
values (2547, '522732', '三都水族自治县', '522700');
insert into AREA (id, aid, aname, cid)
values (2548, '530101', '市辖区', '530100');
insert into AREA (id, aid, aname, cid)
values (2549, '530102', '五华区', '530100');
insert into AREA (id, aid, aname, cid)
values (2550, '530103', '盘龙区', '530100');
insert into AREA (id, aid, aname, cid)
values (2551, '530111', '官渡区', '530100');
insert into AREA (id, aid, aname, cid)
values (2552, '530112', '西山区', '530100');
insert into AREA (id, aid, aname, cid)
values (2553, '530113', '东川区', '530100');
insert into AREA (id, aid, aname, cid)
values (2554, '530121', '呈贡县', '530100');
insert into AREA (id, aid, aname, cid)
values (2555, '530122', '晋宁县', '530100');
insert into AREA (id, aid, aname, cid)
values (2556, '530124', '富民县', '530100');
insert into AREA (id, aid, aname, cid)
values (2557, '530125', '宜良县', '530100');
insert into AREA (id, aid, aname, cid)
values (2558, '530126', '石林彝族自治县', '530100');
insert into AREA (id, aid, aname, cid)
values (2559, '530127', '嵩明县', '530100');
insert into AREA (id, aid, aname, cid)
values (2560, '530128', '禄劝彝族苗族自治县', '530100');
insert into AREA (id, aid, aname, cid)
values (2561, '530129', '寻甸回族彝族自治县', '530100');
insert into AREA (id, aid, aname, cid)
values (2562, '530181', '安宁市', '530100');
insert into AREA (id, aid, aname, cid)
values (2563, '530301', '市辖区', '530300');
insert into AREA (id, aid, aname, cid)
values (2564, '530302', '麒麟区', '530300');
insert into AREA (id, aid, aname, cid)
values (2565, '530321', '马龙县', '530300');
insert into AREA (id, aid, aname, cid)
values (2566, '530322', '陆良县', '530300');
commit;
prompt 2800 records committed...
insert into AREA (id, aid, aname, cid)
values (2567, '530323', '师宗县', '530300');
insert into AREA (id, aid, aname, cid)
values (2568, '530324', '罗平县', '530300');
insert into AREA (id, aid, aname, cid)
values (2569, '530325', '富源县', '530300');
insert into AREA (id, aid, aname, cid)
values (2570, '530326', '会泽县', '530300');
insert into AREA (id, aid, aname, cid)
values (2571, '530328', '沾益县', '530300');
insert into AREA (id, aid, aname, cid)
values (2572, '530381', '宣威市', '530300');
insert into AREA (id, aid, aname, cid)
values (2573, '530401', '市辖区', '530400');
insert into AREA (id, aid, aname, cid)
values (2574, '530402', '红塔区', '530400');
insert into AREA (id, aid, aname, cid)
values (2575, '530421', '江川县', '530400');
insert into AREA (id, aid, aname, cid)
values (2576, '530422', '澄江县', '530400');
insert into AREA (id, aid, aname, cid)
values (2577, '530423', '通海县', '530400');
insert into AREA (id, aid, aname, cid)
values (2578, '530424', '华宁县', '530400');
insert into AREA (id, aid, aname, cid)
values (2579, '530425', '易门县', '530400');
insert into AREA (id, aid, aname, cid)
values (2580, '530426', '峨山彝族自治县', '530400');
insert into AREA (id, aid, aname, cid)
values (2581, '530427', '新平彝族傣族自治县', '530400');
insert into AREA (id, aid, aname, cid)
values (2582, '530428', '元江哈尼族彝族傣族自治县', '530400');
insert into AREA (id, aid, aname, cid)
values (2583, '530501', '市辖区', '530500');
insert into AREA (id, aid, aname, cid)
values (2584, '530502', '隆阳区', '530500');
insert into AREA (id, aid, aname, cid)
values (2585, '530521', '施甸县', '530500');
insert into AREA (id, aid, aname, cid)
values (2586, '530522', '腾冲县', '530500');
insert into AREA (id, aid, aname, cid)
values (2587, '530523', '龙陵县', '530500');
insert into AREA (id, aid, aname, cid)
values (2588, '530524', '昌宁县', '530500');
insert into AREA (id, aid, aname, cid)
values (2589, '530601', '市辖区', '530600');
insert into AREA (id, aid, aname, cid)
values (2590, '530602', '昭阳区', '530600');
insert into AREA (id, aid, aname, cid)
values (2591, '530621', '鲁甸县', '530600');
insert into AREA (id, aid, aname, cid)
values (2592, '530622', '巧家县', '530600');
insert into AREA (id, aid, aname, cid)
values (2593, '530623', '盐津县', '530600');
insert into AREA (id, aid, aname, cid)
values (2594, '530624', '大关县', '530600');
insert into AREA (id, aid, aname, cid)
values (2595, '530625', '永善县', '530600');
insert into AREA (id, aid, aname, cid)
values (2596, '530626', '绥江县', '530600');
insert into AREA (id, aid, aname, cid)
values (2597, '530627', '镇雄县', '530600');
insert into AREA (id, aid, aname, cid)
values (2598, '530628', '彝良县', '530600');
insert into AREA (id, aid, aname, cid)
values (2599, '530629', '威信县', '530600');
insert into AREA (id, aid, aname, cid)
values (2600, '530630', '水富县', '530600');
insert into AREA (id, aid, aname, cid)
values (2601, '530701', '市辖区', '530700');
insert into AREA (id, aid, aname, cid)
values (2602, '530702', '古城区', '530700');
insert into AREA (id, aid, aname, cid)
values (2603, '530721', '玉龙纳西族自治县', '530700');
insert into AREA (id, aid, aname, cid)
values (2604, '530722', '永胜县', '530700');
insert into AREA (id, aid, aname, cid)
values (2605, '530723', '华坪县', '530700');
insert into AREA (id, aid, aname, cid)
values (2606, '530724', '宁蒗彝族自治县', '530700');
insert into AREA (id, aid, aname, cid)
values (2607, '530801', '市辖区', '530800');
insert into AREA (id, aid, aname, cid)
values (2608, '530802', '翠云区', '530800');
insert into AREA (id, aid, aname, cid)
values (2609, '530821', '普洱哈尼族彝族自治县', '530800');
insert into AREA (id, aid, aname, cid)
values (2610, '530822', '墨江哈尼族自治县', '530800');
insert into AREA (id, aid, aname, cid)
values (2611, '530823', '景东彝族自治县', '530800');
insert into AREA (id, aid, aname, cid)
values (2612, '530824', '景谷傣族彝族自治县', '530800');
insert into AREA (id, aid, aname, cid)
values (2613, '530825', '镇沅彝族哈尼族拉祜族自治县', '530800');
insert into AREA (id, aid, aname, cid)
values (2614, '530826', '江城哈尼族彝族自治县', '530800');
insert into AREA (id, aid, aname, cid)
values (2615, '530827', '孟连傣族拉祜族佤族自治县', '530800');
insert into AREA (id, aid, aname, cid)
values (2616, '530828', '澜沧拉祜族自治县', '530800');
insert into AREA (id, aid, aname, cid)
values (2617, '530829', '西盟佤族自治县', '530800');
insert into AREA (id, aid, aname, cid)
values (2618, '530901', '市辖区', '530900');
insert into AREA (id, aid, aname, cid)
values (2619, '530902', '临翔区', '530900');
insert into AREA (id, aid, aname, cid)
values (2620, '530921', '凤庆县', '530900');
insert into AREA (id, aid, aname, cid)
values (2621, '530922', '云　县', '530900');
insert into AREA (id, aid, aname, cid)
values (2622, '530923', '永德县', '530900');
insert into AREA (id, aid, aname, cid)
values (2623, '530924', '镇康县', '530900');
insert into AREA (id, aid, aname, cid)
values (2624, '530925', '双江拉祜族佤族布朗族傣族自治县', '530900');
insert into AREA (id, aid, aname, cid)
values (2625, '530926', '耿马傣族佤族自治县', '530900');
insert into AREA (id, aid, aname, cid)
values (2626, '530927', '沧源佤族自治县', '530900');
insert into AREA (id, aid, aname, cid)
values (2627, '532301', '楚雄市', '532300');
insert into AREA (id, aid, aname, cid)
values (2628, '532322', '双柏县', '532300');
insert into AREA (id, aid, aname, cid)
values (2629, '532323', '牟定县', '532300');
insert into AREA (id, aid, aname, cid)
values (2630, '532324', '南华县', '532300');
insert into AREA (id, aid, aname, cid)
values (2631, '532325', '姚安县', '532300');
insert into AREA (id, aid, aname, cid)
values (2632, '532326', '大姚县', '532300');
insert into AREA (id, aid, aname, cid)
values (2633, '532327', '永仁县', '532300');
insert into AREA (id, aid, aname, cid)
values (2634, '532328', '元谋县', '532300');
insert into AREA (id, aid, aname, cid)
values (2635, '532329', '武定县', '532300');
insert into AREA (id, aid, aname, cid)
values (2636, '532331', '禄丰县', '532300');
insert into AREA (id, aid, aname, cid)
values (2637, '532501', '个旧市', '532500');
insert into AREA (id, aid, aname, cid)
values (2638, '532502', '开远市', '532500');
insert into AREA (id, aid, aname, cid)
values (2639, '532522', '蒙自县', '532500');
insert into AREA (id, aid, aname, cid)
values (2640, '532523', '屏边苗族自治县', '532500');
insert into AREA (id, aid, aname, cid)
values (2641, '532524', '建水县', '532500');
insert into AREA (id, aid, aname, cid)
values (2642, '532525', '石屏县', '532500');
insert into AREA (id, aid, aname, cid)
values (2643, '532526', '弥勒县', '532500');
insert into AREA (id, aid, aname, cid)
values (2644, '532527', '泸西县', '532500');
insert into AREA (id, aid, aname, cid)
values (2645, '532528', '元阳县', '532500');
insert into AREA (id, aid, aname, cid)
values (2646, '532529', '红河县', '532500');
insert into AREA (id, aid, aname, cid)
values (2647, '532530', '金平苗族瑶族傣族自治县', '532500');
insert into AREA (id, aid, aname, cid)
values (2648, '532531', '绿春县', '532500');
insert into AREA (id, aid, aname, cid)
values (2649, '532532', '河口瑶族自治县', '532500');
insert into AREA (id, aid, aname, cid)
values (2650, '532621', '文山县', '532600');
insert into AREA (id, aid, aname, cid)
values (2651, '532622', '砚山县', '532600');
insert into AREA (id, aid, aname, cid)
values (2652, '532623', '西畴县', '532600');
insert into AREA (id, aid, aname, cid)
values (2653, '532624', '麻栗坡县', '532600');
insert into AREA (id, aid, aname, cid)
values (2654, '532625', '马关县', '532600');
insert into AREA (id, aid, aname, cid)
values (2655, '532626', '丘北县', '532600');
insert into AREA (id, aid, aname, cid)
values (2656, '532627', '广南县', '532600');
insert into AREA (id, aid, aname, cid)
values (2657, '532628', '富宁县', '532600');
insert into AREA (id, aid, aname, cid)
values (2658, '532801', '景洪市', '532800');
insert into AREA (id, aid, aname, cid)
values (2659, '532822', '勐海县', '532800');
insert into AREA (id, aid, aname, cid)
values (2660, '532823', '勐腊县', '532800');
insert into AREA (id, aid, aname, cid)
values (2661, '532901', '大理市', '532900');
insert into AREA (id, aid, aname, cid)
values (2662, '532922', '漾濞彝族自治县', '532900');
insert into AREA (id, aid, aname, cid)
values (2663, '532923', '祥云县', '532900');
insert into AREA (id, aid, aname, cid)
values (2664, '532924', '宾川县', '532900');
insert into AREA (id, aid, aname, cid)
values (2665, '532925', '弥渡县', '532900');
insert into AREA (id, aid, aname, cid)
values (2666, '532926', '南涧彝族自治县', '532900');
commit;
prompt 2900 records committed...
insert into AREA (id, aid, aname, cid)
values (2667, '532927', '巍山彝族回族自治县', '532900');
insert into AREA (id, aid, aname, cid)
values (2668, '532928', '永平县', '532900');
insert into AREA (id, aid, aname, cid)
values (2669, '532929', '云龙县', '532900');
insert into AREA (id, aid, aname, cid)
values (2670, '532930', '洱源县', '532900');
insert into AREA (id, aid, aname, cid)
values (2671, '532931', '剑川县', '532900');
insert into AREA (id, aid, aname, cid)
values (2672, '532932', '鹤庆县', '532900');
insert into AREA (id, aid, aname, cid)
values (2673, '533102', '瑞丽市', '533100');
insert into AREA (id, aid, aname, cid)
values (2674, '533103', '潞西市', '533100');
insert into AREA (id, aid, aname, cid)
values (2675, '533122', '梁河县', '533100');
insert into AREA (id, aid, aname, cid)
values (2676, '533123', '盈江县', '533100');
insert into AREA (id, aid, aname, cid)
values (2677, '533124', '陇川县', '533100');
insert into AREA (id, aid, aname, cid)
values (2678, '533321', '泸水县', '533300');
insert into AREA (id, aid, aname, cid)
values (2679, '533323', '福贡县', '533300');
insert into AREA (id, aid, aname, cid)
values (2680, '533324', '贡山独龙族怒族自治县', '533300');
insert into AREA (id, aid, aname, cid)
values (2681, '533325', '兰坪白族普米族自治县', '533300');
insert into AREA (id, aid, aname, cid)
values (2682, '533421', '香格里拉县', '533400');
insert into AREA (id, aid, aname, cid)
values (2683, '533422', '德钦县', '533400');
insert into AREA (id, aid, aname, cid)
values (2684, '533423', '维西傈僳族自治县', '533400');
insert into AREA (id, aid, aname, cid)
values (2685, '540101', '市辖区', '540100');
insert into AREA (id, aid, aname, cid)
values (2686, '540102', '城关区', '540100');
insert into AREA (id, aid, aname, cid)
values (2687, '540121', '林周县', '540100');
insert into AREA (id, aid, aname, cid)
values (2688, '540122', '当雄县', '540100');
insert into AREA (id, aid, aname, cid)
values (2689, '540123', '尼木县', '540100');
insert into AREA (id, aid, aname, cid)
values (2690, '540124', '曲水县', '540100');
insert into AREA (id, aid, aname, cid)
values (2691, '540125', '堆龙德庆县', '540100');
insert into AREA (id, aid, aname, cid)
values (2692, '540126', '达孜县', '540100');
insert into AREA (id, aid, aname, cid)
values (2693, '540127', '墨竹工卡县', '540100');
insert into AREA (id, aid, aname, cid)
values (2694, '542121', '昌都县', '542100');
insert into AREA (id, aid, aname, cid)
values (2695, '542122', '江达县', '542100');
insert into AREA (id, aid, aname, cid)
values (2696, '542123', '贡觉县', '542100');
insert into AREA (id, aid, aname, cid)
values (2697, '542124', '类乌齐县', '542100');
insert into AREA (id, aid, aname, cid)
values (2698, '542125', '丁青县', '542100');
insert into AREA (id, aid, aname, cid)
values (2699, '542126', '察雅县', '542100');
insert into AREA (id, aid, aname, cid)
values (2700, '542127', '八宿县', '542100');
insert into AREA (id, aid, aname, cid)
values (2701, '542128', '左贡县', '542100');
insert into AREA (id, aid, aname, cid)
values (2702, '542129', '芒康县', '542100');
insert into AREA (id, aid, aname, cid)
values (2703, '542132', '洛隆县', '542100');
insert into AREA (id, aid, aname, cid)
values (2704, '542133', '边坝县', '542100');
insert into AREA (id, aid, aname, cid)
values (2705, '542221', '乃东县', '542200');
insert into AREA (id, aid, aname, cid)
values (2706, '542222', '扎囊县', '542200');
insert into AREA (id, aid, aname, cid)
values (2707, '542223', '贡嘎县', '542200');
insert into AREA (id, aid, aname, cid)
values (2708, '542224', '桑日县', '542200');
insert into AREA (id, aid, aname, cid)
values (2709, '542225', '琼结县', '542200');
insert into AREA (id, aid, aname, cid)
values (2710, '542226', '曲松县', '542200');
insert into AREA (id, aid, aname, cid)
values (2711, '542227', '措美县', '542200');
insert into AREA (id, aid, aname, cid)
values (2712, '542228', '洛扎县', '542200');
insert into AREA (id, aid, aname, cid)
values (2713, '542229', '加查县', '542200');
insert into AREA (id, aid, aname, cid)
values (2714, '542231', '隆子县', '542200');
insert into AREA (id, aid, aname, cid)
values (2715, '542232', '错那县', '542200');
insert into AREA (id, aid, aname, cid)
values (2716, '542233', '浪卡子县', '542200');
insert into AREA (id, aid, aname, cid)
values (2717, '542301', '日喀则市', '542300');
insert into AREA (id, aid, aname, cid)
values (2718, '542322', '南木林县', '542300');
insert into AREA (id, aid, aname, cid)
values (2719, '542323', '江孜县', '542300');
insert into AREA (id, aid, aname, cid)
values (2720, '542324', '定日县', '542300');
insert into AREA (id, aid, aname, cid)
values (2721, '542325', '萨迦县', '542300');
insert into AREA (id, aid, aname, cid)
values (2722, '542326', '拉孜县', '542300');
insert into AREA (id, aid, aname, cid)
values (2723, '542327', '昂仁县', '542300');
insert into AREA (id, aid, aname, cid)
values (2724, '542328', '谢通门县', '542300');
insert into AREA (id, aid, aname, cid)
values (2725, '542329', '白朗县', '542300');
insert into AREA (id, aid, aname, cid)
values (2726, '542330', '仁布县', '542300');
insert into AREA (id, aid, aname, cid)
values (2727, '542331', '康马县', '542300');
insert into AREA (id, aid, aname, cid)
values (2728, '542332', '定结县', '542300');
insert into AREA (id, aid, aname, cid)
values (2729, '542333', '仲巴县', '542300');
insert into AREA (id, aid, aname, cid)
values (2730, '542334', '亚东县', '542300');
insert into AREA (id, aid, aname, cid)
values (2731, '542335', '吉隆县', '542300');
insert into AREA (id, aid, aname, cid)
values (2732, '542336', '聂拉木县', '542300');
insert into AREA (id, aid, aname, cid)
values (2733, '542337', '萨嘎县', '542300');
insert into AREA (id, aid, aname, cid)
values (2734, '542338', '岗巴县', '542300');
insert into AREA (id, aid, aname, cid)
values (2735, '542421', '那曲县', '542400');
insert into AREA (id, aid, aname, cid)
values (2736, '542422', '嘉黎县', '542400');
insert into AREA (id, aid, aname, cid)
values (2737, '542423', '比如县', '542400');
insert into AREA (id, aid, aname, cid)
values (2738, '542424', '聂荣县', '542400');
insert into AREA (id, aid, aname, cid)
values (2739, '542425', '安多县', '542400');
insert into AREA (id, aid, aname, cid)
values (2740, '542426', '申扎县', '542400');
insert into AREA (id, aid, aname, cid)
values (2741, '542427', '索　县', '542400');
insert into AREA (id, aid, aname, cid)
values (2742, '542428', '班戈县', '542400');
insert into AREA (id, aid, aname, cid)
values (2743, '542429', '巴青县', '542400');
insert into AREA (id, aid, aname, cid)
values (2744, '542430', '尼玛县', '542400');
insert into AREA (id, aid, aname, cid)
values (2745, '542521', '普兰县', '542500');
insert into AREA (id, aid, aname, cid)
values (2746, '542522', '札达县', '542500');
insert into AREA (id, aid, aname, cid)
values (2747, '542523', '噶尔县', '542500');
insert into AREA (id, aid, aname, cid)
values (2748, '542524', '日土县', '542500');
insert into AREA (id, aid, aname, cid)
values (2749, '542525', '革吉县', '542500');
insert into AREA (id, aid, aname, cid)
values (2750, '542526', '改则县', '542500');
insert into AREA (id, aid, aname, cid)
values (2751, '542527', '措勤县', '542500');
insert into AREA (id, aid, aname, cid)
values (2752, '542621', '林芝县', '542600');
insert into AREA (id, aid, aname, cid)
values (2753, '542622', '工布江达县', '542600');
insert into AREA (id, aid, aname, cid)
values (2754, '542623', '米林县', '542600');
insert into AREA (id, aid, aname, cid)
values (2755, '542624', '墨脱县', '542600');
insert into AREA (id, aid, aname, cid)
values (2756, '542625', '波密县', '542600');
insert into AREA (id, aid, aname, cid)
values (2757, '542626', '察隅县', '542600');
insert into AREA (id, aid, aname, cid)
values (2758, '542627', '朗　县', '542600');
insert into AREA (id, aid, aname, cid)
values (2759, '610101', '市辖区', '610100');
insert into AREA (id, aid, aname, cid)
values (2760, '610102', '新城区', '610100');
insert into AREA (id, aid, aname, cid)
values (2761, '610103', '碑林区', '610100');
insert into AREA (id, aid, aname, cid)
values (2762, '610104', '莲湖区', '610100');
insert into AREA (id, aid, aname, cid)
values (2763, '610111', '灞桥区', '610100');
insert into AREA (id, aid, aname, cid)
values (2764, '610112', '未央区', '610100');
insert into AREA (id, aid, aname, cid)
values (2765, '610113', '雁塔区', '610100');
insert into AREA (id, aid, aname, cid)
values (2766, '610114', '阎良区', '610100');
commit;
prompt 3000 records committed...
insert into AREA (id, aid, aname, cid)
values (2767, '610115', '临潼区', '610100');
insert into AREA (id, aid, aname, cid)
values (2768, '610116', '长安区', '610100');
insert into AREA (id, aid, aname, cid)
values (2769, '610122', '蓝田县', '610100');
insert into AREA (id, aid, aname, cid)
values (2770, '610124', '周至县', '610100');
insert into AREA (id, aid, aname, cid)
values (2771, '610125', '户　县', '610100');
insert into AREA (id, aid, aname, cid)
values (2772, '610126', '高陵县', '610100');
insert into AREA (id, aid, aname, cid)
values (2773, '610201', '市辖区', '610200');
insert into AREA (id, aid, aname, cid)
values (2774, '610202', '王益区', '610200');
insert into AREA (id, aid, aname, cid)
values (2775, '610203', '印台区', '610200');
insert into AREA (id, aid, aname, cid)
values (2776, '610204', '耀州区', '610200');
insert into AREA (id, aid, aname, cid)
values (2777, '610222', '宜君县', '610200');
insert into AREA (id, aid, aname, cid)
values (2778, '610301', '市辖区', '610300');
insert into AREA (id, aid, aname, cid)
values (2779, '610302', '渭滨区', '610300');
insert into AREA (id, aid, aname, cid)
values (2780, '610303', '金台区', '610300');
insert into AREA (id, aid, aname, cid)
values (2781, '610304', '陈仓区', '610300');
insert into AREA (id, aid, aname, cid)
values (2782, '610322', '凤翔县', '610300');
insert into AREA (id, aid, aname, cid)
values (2783, '610323', '岐山县', '610300');
insert into AREA (id, aid, aname, cid)
values (2784, '610324', '扶风县', '610300');
insert into AREA (id, aid, aname, cid)
values (2785, '610326', '眉　县', '610300');
insert into AREA (id, aid, aname, cid)
values (2786, '610327', '陇　县', '610300');
insert into AREA (id, aid, aname, cid)
values (2787, '610328', '千阳县', '610300');
insert into AREA (id, aid, aname, cid)
values (2788, '610329', '麟游县', '610300');
insert into AREA (id, aid, aname, cid)
values (2789, '610330', '凤　县', '610300');
insert into AREA (id, aid, aname, cid)
values (2790, '610331', '太白县', '610300');
insert into AREA (id, aid, aname, cid)
values (2791, '610401', '市辖区', '610400');
insert into AREA (id, aid, aname, cid)
values (2792, '610402', '秦都区', '610400');
insert into AREA (id, aid, aname, cid)
values (2793, '610403', '杨凌区', '610400');
insert into AREA (id, aid, aname, cid)
values (2794, '610404', '渭城区', '610400');
insert into AREA (id, aid, aname, cid)
values (2795, '610422', '三原县', '610400');
insert into AREA (id, aid, aname, cid)
values (2796, '610423', '泾阳县', '610400');
insert into AREA (id, aid, aname, cid)
values (2797, '610424', '乾　县', '610400');
insert into AREA (id, aid, aname, cid)
values (2798, '610425', '礼泉县', '610400');
insert into AREA (id, aid, aname, cid)
values (2799, '610426', '永寿县', '610400');
insert into AREA (id, aid, aname, cid)
values (2800, '610427', '彬　县', '610400');
insert into AREA (id, aid, aname, cid)
values (2801, '610428', '长武县', '610400');
insert into AREA (id, aid, aname, cid)
values (2802, '610429', '旬邑县', '610400');
insert into AREA (id, aid, aname, cid)
values (2803, '610430', '淳化县', '610400');
insert into AREA (id, aid, aname, cid)
values (2804, '610431', '武功县', '610400');
insert into AREA (id, aid, aname, cid)
values (2805, '610481', '兴平市', '610400');
insert into AREA (id, aid, aname, cid)
values (2806, '610501', '市辖区', '610500');
insert into AREA (id, aid, aname, cid)
values (2807, '610502', '临渭区', '610500');
insert into AREA (id, aid, aname, cid)
values (2808, '610521', '华　县', '610500');
insert into AREA (id, aid, aname, cid)
values (2809, '610522', '潼关县', '610500');
insert into AREA (id, aid, aname, cid)
values (2810, '610523', '大荔县', '610500');
insert into AREA (id, aid, aname, cid)
values (2811, '610524', '合阳县', '610500');
insert into AREA (id, aid, aname, cid)
values (2812, '610525', '澄城县', '610500');
insert into AREA (id, aid, aname, cid)
values (2813, '610526', '蒲城县', '610500');
insert into AREA (id, aid, aname, cid)
values (2814, '610527', '白水县', '610500');
insert into AREA (id, aid, aname, cid)
values (2815, '610528', '富平县', '610500');
insert into AREA (id, aid, aname, cid)
values (2816, '610581', '韩城市', '610500');
insert into AREA (id, aid, aname, cid)
values (2817, '610582', '华阴市', '610500');
insert into AREA (id, aid, aname, cid)
values (2818, '610601', '市辖区', '610600');
insert into AREA (id, aid, aname, cid)
values (2819, '610602', '宝塔区', '610600');
insert into AREA (id, aid, aname, cid)
values (2820, '610621', '延长县', '610600');
insert into AREA (id, aid, aname, cid)
values (2821, '610622', '延川县', '610600');
insert into AREA (id, aid, aname, cid)
values (2822, '610623', '子长县', '610600');
insert into AREA (id, aid, aname, cid)
values (2823, '610624', '安塞县', '610600');
insert into AREA (id, aid, aname, cid)
values (2824, '610625', '志丹县', '610600');
insert into AREA (id, aid, aname, cid)
values (2825, '610626', '吴旗县', '610600');
insert into AREA (id, aid, aname, cid)
values (2826, '610627', '甘泉县', '610600');
insert into AREA (id, aid, aname, cid)
values (2827, '610628', '富　县', '610600');
insert into AREA (id, aid, aname, cid)
values (2828, '610629', '洛川县', '610600');
insert into AREA (id, aid, aname, cid)
values (2829, '610630', '宜川县', '610600');
insert into AREA (id, aid, aname, cid)
values (2830, '610631', '黄龙县', '610600');
insert into AREA (id, aid, aname, cid)
values (2831, '610632', '黄陵县', '610600');
insert into AREA (id, aid, aname, cid)
values (2832, '610701', '市辖区', '610700');
insert into AREA (id, aid, aname, cid)
values (2833, '610702', '汉台区', '610700');
insert into AREA (id, aid, aname, cid)
values (2834, '610721', '南郑县', '610700');
insert into AREA (id, aid, aname, cid)
values (2835, '610722', '城固县', '610700');
insert into AREA (id, aid, aname, cid)
values (2836, '610723', '洋　县', '610700');
insert into AREA (id, aid, aname, cid)
values (2837, '610724', '西乡县', '610700');
insert into AREA (id, aid, aname, cid)
values (2838, '610725', '勉　县', '610700');
insert into AREA (id, aid, aname, cid)
values (2839, '610726', '宁强县', '610700');
insert into AREA (id, aid, aname, cid)
values (2840, '610727', '略阳县', '610700');
insert into AREA (id, aid, aname, cid)
values (2841, '610728', '镇巴县', '610700');
insert into AREA (id, aid, aname, cid)
values (2842, '610729', '留坝县', '610700');
insert into AREA (id, aid, aname, cid)
values (2843, '610730', '佛坪县', '610700');
insert into AREA (id, aid, aname, cid)
values (2844, '610801', '市辖区', '610800');
insert into AREA (id, aid, aname, cid)
values (2845, '610802', '榆阳区', '610800');
insert into AREA (id, aid, aname, cid)
values (2846, '610821', '神木县', '610800');
insert into AREA (id, aid, aname, cid)
values (2847, '610822', '府谷县', '610800');
insert into AREA (id, aid, aname, cid)
values (2848, '610823', '横山县', '610800');
insert into AREA (id, aid, aname, cid)
values (2849, '610824', '靖边县', '610800');
insert into AREA (id, aid, aname, cid)
values (2850, '610825', '定边县', '610800');
insert into AREA (id, aid, aname, cid)
values (3085, '652922', '温宿县', '652900');
insert into AREA (id, aid, aname, cid)
values (3086, '652923', '库车县', '652900');
insert into AREA (id, aid, aname, cid)
values (3087, '652924', '沙雅县', '652900');
insert into AREA (id, aid, aname, cid)
values (3088, '652925', '新和县', '652900');
insert into AREA (id, aid, aname, cid)
values (3089, '652926', '拜城县', '652900');
insert into AREA (id, aid, aname, cid)
values (3090, '652927', '乌什县', '652900');
insert into AREA (id, aid, aname, cid)
values (3091, '652928', '阿瓦提县', '652900');
insert into AREA (id, aid, aname, cid)
values (3092, '652929', '柯坪县', '652900');
insert into AREA (id, aid, aname, cid)
values (3093, '653001', '阿图什市', '653000');
insert into AREA (id, aid, aname, cid)
values (3094, '653022', '阿克陶县', '653000');
insert into AREA (id, aid, aname, cid)
values (3095, '653023', '阿合奇县', '653000');
insert into AREA (id, aid, aname, cid)
values (3096, '653024', '乌恰县', '653000');
insert into AREA (id, aid, aname, cid)
values (3097, '653101', '喀什市', '653100');
insert into AREA (id, aid, aname, cid)
values (3098, '653121', '疏附县', '653100');
insert into AREA (id, aid, aname, cid)
values (3099, '653122', '疏勒县', '653100');
insert into AREA (id, aid, aname, cid)
values (3100, '653123', '英吉沙县', '653100');
commit;
prompt 3100 records committed...
insert into AREA (id, aid, aname, cid)
values (3101, '653124', '泽普县', '653100');
insert into AREA (id, aid, aname, cid)
values (3102, '653125', '莎车县', '653100');
insert into AREA (id, aid, aname, cid)
values (3103, '653126', '叶城县', '653100');
insert into AREA (id, aid, aname, cid)
values (3104, '653127', '麦盖提县', '653100');
insert into AREA (id, aid, aname, cid)
values (3105, '653128', '岳普湖县', '653100');
insert into AREA (id, aid, aname, cid)
values (3106, '653129', '伽师县', '653100');
insert into AREA (id, aid, aname, cid)
values (3107, '653130', '巴楚县', '653100');
insert into AREA (id, aid, aname, cid)
values (3108, '653131', '塔什库尔干塔吉克自治县', '653100');
insert into AREA (id, aid, aname, cid)
values (3109, '653201', '和田市', '653200');
insert into AREA (id, aid, aname, cid)
values (3110, '653221', '和田县', '653200');
insert into AREA (id, aid, aname, cid)
values (3111, '653222', '墨玉县', '653200');
insert into AREA (id, aid, aname, cid)
values (3112, '653223', '皮山县', '653200');
insert into AREA (id, aid, aname, cid)
values (3113, '653224', '洛浦县', '653200');
insert into AREA (id, aid, aname, cid)
values (3114, '653225', '策勒县', '653200');
insert into AREA (id, aid, aname, cid)
values (3115, '653226', '于田县', '653200');
insert into AREA (id, aid, aname, cid)
values (3116, '653227', '民丰县', '653200');
insert into AREA (id, aid, aname, cid)
values (3117, '654002', '伊宁市', '654000');
insert into AREA (id, aid, aname, cid)
values (3118, '654003', '奎屯市', '654000');
insert into AREA (id, aid, aname, cid)
values (3119, '654021', '伊宁县', '654000');
insert into AREA (id, aid, aname, cid)
values (3120, '654022', '察布查尔锡伯自治县', '654000');
insert into AREA (id, aid, aname, cid)
values (3121, '654023', '霍城县', '654000');
insert into AREA (id, aid, aname, cid)
values (3122, '654024', '巩留县', '654000');
insert into AREA (id, aid, aname, cid)
values (3123, '654025', '新源县', '654000');
insert into AREA (id, aid, aname, cid)
values (3124, '654026', '昭苏县', '654000');
insert into AREA (id, aid, aname, cid)
values (3125, '654027', '特克斯县', '654000');
insert into AREA (id, aid, aname, cid)
values (3126, '654028', '尼勒克县', '654000');
insert into AREA (id, aid, aname, cid)
values (3127, '654201', '塔城市', '654200');
insert into AREA (id, aid, aname, cid)
values (3128, '654202', '乌苏市', '654200');
insert into AREA (id, aid, aname, cid)
values (3129, '654221', '额敏县', '654200');
insert into AREA (id, aid, aname, cid)
values (3130, '654223', '沙湾县', '654200');
insert into AREA (id, aid, aname, cid)
values (3131, '654224', '托里县', '654200');
insert into AREA (id, aid, aname, cid)
values (3132, '654225', '裕民县', '654200');
insert into AREA (id, aid, aname, cid)
values (3133, '654226', '和布克赛尔蒙古自治县', '654200');
insert into AREA (id, aid, aname, cid)
values (3134, '654301', '阿勒泰市', '654300');
insert into AREA (id, aid, aname, cid)
values (3135, '654321', '布尔津县', '654300');
insert into AREA (id, aid, aname, cid)
values (3136, '654322', '富蕴县', '654300');
insert into AREA (id, aid, aname, cid)
values (3137, '654323', '福海县', '654300');
insert into AREA (id, aid, aname, cid)
values (3138, '654324', '哈巴河县', '654300');
insert into AREA (id, aid, aname, cid)
values (3139, '654325', '青河县', '654300');
insert into AREA (id, aid, aname, cid)
values (3140, '654326', '吉木乃县', '654300');
insert into AREA (id, aid, aname, cid)
values (3141, '659001', '石河子市', '659000');
insert into AREA (id, aid, aname, cid)
values (3142, '659002', '阿拉尔市', '659000');
insert into AREA (id, aid, aname, cid)
values (3143, '659003', '图木舒克市', '659000');
insert into AREA (id, aid, aname, cid)
values (3144, '659004', '五家渠市', '659000');
commit;
prompt 3144 records loaded
prompt Loading CITY...
insert into CITY (id, cid, cname, pid)
values (131, '360800', '吉安市', '360000');
insert into CITY (id, cid, cname, pid)
values (132, '360900', '宜春市', '360000');
insert into CITY (id, cid, cname, pid)
values (133, '361000', '抚州市', '360000');
insert into CITY (id, cid, cname, pid)
values (134, '361100', '上饶市', '360000');
insert into CITY (id, cid, cname, pid)
values (135, '370100', '济南市', '370000');
insert into CITY (id, cid, cname, pid)
values (136, '370200', '青岛市', '370000');
insert into CITY (id, cid, cname, pid)
values (137, '370300', '淄博市', '370000');
insert into CITY (id, cid, cname, pid)
values (138, '370400', '枣庄市', '370000');
insert into CITY (id, cid, cname, pid)
values (139, '370500', '东营市', '370000');
insert into CITY (id, cid, cname, pid)
values (140, '370600', '烟台市', '370000');
insert into CITY (id, cid, cname, pid)
values (141, '370700', '潍坊市', '370000');
insert into CITY (id, cid, cname, pid)
values (142, '370800', '济宁市', '370000');
insert into CITY (id, cid, cname, pid)
values (143, '370900', '泰安市', '370000');
insert into CITY (id, cid, cname, pid)
values (144, '371000', '威海市', '370000');
insert into CITY (id, cid, cname, pid)
values (145, '371100', '日照市', '370000');
insert into CITY (id, cid, cname, pid)
values (146, '371200', '莱芜市', '370000');
insert into CITY (id, cid, cname, pid)
values (147, '371300', '临沂市', '370000');
insert into CITY (id, cid, cname, pid)
values (148, '371400', '德州市', '370000');
insert into CITY (id, cid, cname, pid)
values (149, '371500', '聊城市', '370000');
insert into CITY (id, cid, cname, pid)
values (150, '371600', '滨州市', '370000');
insert into CITY (id, cid, cname, pid)
values (151, '371700', '荷泽市', '370000');
insert into CITY (id, cid, cname, pid)
values (152, '410100', '郑州市', '410000');
insert into CITY (id, cid, cname, pid)
values (153, '410200', '开封市', '410000');
insert into CITY (id, cid, cname, pid)
values (154, '410300', '洛阳市', '410000');
insert into CITY (id, cid, cname, pid)
values (155, '410400', '平顶山市', '410000');
insert into CITY (id, cid, cname, pid)
values (156, '410500', '安阳市', '410000');
insert into CITY (id, cid, cname, pid)
values (157, '410600', '鹤壁市', '410000');
insert into CITY (id, cid, cname, pid)
values (158, '410700', '新乡市', '410000');
insert into CITY (id, cid, cname, pid)
values (159, '410800', '焦作市', '410000');
insert into CITY (id, cid, cname, pid)
values (160, '410900', '濮阳市', '410000');
insert into CITY (id, cid, cname, pid)
values (161, '411000', '许昌市', '410000');
insert into CITY (id, cid, cname, pid)
values (162, '411100', '漯河市', '410000');
insert into CITY (id, cid, cname, pid)
values (163, '411200', '三门峡市', '410000');
insert into CITY (id, cid, cname, pid)
values (164, '411300', '南阳市', '410000');
insert into CITY (id, cid, cname, pid)
values (165, '411400', '商丘市', '410000');
insert into CITY (id, cid, cname, pid)
values (166, '411500', '信阳市', '410000');
insert into CITY (id, cid, cname, pid)
values (167, '411600', '周口市', '410000');
insert into CITY (id, cid, cname, pid)
values (168, '411700', '驻马店市', '410000');
insert into CITY (id, cid, cname, pid)
values (169, '420100', '武汉市', '420000');
insert into CITY (id, cid, cname, pid)
values (170, '420200', '黄石市', '420000');
insert into CITY (id, cid, cname, pid)
values (171, '420300', '十堰市', '420000');
insert into CITY (id, cid, cname, pid)
values (172, '420500', '宜昌市', '420000');
insert into CITY (id, cid, cname, pid)
values (173, '420600', '襄樊市', '420000');
insert into CITY (id, cid, cname, pid)
values (174, '420700', '鄂州市', '420000');
insert into CITY (id, cid, cname, pid)
values (175, '420800', '荆门市', '420000');
insert into CITY (id, cid, cname, pid)
values (176, '420900', '孝感市', '420000');
insert into CITY (id, cid, cname, pid)
values (177, '421000', '荆州市', '420000');
insert into CITY (id, cid, cname, pid)
values (178, '421100', '黄冈市', '420000');
insert into CITY (id, cid, cname, pid)
values (179, '421200', '咸宁市', '420000');
insert into CITY (id, cid, cname, pid)
values (180, '421300', '随州市', '420000');
insert into CITY (id, cid, cname, pid)
values (181, '422800', '恩施土家族苗族自治州', '420000');
insert into CITY (id, cid, cname, pid)
values (182, '429000', '省直辖行政单位', '420000');
insert into CITY (id, cid, cname, pid)
values (183, '430100', '长沙市', '430000');
insert into CITY (id, cid, cname, pid)
values (184, '430200', '株洲市', '430000');
insert into CITY (id, cid, cname, pid)
values (185, '430300', '湘潭市', '430000');
insert into CITY (id, cid, cname, pid)
values (186, '430400', '衡阳市', '430000');
insert into CITY (id, cid, cname, pid)
values (187, '430500', '邵阳市', '430000');
insert into CITY (id, cid, cname, pid)
values (188, '430600', '岳阳市', '430000');
insert into CITY (id, cid, cname, pid)
values (189, '430700', '常德市', '430000');
insert into CITY (id, cid, cname, pid)
values (190, '430800', '张家界市', '430000');
insert into CITY (id, cid, cname, pid)
values (191, '430900', '益阳市', '430000');
insert into CITY (id, cid, cname, pid)
values (192, '431000', '郴州市', '430000');
insert into CITY (id, cid, cname, pid)
values (193, '431100', '永州市', '430000');
insert into CITY (id, cid, cname, pid)
values (194, '431200', '怀化市', '430000');
insert into CITY (id, cid, cname, pid)
values (195, '431300', '娄底市', '430000');
insert into CITY (id, cid, cname, pid)
values (196, '433100', '湘西土家族苗族自治州', '430000');
insert into CITY (id, cid, cname, pid)
values (197, '440100', '广州市', '440000');
insert into CITY (id, cid, cname, pid)
values (198, '440200', '韶关市', '440000');
insert into CITY (id, cid, cname, pid)
values (199, '440300', '深圳市', '440000');
insert into CITY (id, cid, cname, pid)
values (200, '440400', '珠海市', '440000');
insert into CITY (id, cid, cname, pid)
values (201, '440500', '汕头市', '440000');
insert into CITY (id, cid, cname, pid)
values (202, '440600', '佛山市', '440000');
insert into CITY (id, cid, cname, pid)
values (203, '440700', '江门市', '440000');
insert into CITY (id, cid, cname, pid)
values (204, '440800', '湛江市', '440000');
insert into CITY (id, cid, cname, pid)
values (205, '440900', '茂名市', '440000');
insert into CITY (id, cid, cname, pid)
values (206, '441200', '肇庆市', '440000');
insert into CITY (id, cid, cname, pid)
values (207, '441300', '惠州市', '440000');
insert into CITY (id, cid, cname, pid)
values (208, '441400', '梅州市', '440000');
insert into CITY (id, cid, cname, pid)
values (209, '441500', '汕尾市', '440000');
insert into CITY (id, cid, cname, pid)
values (210, '441600', '河源市', '440000');
insert into CITY (id, cid, cname, pid)
values (211, '441700', '阳江市', '440000');
insert into CITY (id, cid, cname, pid)
values (212, '441800', '清远市', '440000');
insert into CITY (id, cid, cname, pid)
values (213, '441900', '东莞市', '440000');
insert into CITY (id, cid, cname, pid)
values (214, '442000', '中山市', '440000');
insert into CITY (id, cid, cname, pid)
values (215, '445100', '潮州市', '440000');
insert into CITY (id, cid, cname, pid)
values (216, '445200', '揭阳市', '440000');
insert into CITY (id, cid, cname, pid)
values (217, '445300', '云浮市', '440000');
insert into CITY (id, cid, cname, pid)
values (218, '450100', '南宁市', '450000');
insert into CITY (id, cid, cname, pid)
values (219, '450200', '柳州市', '450000');
insert into CITY (id, cid, cname, pid)
values (220, '450300', '桂林市', '450000');
insert into CITY (id, cid, cname, pid)
values (221, '450400', '梧州市', '450000');
insert into CITY (id, cid, cname, pid)
values (222, '450500', '北海市', '450000');
insert into CITY (id, cid, cname, pid)
values (223, '450600', '防城港市', '450000');
insert into CITY (id, cid, cname, pid)
values (224, '450700', '钦州市', '450000');
insert into CITY (id, cid, cname, pid)
values (225, '450800', '贵港市', '450000');
insert into CITY (id, cid, cname, pid)
values (226, '450900', '玉林市', '450000');
insert into CITY (id, cid, cname, pid)
values (227, '451000', '百色市', '450000');
insert into CITY (id, cid, cname, pid)
values (228, '451100', '贺州市', '450000');
insert into CITY (id, cid, cname, pid)
values (229, '451200', '河池市', '450000');
insert into CITY (id, cid, cname, pid)
values (230, '451300', '来宾市', '450000');
commit;
prompt 100 records committed...
insert into CITY (id, cid, cname, pid)
values (231, '451400', '崇左市', '450000');
insert into CITY (id, cid, cname, pid)
values (1, '110100', '北京市', '110000');
insert into CITY (id, cid, cname, pid)
values (2, '130100', '石家庄市', '130000');
insert into CITY (id, cid, cname, pid)
values (3, '130200', '唐山市', '130000');
insert into CITY (id, cid, cname, pid)
values (4, '130300', '秦皇岛市', '130000');
insert into CITY (id, cid, cname, pid)
values (5, '130400', '邯郸市', '130000');
insert into CITY (id, cid, cname, pid)
values (6, '130500', '邢台市', '130000');
insert into CITY (id, cid, cname, pid)
values (7, '130600', '保定市', '130000');
insert into CITY (id, cid, cname, pid)
values (8, '130700', '张家口市', '130000');
insert into CITY (id, cid, cname, pid)
values (9, '130800', '承德市', '130000');
insert into CITY (id, cid, cname, pid)
values (10, '130900', '沧州市', '130000');
insert into CITY (id, cid, cname, pid)
values (11, '131000', '廊坊市', '130000');
insert into CITY (id, cid, cname, pid)
values (12, '131100', '衡水市', '130000');
insert into CITY (id, cid, cname, pid)
values (13, '140100', '太原市', '140000');
insert into CITY (id, cid, cname, pid)
values (14, '140200', '大同市', '140000');
insert into CITY (id, cid, cname, pid)
values (15, '140300', '阳泉市', '140000');
insert into CITY (id, cid, cname, pid)
values (16, '140400', '长治市', '140000');
insert into CITY (id, cid, cname, pid)
values (17, '140500', '晋城市', '140000');
insert into CITY (id, cid, cname, pid)
values (18, '140600', '朔州市', '140000');
insert into CITY (id, cid, cname, pid)
values (19, '140700', '晋中市', '140000');
insert into CITY (id, cid, cname, pid)
values (20, '140800', '运城市', '140000');
insert into CITY (id, cid, cname, pid)
values (21, '140900', '忻州市', '140000');
insert into CITY (id, cid, cname, pid)
values (22, '141000', '临汾市', '140000');
insert into CITY (id, cid, cname, pid)
values (23, '141100', '吕梁市', '140000');
insert into CITY (id, cid, cname, pid)
values (24, '150100', '呼和浩特市', '150000');
insert into CITY (id, cid, cname, pid)
values (25, '150200', '包头市', '150000');
insert into CITY (id, cid, cname, pid)
values (26, '150300', '乌海市', '150000');
insert into CITY (id, cid, cname, pid)
values (27, '150400', '赤峰市', '150000');
insert into CITY (id, cid, cname, pid)
values (28, '150500', '通辽市', '150000');
insert into CITY (id, cid, cname, pid)
values (29, '150600', '鄂尔多斯市', '150000');
insert into CITY (id, cid, cname, pid)
values (30, '150700', '呼伦贝尔市', '150000');
insert into CITY (id, cid, cname, pid)
values (31, '150800', '巴彦淖尔市', '150000');
insert into CITY (id, cid, cname, pid)
values (32, '150900', '乌兰察布市', '150000');
insert into CITY (id, cid, cname, pid)
values (33, '152200', '兴安盟', '150000');
insert into CITY (id, cid, cname, pid)
values (34, '152500', '锡林郭勒盟', '150000');
insert into CITY (id, cid, cname, pid)
values (35, '152900', '阿拉善盟', '150000');
insert into CITY (id, cid, cname, pid)
values (36, '210100', '沈阳市', '210000');
insert into CITY (id, cid, cname, pid)
values (37, '210200', '大连市', '210000');
insert into CITY (id, cid, cname, pid)
values (38, '210300', '鞍山市', '210000');
insert into CITY (id, cid, cname, pid)
values (39, '210400', '抚顺市', '210000');
insert into CITY (id, cid, cname, pid)
values (40, '210500', '本溪市', '210000');
insert into CITY (id, cid, cname, pid)
values (41, '210600', '丹东市', '210000');
insert into CITY (id, cid, cname, pid)
values (42, '210700', '锦州市', '210000');
insert into CITY (id, cid, cname, pid)
values (43, '210800', '营口市', '210000');
insert into CITY (id, cid, cname, pid)
values (44, '210900', '阜新市', '210000');
insert into CITY (id, cid, cname, pid)
values (45, '211000', '辽阳市', '210000');
insert into CITY (id, cid, cname, pid)
values (46, '211100', '盘锦市', '210000');
insert into CITY (id, cid, cname, pid)
values (47, '211200', '铁岭市', '210000');
insert into CITY (id, cid, cname, pid)
values (48, '211300', '朝阳市', '210000');
insert into CITY (id, cid, cname, pid)
values (49, '211400', '葫芦岛市', '210000');
insert into CITY (id, cid, cname, pid)
values (50, '220100', '长春市', '220000');
insert into CITY (id, cid, cname, pid)
values (51, '220200', '吉林市', '220000');
insert into CITY (id, cid, cname, pid)
values (52, '220300', '四平市', '220000');
insert into CITY (id, cid, cname, pid)
values (53, '220400', '辽源市', '220000');
insert into CITY (id, cid, cname, pid)
values (54, '220500', '通化市', '220000');
insert into CITY (id, cid, cname, pid)
values (55, '220600', '白山市', '220000');
insert into CITY (id, cid, cname, pid)
values (56, '220700', '松原市', '220000');
insert into CITY (id, cid, cname, pid)
values (57, '220800', '白城市', '220000');
insert into CITY (id, cid, cname, pid)
values (58, '222400', '延边朝鲜族自治州', '220000');
insert into CITY (id, cid, cname, pid)
values (59, '230100', '哈尔滨市', '230000');
insert into CITY (id, cid, cname, pid)
values (60, '230200', '齐齐哈尔市', '230000');
insert into CITY (id, cid, cname, pid)
values (61, '230300', '鸡西市', '230000');
insert into CITY (id, cid, cname, pid)
values (62, '230400', '鹤岗市', '230000');
insert into CITY (id, cid, cname, pid)
values (63, '230500', '双鸭山市', '230000');
insert into CITY (id, cid, cname, pid)
values (64, '230600', '大庆市', '230000');
insert into CITY (id, cid, cname, pid)
values (65, '230700', '伊春市', '230000');
insert into CITY (id, cid, cname, pid)
values (66, '230800', '佳木斯市', '230000');
insert into CITY (id, cid, cname, pid)
values (67, '230900', '七台河市', '230000');
insert into CITY (id, cid, cname, pid)
values (68, '231000', '牡丹江市', '230000');
insert into CITY (id, cid, cname, pid)
values (69, '231100', '黑河市', '230000');
insert into CITY (id, cid, cname, pid)
values (70, '231200', '绥化市', '230000');
insert into CITY (id, cid, cname, pid)
values (71, '232700', '大兴安岭地区', '230000');
insert into CITY (id, cid, cname, pid)
values (72, '310100', '市辖区', '310000');
insert into CITY (id, cid, cname, pid)
values (73, '310200', '县', '310000');
insert into CITY (id, cid, cname, pid)
values (74, '320100', '南京市', '320000');
insert into CITY (id, cid, cname, pid)
values (75, '320200', '无锡市', '320000');
insert into CITY (id, cid, cname, pid)
values (76, '320300', '徐州市', '320000');
insert into CITY (id, cid, cname, pid)
values (77, '320400', '常州市', '320000');
insert into CITY (id, cid, cname, pid)
values (78, '320500', '苏州市', '320000');
insert into CITY (id, cid, cname, pid)
values (79, '320600', '南通市', '320000');
insert into CITY (id, cid, cname, pid)
values (80, '320700', '连云港市', '320000');
insert into CITY (id, cid, cname, pid)
values (81, '320800', '淮安市', '320000');
insert into CITY (id, cid, cname, pid)
values (82, '320900', '盐城市', '320000');
insert into CITY (id, cid, cname, pid)
values (83, '321000', '扬州市', '320000');
insert into CITY (id, cid, cname, pid)
values (84, '321100', '镇江市', '320000');
insert into CITY (id, cid, cname, pid)
values (85, '321200', '泰州市', '320000');
insert into CITY (id, cid, cname, pid)
values (86, '321300', '宿迁市', '320000');
insert into CITY (id, cid, cname, pid)
values (87, '330100', '杭州市', '330000');
insert into CITY (id, cid, cname, pid)
values (88, '330200', '宁波市', '330000');
insert into CITY (id, cid, cname, pid)
values (89, '330300', '温州市', '330000');
insert into CITY (id, cid, cname, pid)
values (90, '330400', '嘉兴市', '330000');
insert into CITY (id, cid, cname, pid)
values (91, '330500', '湖州市', '330000');
insert into CITY (id, cid, cname, pid)
values (92, '330600', '绍兴市', '330000');
insert into CITY (id, cid, cname, pid)
values (93, '330700', '金华市', '330000');
insert into CITY (id, cid, cname, pid)
values (94, '330800', '衢州市', '330000');
insert into CITY (id, cid, cname, pid)
values (95, '330900', '舟山市', '330000');
insert into CITY (id, cid, cname, pid)
values (96, '331000', '台州市', '330000');
insert into CITY (id, cid, cname, pid)
values (97, '331100', '丽水市', '330000');
insert into CITY (id, cid, cname, pid)
values (98, '340100', '合肥市', '340000');
insert into CITY (id, cid, cname, pid)
values (99, '340200', '芜湖市', '340000');
commit;
prompt 200 records committed...
insert into CITY (id, cid, cname, pid)
values (100, '340300', '蚌埠市', '340000');
insert into CITY (id, cid, cname, pid)
values (101, '340400', '淮南市', '340000');
insert into CITY (id, cid, cname, pid)
values (102, '340500', '马鞍山市', '340000');
insert into CITY (id, cid, cname, pid)
values (103, '340600', '淮北市', '340000');
insert into CITY (id, cid, cname, pid)
values (104, '340700', '铜陵市', '340000');
insert into CITY (id, cid, cname, pid)
values (105, '340800', '安庆市', '340000');
insert into CITY (id, cid, cname, pid)
values (106, '341000', '黄山市', '340000');
insert into CITY (id, cid, cname, pid)
values (107, '341100', '滁州市', '340000');
insert into CITY (id, cid, cname, pid)
values (108, '341200', '阜阳市', '340000');
insert into CITY (id, cid, cname, pid)
values (109, '341300', '宿州市', '340000');
insert into CITY (id, cid, cname, pid)
values (110, '341400', '巢湖市', '340000');
insert into CITY (id, cid, cname, pid)
values (111, '341500', '六安市', '340000');
insert into CITY (id, cid, cname, pid)
values (112, '341600', '亳州市', '340000');
insert into CITY (id, cid, cname, pid)
values (113, '341700', '池州市', '340000');
insert into CITY (id, cid, cname, pid)
values (114, '341800', '宣城市', '340000');
insert into CITY (id, cid, cname, pid)
values (115, '350100', '福州市', '350000');
insert into CITY (id, cid, cname, pid)
values (116, '350200', '厦门市', '350000');
insert into CITY (id, cid, cname, pid)
values (117, '350300', '莆田市', '350000');
insert into CITY (id, cid, cname, pid)
values (118, '350400', '三明市', '350000');
insert into CITY (id, cid, cname, pid)
values (119, '350500', '泉州市', '350000');
insert into CITY (id, cid, cname, pid)
values (120, '350600', '漳州市', '350000');
insert into CITY (id, cid, cname, pid)
values (121, '350700', '南平市', '350000');
insert into CITY (id, cid, cname, pid)
values (122, '350800', '龙岩市', '350000');
insert into CITY (id, cid, cname, pid)
values (123, '350900', '宁德市', '350000');
insert into CITY (id, cid, cname, pid)
values (124, '360100', '南昌市', '360000');
insert into CITY (id, cid, cname, pid)
values (125, '360200', '景德镇市', '360000');
insert into CITY (id, cid, cname, pid)
values (126, '360300', '萍乡市', '360000');
insert into CITY (id, cid, cname, pid)
values (127, '360400', '九江市', '360000');
insert into CITY (id, cid, cname, pid)
values (128, '360500', '新余市', '360000');
insert into CITY (id, cid, cname, pid)
values (129, '360600', '鹰潭市', '360000');
insert into CITY (id, cid, cname, pid)
values (130, '360700', '赣州市', '360000');
insert into CITY (id, cid, cname, pid)
values (232, '460100', '海口市', '460000');
insert into CITY (id, cid, cname, pid)
values (233, '460200', '三亚市', '460000');
insert into CITY (id, cid, cname, pid)
values (234, '469000', '省直辖县级行政单位', '460000');
insert into CITY (id, cid, cname, pid)
values (235, '500100', '市辖区', '500000');
insert into CITY (id, cid, cname, pid)
values (236, '500200', '县', '500000');
insert into CITY (id, cid, cname, pid)
values (237, '500300', '市', '500000');
insert into CITY (id, cid, cname, pid)
values (238, '510100', '成都市', '510000');
insert into CITY (id, cid, cname, pid)
values (239, '510300', '自贡市', '510000');
insert into CITY (id, cid, cname, pid)
values (240, '510400', '攀枝花市', '510000');
insert into CITY (id, cid, cname, pid)
values (241, '510500', '泸州市', '510000');
insert into CITY (id, cid, cname, pid)
values (242, '510600', '德阳市', '510000');
insert into CITY (id, cid, cname, pid)
values (243, '510700', '绵阳市', '510000');
insert into CITY (id, cid, cname, pid)
values (244, '510800', '广元市', '510000');
insert into CITY (id, cid, cname, pid)
values (245, '510900', '遂宁市', '510000');
insert into CITY (id, cid, cname, pid)
values (246, '511000', '内江市', '510000');
insert into CITY (id, cid, cname, pid)
values (247, '511100', '乐山市', '510000');
insert into CITY (id, cid, cname, pid)
values (248, '511300', '南充市', '510000');
insert into CITY (id, cid, cname, pid)
values (249, '511400', '眉山市', '510000');
insert into CITY (id, cid, cname, pid)
values (250, '511500', '宜宾市', '510000');
insert into CITY (id, cid, cname, pid)
values (251, '511600', '广安市', '510000');
insert into CITY (id, cid, cname, pid)
values (252, '511700', '达州市', '510000');
insert into CITY (id, cid, cname, pid)
values (253, '511800', '雅安市', '510000');
insert into CITY (id, cid, cname, pid)
values (254, '511900', '巴中市', '510000');
insert into CITY (id, cid, cname, pid)
values (255, '512000', '资阳市', '510000');
insert into CITY (id, cid, cname, pid)
values (256, '513200', '阿坝藏族羌族自治州', '510000');
insert into CITY (id, cid, cname, pid)
values (257, '513300', '甘孜藏族自治州', '510000');
insert into CITY (id, cid, cname, pid)
values (258, '513400', '凉山彝族自治州', '510000');
insert into CITY (id, cid, cname, pid)
values (259, '520100', '贵阳市', '520000');
insert into CITY (id, cid, cname, pid)
values (260, '520200', '六盘水市', '520000');
insert into CITY (id, cid, cname, pid)
values (261, '520300', '遵义市', '520000');
insert into CITY (id, cid, cname, pid)
values (262, '520400', '安顺市', '520000');
insert into CITY (id, cid, cname, pid)
values (263, '522200', '铜仁地区', '520000');
insert into CITY (id, cid, cname, pid)
values (264, '522300', '黔西南布依族苗族自治州', '520000');
insert into CITY (id, cid, cname, pid)
values (265, '522400', '毕节地区', '520000');
insert into CITY (id, cid, cname, pid)
values (266, '522600', '黔东南苗族侗族自治州', '520000');
insert into CITY (id, cid, cname, pid)
values (267, '522700', '黔南布依族苗族自治州', '520000');
insert into CITY (id, cid, cname, pid)
values (268, '530100', '昆明市', '530000');
insert into CITY (id, cid, cname, pid)
values (269, '530300', '曲靖市', '530000');
insert into CITY (id, cid, cname, pid)
values (270, '530400', '玉溪市', '530000');
insert into CITY (id, cid, cname, pid)
values (271, '530500', '保山市', '530000');
insert into CITY (id, cid, cname, pid)
values (272, '530600', '昭通市', '530000');
insert into CITY (id, cid, cname, pid)
values (273, '530700', '丽江市', '530000');
insert into CITY (id, cid, cname, pid)
values (274, '530800', '思茅市', '530000');
insert into CITY (id, cid, cname, pid)
values (275, '530900', '临沧市', '530000');
insert into CITY (id, cid, cname, pid)
values (276, '532300', '楚雄彝族自治州', '530000');
insert into CITY (id, cid, cname, pid)
values (277, '532500', '红河哈尼族彝族自治州', '530000');
insert into CITY (id, cid, cname, pid)
values (278, '532600', '文山壮族苗族自治州', '530000');
insert into CITY (id, cid, cname, pid)
values (279, '532800', '西双版纳傣族自治州', '530000');
insert into CITY (id, cid, cname, pid)
values (280, '532900', '大理白族自治州', '530000');
insert into CITY (id, cid, cname, pid)
values (281, '533100', '德宏傣族景颇族自治州', '530000');
insert into CITY (id, cid, cname, pid)
values (282, '533300', '怒江傈僳族自治州', '530000');
insert into CITY (id, cid, cname, pid)
values (283, '533400', '迪庆藏族自治州', '530000');
insert into CITY (id, cid, cname, pid)
values (284, '540100', '拉萨市', '540000');
insert into CITY (id, cid, cname, pid)
values (285, '542100', '昌都地区', '540000');
insert into CITY (id, cid, cname, pid)
values (286, '542200', '山南地区', '540000');
insert into CITY (id, cid, cname, pid)
values (287, '542300', '日喀则地区', '540000');
insert into CITY (id, cid, cname, pid)
values (288, '542400', '那曲地区', '540000');
insert into CITY (id, cid, cname, pid)
values (289, '542500', '阿里地区', '540000');
insert into CITY (id, cid, cname, pid)
values (290, '542600', '林芝地区', '540000');
insert into CITY (id, cid, cname, pid)
values (291, '610100', '西安市', '610000');
insert into CITY (id, cid, cname, pid)
values (292, '610200', '铜川市', '610000');
insert into CITY (id, cid, cname, pid)
values (293, '610300', '宝鸡市', '610000');
insert into CITY (id, cid, cname, pid)
values (294, '610400', '咸阳市', '610000');
insert into CITY (id, cid, cname, pid)
values (295, '610500', '渭南市', '610000');
insert into CITY (id, cid, cname, pid)
values (296, '610600', '延安市', '610000');
insert into CITY (id, cid, cname, pid)
values (297, '610700', '汉中市', '610000');
insert into CITY (id, cid, cname, pid)
values (298, '610800', '榆林市', '610000');
insert into CITY (id, cid, cname, pid)
values (299, '610900', '安康市', '610000');
insert into CITY (id, cid, cname, pid)
values (300, '611000', '商洛市', '610000');
commit;
prompt 300 records committed...
insert into CITY (id, cid, cname, pid)
values (301, '620100', '兰州市', '620000');
insert into CITY (id, cid, cname, pid)
values (302, '620200', '嘉峪关市', '620000');
insert into CITY (id, cid, cname, pid)
values (303, '620300', '金昌市', '620000');
insert into CITY (id, cid, cname, pid)
values (304, '620400', '白银市', '620000');
insert into CITY (id, cid, cname, pid)
values (305, '620500', '天水市', '620000');
insert into CITY (id, cid, cname, pid)
values (306, '620600', '武威市', '620000');
insert into CITY (id, cid, cname, pid)
values (307, '620700', '张掖市', '620000');
insert into CITY (id, cid, cname, pid)
values (308, '620800', '平凉市', '620000');
insert into CITY (id, cid, cname, pid)
values (309, '620900', '酒泉市', '620000');
insert into CITY (id, cid, cname, pid)
values (310, '621000', '庆阳市', '620000');
insert into CITY (id, cid, cname, pid)
values (311, '621100', '定西市', '620000');
insert into CITY (id, cid, cname, pid)
values (312, '621200', '陇南市', '620000');
insert into CITY (id, cid, cname, pid)
values (313, '622900', '临夏回族自治州', '620000');
insert into CITY (id, cid, cname, pid)
values (314, '623000', '甘南藏族自治州', '620000');
insert into CITY (id, cid, cname, pid)
values (315, '630100', '西宁市', '630000');
insert into CITY (id, cid, cname, pid)
values (316, '632100', '海东地区', '630000');
insert into CITY (id, cid, cname, pid)
values (317, '632200', '海北藏族自治州', '630000');
insert into CITY (id, cid, cname, pid)
values (318, '632300', '黄南藏族自治州', '630000');
insert into CITY (id, cid, cname, pid)
values (319, '632500', '海南藏族自治州', '630000');
insert into CITY (id, cid, cname, pid)
values (320, '632600', '果洛藏族自治州', '630000');
insert into CITY (id, cid, cname, pid)
values (321, '632700', '玉树藏族自治州', '630000');
insert into CITY (id, cid, cname, pid)
values (322, '632800', '海西蒙古族藏族自治州', '630000');
insert into CITY (id, cid, cname, pid)
values (323, '640100', '银川市', '640000');
insert into CITY (id, cid, cname, pid)
values (324, '640200', '石嘴山市', '640000');
insert into CITY (id, cid, cname, pid)
values (325, '640300', '吴忠市', '640000');
insert into CITY (id, cid, cname, pid)
values (326, '640400', '固原市', '640000');
insert into CITY (id, cid, cname, pid)
values (327, '640500', '中卫市', '640000');
insert into CITY (id, cid, cname, pid)
values (328, '650100', '乌鲁木齐市', '650000');
insert into CITY (id, cid, cname, pid)
values (329, '650200', '克拉玛依市', '650000');
insert into CITY (id, cid, cname, pid)
values (330, '652100', '吐鲁番地区', '650000');
insert into CITY (id, cid, cname, pid)
values (331, '652200', '哈密地区', '650000');
insert into CITY (id, cid, cname, pid)
values (332, '652300', '昌吉回族自治州', '650000');
insert into CITY (id, cid, cname, pid)
values (333, '652700', '博尔塔拉蒙古自治州', '650000');
insert into CITY (id, cid, cname, pid)
values (334, '652800', '巴音郭楞蒙古自治州', '650000');
insert into CITY (id, cid, cname, pid)
values (335, '652900', '阿克苏地区', '650000');
insert into CITY (id, cid, cname, pid)
values (336, '653000', '克孜勒苏柯尔克孜自治州', '650000');
insert into CITY (id, cid, cname, pid)
values (337, '653100', '喀什地区', '650000');
insert into CITY (id, cid, cname, pid)
values (338, '653200', '和田地区', '650000');
insert into CITY (id, cid, cname, pid)
values (339, '654000', '伊犁哈萨克自治州', '650000');
insert into CITY (id, cid, cname, pid)
values (340, '654200', '塔城地区', '650000');
insert into CITY (id, cid, cname, pid)
values (341, '654300', '阿勒泰地区', '650000');
insert into CITY (id, cid, cname, pid)
values (342, '659000', '省直辖行政单位', '650000');
commit;
prompt 342 records loaded
prompt Loading PROVINCE...
insert into PROVINCE (id, pid, pname)
values (1, '110000', '北京市');
insert into PROVINCE (id, pid, pname)
values (2, '120000', '天津市');
insert into PROVINCE (id, pid, pname)
values (3, '130000', '河北省');
insert into PROVINCE (id, pid, pname)
values (4, '140000', '山西省');
insert into PROVINCE (id, pid, pname)
values (5, '150000', '内蒙古');
insert into PROVINCE (id, pid, pname)
values (6, '210000', '辽宁省');
insert into PROVINCE (id, pid, pname)
values (7, '220000', '吉林省');
insert into PROVINCE (id, pid, pname)
values (8, '230000', '黑龙江');
insert into PROVINCE (id, pid, pname)
values (9, '310000', '上海市');
insert into PROVINCE (id, pid, pname)
values (10, '320000', '江苏省');
insert into PROVINCE (id, pid, pname)
values (11, '330000', '浙江省');
insert into PROVINCE (id, pid, pname)
values (12, '340000', '安徽省');
insert into PROVINCE (id, pid, pname)
values (13, '350000', '福建省');
insert into PROVINCE (id, pid, pname)
values (14, '360000', '江西省');
insert into PROVINCE (id, pid, pname)
values (15, '370000', '山东省');
insert into PROVINCE (id, pid, pname)
values (16, '410000', '河南省');
insert into PROVINCE (id, pid, pname)
values (17, '420000', '湖北省');
insert into PROVINCE (id, pid, pname)
values (18, '430000', '湖南省');
insert into PROVINCE (id, pid, pname)
values (19, '440000', '广东省');
insert into PROVINCE (id, pid, pname)
values (20, '450000', '广  西');
insert into PROVINCE (id, pid, pname)
values (21, '460000', '海南省');
insert into PROVINCE (id, pid, pname)
values (22, '500000', '重庆市');
insert into PROVINCE (id, pid, pname)
values (23, '510000', '四川省');
insert into PROVINCE (id, pid, pname)
values (24, '520000', '贵州省');
insert into PROVINCE (id, pid, pname)
values (25, '530000', '云南省');
insert into PROVINCE (id, pid, pname)
values (26, '540000', '西  藏');
insert into PROVINCE (id, pid, pname)
values (27, '610000', '陕西省');
insert into PROVINCE (id, pid, pname)
values (28, '620000', '甘肃省');
insert into PROVINCE (id, pid, pname)
values (29, '630000', '青海省');
insert into PROVINCE (id, pid, pname)
values (30, '640000', '宁  夏');
insert into PROVINCE (id, pid, pname)
values (31, '650000', '新  疆');
insert into PROVINCE (id, pid, pname)
values (32, '710000', '台湾省');
insert into PROVINCE (id, pid, pname)
values (33, '810000', '香  港');
insert into PROVINCE (id, pid, pname)
values (34, '820000', '澳  门');
commit;
prompt 34 records loaded
prompt Loading TB_ACCOUNT...
insert into TB_ACCOUNT (id, userid, availablebalance, receiveinterest, receiveprincipal, returnamount, freezingamount, creditline, surpluscreditline, transactionpassword)
values (70, 89, 50161.057, .001, .001, 0, 0, 50000, 50000, 123456);
insert into TB_ACCOUNT (id, userid, availablebalance, receiveinterest, receiveprincipal, returnamount, freezingamount, creditline, surpluscreditline, transactionpassword)
values (72, 91, 49597.359, 0, 0, -.001, 0, 50000, 49999.999, 123456);
insert into TB_ACCOUNT (id, userid, availablebalance, receiveinterest, receiveprincipal, returnamount, freezingamount, creditline, surpluscreditline, transactionpassword)
values (71, 90, 50241.584, 0, 0, 0, 0, 50000, 50000, 123456);
commit;
prompt 3 records loaded
prompt Loading TB_ADVERT...
prompt Table is empty
prompt Loading TB_BIDCHECK...
insert into TB_BIDCHECK (borrowuserid, borrowusername, input, borrowmoney, borrowtime, repaytime, biddescribe, bidstatus, borrowmethod, methoddescribe, bidid, bidtime)
values ('zhangsenyao', '张森尧', '10000元', '50000元', to_date('12-12-2018', 'dd-mm-yyyy'), '一年', '没钱了', null, '信用贷', '有信用卡', 3, '3天');
insert into TB_BIDCHECK (borrowuserid, borrowusername, input, borrowmoney, borrowtime, repaytime, biddescribe, bidstatus, borrowmethod, methoddescribe, bidid, bidtime)
values ('luruihua', '芦瑞华', '10000元', '50000元', to_date('12-12-2018', 'dd-mm-yyyy'), '一年', '没钱了', null, '信用贷', '有信用卡', 2, '3天');
insert into TB_BIDCHECK (borrowuserid, borrowusername, input, borrowmoney, borrowtime, repaytime, biddescribe, bidstatus, borrowmethod, methoddescribe, bidid, bidtime)
values ('gongyongqing', '功用清', '10000元', '50000元', to_date('12-12-2018', 'dd-mm-yyyy'), '一年', '没钱了', '拒绝', '信用贷', '有信用卡', 4, '3天');
insert into TB_BIDCHECK (borrowuserid, borrowusername, input, borrowmoney, borrowtime, repaytime, biddescribe, bidstatus, borrowmethod, methoddescribe, bidid, bidtime)
values ('maxun', '马勋', '10000元', '50000元', to_date('12-12-2018', 'dd-mm-yyyy'), '一年', '没钱了', '拒绝', '信用贷', '有信用卡', 1, '3天');
commit;
prompt 4 records loaded
prompt Loading TB_BIDINFO...
insert into TB_BIDINFO (id, userid, bidamount, bidcurrentamount, bidrepaymentmethod, bidrate, biddeadline, bidissuedate, biddeadday, biddeaddate, bidapplydate, biddesc, bidtype, bidstate)
values (91, 91, 10000, 10000, '等额本息', 2, '3', to_date('12-01-2019 11:25:47', 'dd-mm-yyyy hh24:mi:ss'), '3', to_date('15-01-2019 11:25:47', 'dd-mm-yyyy hh24:mi:ss'), to_date('12-01-2019 11:23:14', 'dd-mm-yyyy hh24:mi:ss'), '买房买车', '信用贷', '还款结束');
commit;
prompt 1 records loaded
prompt Loading TB_BID_AUDIT...
insert into TB_BID_AUDIT (id, userid, bidid, auditid, audittime, auditresult, auditremarks, applytime)
values (154, 91, 91, 44, to_date('12-01-2019 11:28:33', 'dd-mm-yyyy hh24:mi:ss'), '还款中', '系统审核', to_date('12-01-2019 11:23:14', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_BID_AUDIT (id, userid, bidid, auditid, audittime, auditresult, auditremarks, applytime)
values (151, 91, 91, 51, to_date('12-01-2019 11:25:33', 'dd-mm-yyyy hh24:mi:ss'), '满标一审通过', 'keyi', to_date('12-01-2019', 'dd-mm-yyyy'));
insert into TB_BID_AUDIT (id, userid, bidid, auditid, audittime, auditresult, auditremarks, applytime)
values (152, 91, 91, 51, to_date('12-01-2019 11:25:47', 'dd-mm-yyyy hh24:mi:ss'), '满标二审通过', '666', to_date('12-01-2019', 'dd-mm-yyyy'));
insert into TB_BID_AUDIT (id, userid, bidid, auditid, audittime, auditresult, auditremarks, applytime)
values (153, 91, 91, 44, to_date('12-01-2019 11:26:52', 'dd-mm-yyyy hh24:mi:ss'), '还款中', '系统审核', to_date('12-01-2019 11:23:14', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_BID_AUDIT (id, userid, bidid, auditid, audittime, auditresult, auditremarks, applytime)
values (149, 91, 91, 51, to_date('12-01-2019 11:23:40', 'dd-mm-yyyy hh24:mi:ss'), '审核通过', '可以', to_date('12-01-2019', 'dd-mm-yyyy'));
insert into TB_BID_AUDIT (id, userid, bidid, auditid, audittime, auditresult, auditremarks, applytime)
values (150, 90, 91, 44, to_date('12-01-2019 11:25:11', 'dd-mm-yyyy hh24:mi:ss'), '满标', '系统审核', null);
insert into TB_BID_AUDIT (id, userid, bidid, auditid, audittime, auditresult, auditremarks, applytime)
values (155, 91, 91, 44, to_date('12-01-2019 11:28:56', 'dd-mm-yyyy hh24:mi:ss'), '还款中', '系统审核', to_date('12-01-2019 11:23:14', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 7 records loaded
prompt Loading TB_BID_REPAY_INFO...
insert into TB_BID_REPAY_INFO (id, bidid, bidrepayamount, bidrepaydate, bidrepaydeaddate, bidnextrepaydate, bidnextreapyamount, bidrepaystate, bidrepaynumber, bidrepaytotpmts, bidrepaymethod, bidrepayuserid)
values (73, 91, 3467.547, null, to_date('12-02-2019 11:25:47', 'dd-mm-yyyy hh24:mi:ss'), null, null, '已还款', '1', '3', '等额本息', 91);
insert into TB_BID_REPAY_INFO (id, bidid, bidrepayamount, bidrepaydate, bidrepaydeaddate, bidnextrepaydate, bidnextreapyamount, bidrepaystate, bidrepaynumber, bidrepaytotpmts, bidrepaymethod, bidrepayuserid)
values (74, 91, 3467.547, null, to_date('12-03-2019 11:25:47', 'dd-mm-yyyy hh24:mi:ss'), null, null, '已还款', '2', '3', '等额本息', 91);
insert into TB_BID_REPAY_INFO (id, bidid, bidrepayamount, bidrepaydate, bidrepaydeaddate, bidnextrepaydate, bidnextreapyamount, bidrepaystate, bidrepaynumber, bidrepaytotpmts, bidrepaymethod, bidrepayuserid)
values (75, 91, 3467.547, null, to_date('12-04-2019 11:25:47', 'dd-mm-yyyy hh24:mi:ss'), null, null, '已还款', '3', '3', '等额本息', 91);
commit;
prompt 3 records loaded
prompt Loading TB_BID_SUBMIT...
insert into TB_BID_SUBMIT (id, bidinfoid, userid, bidamount, bidrate, biddate, username)
values (67, 91, 89, 4000, 161.056, to_date('12-01-2019 11:24:34', 'dd-mm-yyyy hh24:mi:ss'), 'admin2');
insert into TB_BID_SUBMIT (id, bidinfoid, userid, bidamount, bidrate, biddate, username)
values (68, 91, 90, 6000, 241.584, to_date('12-01-2019 11:25:11', 'dd-mm-yyyy hh24:mi:ss'), 'admin3');
commit;
prompt 2 records loaded
prompt Loading TB_DEPT...
insert into TB_DEPT (id, dname, des, state)
values (1, '管理部', '管理人员', null);
insert into TB_DEPT (id, dname, des, state)
values (2, '开发部', '开发人员', null);
insert into TB_DEPT (id, dname, des, state)
values (3, '审核部', '审核人员', null);
insert into TB_DEPT (id, dname, des, state)
values (61, '技术部', '系统管理', '开启');
commit;
prompt 4 records loaded
prompt Loading TB_EMP...
insert into TB_EMP (id, username, password, roleid, empname, deptno, sex, hiredate, sal, comm, idcard, tel)
values (51, 'luruihua', 'luruihua', 1, '芦瑞华', 1, '男', to_date('05-12-2018', 'dd-mm-yyyy'), 100000, 10000, '411282199605316512', '13253959318');
insert into TB_EMP (id, username, password, roleid, empname, deptno, sex, hiredate, sal, comm, idcard, tel)
values (81, 'zhangsenyao', '123456', 2, '张森姚', 3, '男', to_date('08-03-2018', 'dd-mm-yyyy'), 9000, 1000, '411282199605316500', '13253959318');
commit;
prompt 2 records loaded
prompt Loading TB_FWDINFO...
insert into TB_FWDINFO (userid, userpaypsw, userbanknum, useremail, fwdinfoid, userhead)
values (90, '123456', null, null, 71, '9ebafefb-8566-4d6a-a0e8-12c39be602b6.png');
insert into TB_FWDINFO (userid, userpaypsw, userbanknum, useremail, fwdinfoid, userhead)
values (89, '123456', null, null, 70, '303b955d-dce9-4b24-b018-4a8be2485fc6.jpg');
insert into TB_FWDINFO (userid, userpaypsw, userbanknum, useremail, fwdinfoid, userhead)
values (91, '123456', null, null, 72, '2982d697-ce0a-482b-b462-9d8a020e2058.jpg');
commit;
prompt 3 records loaded
prompt Loading TB_FWDLOGIN...
insert into TB_FWDLOGIN (userid, username, userpsw, usertel, userrec, userexist)
values (90, 'admin3', '123456', '18838266521', null, 5);
insert into TB_FWDLOGIN (userid, username, userpsw, usertel, userrec, userexist)
values (89, 'admin2', '123456', '13253959318', null, 5);
insert into TB_FWDLOGIN (userid, username, userpsw, usertel, userrec, userexist)
values (91, 'admin1', '123456', '15837378087', null, 5);
commit;
prompt 3 records loaded
prompt Loading TB_LOG...
insert into TB_LOG (id, username, ip, logtime)
values (10, 'luruihua', '0:0:0:0:0:0:0:1', to_date('29-12-2018 08:54:20', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (11, 'luruihua', '0:0:0:0:0:0:0:1', to_date('29-12-2018 09:09:38', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (81, 'luruihua', '0:0:0:0:0:0:0:1', to_date('11-01-2019 08:50:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (90, 'luruihua', '0:0:0:0:0:0:0:1', to_date('11-01-2019 12:02:55', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (102, 'luruihua', '0:0:0:0:0:0:0:1', to_date('14-01-2019 11:28:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (8, 'luruihua', '127.0.0.1', to_date('28-12-2018 22:17:55', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (9, 'maxun', '127.0.0.1', to_date('28-12-2018 22:18:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (25, 'luruihua', '0:0:0:0:0:0:0:1', to_date('05-01-2019 15:52:38', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (41, 'luruihua', '0:0:0:0:0:0:0:1', to_date('07-01-2019 18:04:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (42, 'luruihua', '0:0:0:0:0:0:0:1', to_date('07-01-2019 18:05:29', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (43, 'luruihua', '0:0:0:0:0:0:0:1', to_date('07-01-2019 18:05:49', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (49, 'luruihua', '0:0:0:0:0:0:0:1', to_date('08-01-2019 14:47:58', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (50, 'luruihua', '0:0:0:0:0:0:0:1', to_date('08-01-2019 14:53:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (51, 'luruihua', '0:0:0:0:0:0:0:1', to_date('08-01-2019 14:53:44', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (54, 'admin', '0:0:0:0:0:0:0:1', to_date('08-01-2019 15:56:36', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (55, 'luruihua', '0:0:0:0:0:0:0:1', to_date('08-01-2019 15:57:09', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (56, 'admin', '0:0:0:0:0:0:0:1', to_date('08-01-2019 15:57:31', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (57, 'admin', '0:0:0:0:0:0:0:1', to_date('08-01-2019 15:57:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (87, 'gongyongqin', '0:0:0:0:0:0:0:1', to_date('11-01-2019 10:20:37', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (88, 'luruihua', '0:0:0:0:0:0:0:1', to_date('11-01-2019 10:21:19', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (94, 'luruihua', '0:0:0:0:0:0:0:1', to_date('12-01-2019 09:35:25', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (95, 'luruihua', '0:0:0:0:0:0:0:1', to_date('12-01-2019 09:41:07', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (99, 'zhangsenyao', '0:0:0:0:0:0:0:1', to_date('12-01-2019 11:33:16', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (100, 'luruihua', '0:0:0:0:0:0:0:1', to_date('12-01-2019 11:33:42', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (101, 'luruihua', '0:0:0:0:0:0:0:1', to_date('14-01-2019 11:22:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (16, 'luruihua', '0:0:0:0:0:0:0:1', to_date('29-12-2018 09:42:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (52, 'luruihua', '0:0:0:0:0:0:0:1', to_date('08-01-2019 15:43:18', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (53, 'luruihua', '0:0:0:0:0:0:0:1', to_date('08-01-2019 15:52:25', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (59, 'luruihua', '0:0:0:0:0:0:0:1', to_date('09-01-2019 15:48:26', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (60, 'luruihua', '127.0.0.1', to_date('09-01-2019 15:52:07', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (61, 'luruihua', '0:0:0:0:0:0:0:1', to_date('09-01-2019 16:11:18', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (83, 'luruihua', '127.0.0.1', to_date('11-01-2019 09:02:11', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (85, 'luruihua', '0:0:0:0:0:0:0:1', to_date('11-01-2019 09:29:29', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (86, 'luruihua', '0:0:0:0:0:0:0:1', to_date('11-01-2019 09:29:30', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (89, 'luruihua', '0:0:0:0:0:0:0:1', to_date('11-01-2019 11:21:27', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (92, 'luruihua', '0:0:0:0:0:0:0:1', to_date('12-01-2019 08:43:41', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (93, 'luruihua', '0:0:0:0:0:0:0:1', to_date('12-01-2019 09:12:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (98, 'luruihua', '0:0:0:0:0:0:0:1', to_date('12-01-2019 11:31:43', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (121, 'luruihua', '0:0:0:0:0:0:0:1', to_date('05-02-2019 20:42:37', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (141, 'luruihua', '0:0:0:0:0:0:0:1', to_date('29-03-2019 22:34:16', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (14, 'luruihua', '0:0:0:0:0:0:0:1', to_date('29-12-2018 09:10:47', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (15, 'luruihua', '0:0:0:0:0:0:0:1', to_date('29-12-2018 09:12:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (44, 'luruihua', '0:0:0:0:0:0:0:1', to_date('07-01-2019 18:09:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (46, 'zhangsenyao', '0:0:0:0:0:0:0:1', to_date('08-01-2019 14:21:47', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (47, 'luruihua', '0:0:0:0:0:0:0:1', to_date('08-01-2019 14:22:08', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (48, 'luruihua', '0:0:0:0:0:0:0:1', to_date('08-01-2019 14:33:30', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (58, 'luruihua', '0:0:0:0:0:0:0:1', to_date('09-01-2019 15:06:16', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (12, 'luruihua', '0:0:0:0:0:0:0:1', to_date('29-12-2018 09:10:14', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (13, 'maxun', '0:0:0:0:0:0:0:1', to_date('29-12-2018 09:10:35', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (62, 'luruihua', '0:0:0:0:0:0:0:1', to_date('10-01-2019 09:22:12', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (84, 'luruihua', '0:0:0:0:0:0:0:1', to_date('11-01-2019 09:10:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (91, 'luruihua', '0:0:0:0:0:0:0:1', to_date('11-01-2019 20:38:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (96, 'luruihua', '0:0:0:0:0:0:0:1', to_date('12-01-2019 10:43:30', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (97, 'luruihua', '0:0:0:0:0:0:0:1', to_date('12-01-2019 10:44:17', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (21, 'luruihua', '0:0:0:0:0:0:0:1', to_date('05-01-2019 15:28:24', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (22, 'luruihua', '0:0:0:0:0:0:0:1', to_date('05-01-2019 15:32:48', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (23, 'luruihua', '0:0:0:0:0:0:0:1', to_date('05-01-2019 15:33:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (24, 'luruihua', '0:0:0:0:0:0:0:1', to_date('05-01-2019 15:36:31', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (26, 'luruihua', '0:0:0:0:0:0:0:1', to_date('05-01-2019 15:52:55', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (27, 'luruihua', '0:0:0:0:0:0:0:1', to_date('05-01-2019 15:56:27', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (28, 'luruihua', '0:0:0:0:0:0:0:1', to_date('05-01-2019 16:04:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (45, 'luruihua', '0:0:0:0:0:0:0:1', to_date('08-01-2019 14:16:04', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (63, 'luruihua', '0:0:0:0:0:0:0:1', to_date('10-01-2019 09:24:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (64, 'luruihua', '0:0:0:0:0:0:0:1', to_date('10-01-2019 15:48:16', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (65, 'luruihua', '0:0:0:0:0:0:0:1', to_date('10-01-2019 15:48:38', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (66, 'luruihua', '0:0:0:0:0:0:0:1', to_date('10-01-2019 15:54:39', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (67, 'luruihua', '0:0:0:0:0:0:0:1', to_date('10-01-2019 15:55:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into TB_LOG (id, username, ip, logtime)
values (82, 'luruihua', '0:0:0:0:0:0:0:1', to_date('11-01-2019 09:01:47', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 68 records loaded
prompt Loading TB_PIC...
insert into TB_PIC (id, loc, url)
values (1, '1', 'https://luruihua.oss-cn-beijing.aliyuncs.com/img/2018-12-24/093f61c81c0d47bd8da076607531d510-timg.jpg');
insert into TB_PIC (id, loc, url)
values (3, '2', 'https://luruihua.oss-cn-beijing.aliyuncs.com/img/2018-12-17/ceb24b5297f048ee9f56b7efd236b437--4ba81dcbca89e244.jpg');
insert into TB_PIC (id, loc, url)
values (4, '3', 'https://luruihua.oss-cn-beijing.aliyuncs.com/img/2018-12-17/536e49a165eb4a25b6d0f6c453b60be7--673fcd3356567411.jpg');
commit;
prompt 3 records loaded
prompt Loading TB_POWER...
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (25, '标信息查询', '1', 'el-icon-menu', null, 0);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (26, '满标信息', '1', 'el-icon-menu', '/his/selectFullBid', 25);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (27, '流标信息', '1', 'el-icon-menu', '/his/selectLiuBid', 25);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (28, '还款详情', '1', 'el-icon-menu', null, 0);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (29, '还款计划', '1', 'el-icon-menu', '/his/repay', 28);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (2, '网站管理', '1', 'el-icon-loading', null, 0);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (4, '系统管理', '1', 'el-icon-menu', null, 0);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (5, '系统统计', '1', 'el-icon-menu', null, 0);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (6, '审核管理', '1', 'el-icon-menu', null, 0);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (7, '意见管理', '1', 'el-icon-menu', 'https://www.so.com', 3);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (8, '菜单管理', '1', 'el-icon-menu', '/tree/goTreeList', 4);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (9, '广告管理', '1', 'el-icon-menu', '/pic/toPic', 2);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (10, '实名认证', '1', 'el-icon-menu', '/backCheck/toRealCheck', 6);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (11, '员工管理', '1', 'el-icon-menu', '/emp/toList', 4);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (12, '角色管理', '1', 'el-icon-menu', '/role/toRole', 4);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (13, '视频认证', '1', 'el-icon-menu', '/backCheck/toVideoCheck', 6);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (14, '部门管理', '1', 'el-icon-menu', '/dept/toDept', 4);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (15, '招标审核', '1', 'el-icon-menu', '/bid/toCheckBid', 6);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (16, '消息管理', '1', 'el-icon-menu', 'https://www.so.com', 3);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (17, '用户省份分布', '1', 'el-icon-menu', '/backCheck/toUserProfit', 5);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (18, '满标一审', '1', 'el-icon-menu', '/one/toOne', 6);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (19, '满标二审', '1', 'el-icon-menu', '/two/toTwo', 6);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (20, '重置密码', '1', 'el-icon-menu', '/emp/updatePassWord', 4);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (21, '历史审核记录', '1', 'el-icon-menu', '/his/toHis', 6);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (24, '月或者日盈利统计', '1', 'el-icon-menu', '/backCheck/toMonProfit', 5);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (61, '后台查询', '1', 'el-icon-menu', null, 0);
insert into TB_POWER (id, name, state, iconcls, url, parentid)
values (62, '后台登陆查询', '1', 'el-icon-menu', '/loginFor/select', 61);
commit;
prompt 27 records loaded
prompt Loading TB_ROLE...
insert into TB_ROLE (id, role)
values (1, '老板');
insert into TB_ROLE (id, role)
values (2, '实名认证');
insert into TB_ROLE (id, role)
values (3, '视频认证');
insert into TB_ROLE (id, role)
values (4, '招标初审');
insert into TB_ROLE (id, role)
values (5, '满标一审');
insert into TB_ROLE (id, role)
values (6, '满标二审');
insert into TB_ROLE (id, role)
values (61, '系统管理');
commit;
prompt 7 records loaded
prompt Loading TB_ROLE_POWER...
insert into TB_ROLE_POWER (id, roleid, powerid)
values (283, 61, 11);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (284, 61, 12);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (285, 61, 14);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (281, 61, 4);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (282, 61, 8);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (286, 61, 20);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (301, 2, 25);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (302, 2, 26);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (303, 2, 27);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (304, 2, 28);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (305, 2, 29);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (306, 2, 2);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (307, 2, 9);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (308, 2, 20);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (309, 2, 4);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (310, 2, 5);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (311, 2, 17);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (312, 2, 24);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (313, 2, 6);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (314, 2, 10);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (315, 2, 13);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (316, 2, 15);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (317, 2, 18);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (318, 2, 19);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (319, 2, 21);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (173, 4, 2);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (174, 4, 9);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (175, 4, 20);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (176, 4, 4);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (177, 4, 5);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (178, 4, 17);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (179, 4, 22);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (180, 4, 23);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (181, 4, 24);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (182, 4, 15);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (183, 4, 6);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (184, 4, 18);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (185, 4, 19);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (186, 4, 21);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (243, 1, 27);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (244, 1, 28);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (245, 1, 29);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (246, 1, 2);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (247, 1, 9);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (248, 1, 4);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (249, 1, 8);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (250, 1, 11);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (251, 1, 12);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (252, 1, 14);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (253, 1, 20);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (254, 1, 5);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (255, 1, 17);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (256, 1, 22);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (257, 1, 23);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (258, 1, 24);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (259, 1, 6);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (260, 1, 10);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (261, 1, 13);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (262, 1, 15);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (263, 1, 18);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (241, 1, 25);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (242, 1, 26);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (264, 1, 19);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (265, 1, 21);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (266, 1, 61);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (267, 1, 62);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (122, 3, 1);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (123, 3, 2);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (124, 3, 9);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (125, 3, 20);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (126, 3, 4);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (127, 3, 5);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (128, 3, 17);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (129, 3, 22);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (130, 3, 23);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (131, 3, 24);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (132, 3, 13);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (133, 3, 6);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (134, 3, 21);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (135, 5, 1);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (136, 5, 2);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (137, 5, 9);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (138, 5, 20);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (139, 5, 4);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (140, 5, 5);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (141, 5, 17);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (142, 5, 22);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (143, 5, 23);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (144, 5, 24);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (145, 5, 18);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (146, 5, 6);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (147, 5, 21);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (148, 6, 1);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (149, 6, 2);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (150, 6, 9);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (151, 6, 20);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (152, 6, 4);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (153, 6, 5);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (154, 6, 17);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (155, 6, 22);
commit;
prompt 100 records committed...
insert into TB_ROLE_POWER (id, roleid, powerid)
values (156, 6, 23);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (157, 6, 24);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (158, 6, 19);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (159, 6, 6);
insert into TB_ROLE_POWER (id, roleid, powerid)
values (160, 6, 21);
commit;
prompt 105 records loaded
prompt Loading TB_SYSTEM_ACCOUNT_FLOW...
prompt Table is empty
prompt Loading TB_USER...
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7369, 'SMITH', '洗马桶', to_date('12-12-1990', 'dd-mm-yyyy'), 800, 1000, 20);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7499, 'ALLEN', 'SALESMAN', to_date('20-02-1981', 'dd-mm-yyyy'), 1600, 300, 30);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7521, 'WARD', 'SALESMAN', to_date('22-02-1981', 'dd-mm-yyyy'), 1250, 500, 30);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7566, 'JONES', 'MANAGER', to_date('02-04-1981', 'dd-mm-yyyy'), 2975, 0, 20);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7654, 'MARTIN', 'SALESMAN', to_date('28-09-1981', 'dd-mm-yyyy'), 1250, 1400, 30);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7698, 'BLAKE', 'MANAGER', to_date('01-05-1981', 'dd-mm-yyyy'), 2850, 0, 30);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7782, 'CLARK', 'MANAGER', to_date('09-06-1981', 'dd-mm-yyyy'), 2450, 0, 10);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7788, 'SCOTT', 'ANALYST', to_date('19-04-1987', 'dd-mm-yyyy'), 3000, 0, 20);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7839, 'KING', 'PRESIDENT', to_date('17-11-1981', 'dd-mm-yyyy'), 5000, 0, 10);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7844, 'TURNER', 'SALESMAN', to_date('08-09-1981', 'dd-mm-yyyy'), 1500, 0, 30);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7876, 'ADAMS', 'CLERK', to_date('23-05-1987', 'dd-mm-yyyy'), 1100, 0, 20);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7900, 'JAMES', 'CLERK', to_date('03-12-1981', 'dd-mm-yyyy'), 950, 0, 30);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7902, 'FORD', 'ANALYST', to_date('03-12-1981', 'dd-mm-yyyy'), 3000, 0, 20);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (7934, 'MILLER', 'CLERK', to_date('23-01-1982', 'dd-mm-yyyy'), 1300, 0, 10);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (21, 'luruihua', 'lur', to_date('08-12-2018', 'dd-mm-yyyy'), 1, null, null);
insert into TB_USER (empno, ename, job, hiredate, sal, comm, deptno)
values (6, '芦瑞华', '11', to_date('04-07-2012', 'dd-mm-yyyy'), 2, null, null);
commit;
prompt 16 records loaded
prompt Loading TB_USERREAL...
insert into TB_USERREAL (id, userid, realname, sex, address, idnumber, academic, housed, marriage, income, idimagefountvar, idimagebackvar, applytime, auditorid, audittime, auditresult, auditremarks)
values (89, 89, '马二', '男', '湖北省咸宁市咸安区河南', '411282199605316512', '本科', '高档别墅', '未婚', '1500以内', 'cd9675a3-38ec-4af9-b932-5baba9f3342f.jpg', '2f088863-fa6e-4e58-b779-906cafdd3b2f.png', null, null, to_date('12-01-2019 09:18:25', 'dd-mm-yyyy hh24:mi:ss'), '审核通过', null);
insert into TB_USERREAL (id, userid, realname, sex, address, idnumber, academic, housed, marriage, income, idimagefountvar, idimagebackvar, applytime, auditorid, audittime, auditresult, auditremarks)
values (90, 90, '马三', '男', '湖南省永州市芝山区河南', '411282199605316511', '本科', '高档别墅', '未婚', '1500以内', 'f2990dc4-4902-4d22-9d93-69640a00baed.jpg', '9fd38a89-4bf9-4814-9775-9d3967ff76d4.png', null, null, to_date('12-01-2019 09:22:09', 'dd-mm-yyyy hh24:mi:ss'), '审核通过', null);
insert into TB_USERREAL (id, userid, realname, sex, address, idnumber, academic, housed, marriage, income, idimagefountvar, idimagebackvar, applytime, auditorid, audittime, auditresult, auditremarks)
values (91, 91, '马一', '男', '河南省信阳市淮滨县', '411282199605316512', '本科', '高档别墅', '未婚', '1500以内', '5f6afd68-a83f-4513-a47b-fc97aa1da242.jpg', 'e9b8045d-a256-4393-8aef-0765c8765caa.png', null, null, to_date('12-01-2019 11:21:17', 'dd-mm-yyyy hh24:mi:ss'), '审核通过', 'keyi');
commit;
prompt 3 records loaded
prompt Loading TB_USER_ACCOUNT_FLOW...
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (363, 91, 72, 3467.547, 53064.906, to_date('12-01-2019 11:28:33', 'dd-mm-yyyy hh24:mi:ss'), '还款');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (364, 89, 70, 1387.019, 48774.038, to_date('12-01-2019 11:28:33', 'dd-mm-yyyy hh24:mi:ss'), '收款');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (365, 90, 71, 2080.528, 48161.056, to_date('12-01-2019 11:28:33', 'dd-mm-yyyy hh24:mi:ss'), '收款');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (352, 90, 71, 50000, 50000, to_date('12-01-2019 09:22:54', 'dd-mm-yyyy hh24:mi:ss'), '充值');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (353, 89, 70, 50000, 50000, to_date('12-01-2019 09:23:23', 'dd-mm-yyyy hh24:mi:ss'), '充值');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (356, 90, 71, 6000, 44000, to_date('12-01-2019 11:25:11', 'dd-mm-yyyy hh24:mi:ss'), '冻结');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (357, 89, 70, 4000, 46000, to_date('12-01-2019 11:25:47', 'dd-mm-yyyy hh24:mi:ss'), '投标扣款');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (354, 91, 72, 50000, 50000, to_date('12-01-2019 11:22:06', 'dd-mm-yyyy hh24:mi:ss'), '充值');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (355, 89, 70, 4000, 46000, to_date('12-01-2019 11:24:34', 'dd-mm-yyyy hh24:mi:ss'), '冻结');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (358, 90, 71, 6000, 44000, to_date('12-01-2019 11:25:47', 'dd-mm-yyyy hh24:mi:ss'), '投标扣款');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (359, 91, 72, 10000, 60000, to_date('12-01-2019 11:25:47', 'dd-mm-yyyy hh24:mi:ss'), '账户拨款');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (360, 91, 72, 3467.547, 56532.453, to_date('12-01-2019 11:26:52', 'dd-mm-yyyy hh24:mi:ss'), '还款');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (361, 89, 70, 1387.019, 47387.019, to_date('12-01-2019 11:26:52', 'dd-mm-yyyy hh24:mi:ss'), '收款');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (362, 90, 71, 2080.528, 46080.528, to_date('12-01-2019 11:26:52', 'dd-mm-yyyy hh24:mi:ss'), '收款');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (366, 91, 72, 3467.547, 49597.359, to_date('12-01-2019 11:28:56', 'dd-mm-yyyy hh24:mi:ss'), '还款');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (367, 89, 70, 1387.019, 50161.057, to_date('12-01-2019 11:28:56', 'dd-mm-yyyy hh24:mi:ss'), '收款');
insert into TB_USER_ACCOUNT_FLOW (id, userid, accountid, amount, availablebalance, flowdate, flowtype)
values (368, 90, 71, 2080.528, 50241.584, to_date('12-01-2019 11:28:56', 'dd-mm-yyyy hh24:mi:ss'), '收款');
commit;
prompt 17 records loaded
prompt Loading TB_VIDEO_AUDIT...
insert into TB_VIDEO_AUDIT (id, userid, appointmenttime, applytime, auditorid, audittime, auditresult, auditremarks, appointmentmanid, appointtime)
values (88, 89, '2019-01-09 8:00-10:00', null, null, to_date('12-01-2019 09:18:48', 'dd-mm-yyyy hh24:mi:ss'), '审核通过', null, null, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into TB_VIDEO_AUDIT (id, userid, appointmenttime, applytime, auditorid, audittime, auditresult, auditremarks, appointmentmanid, appointtime)
values (90, 91, '2019-01-12 8:00-10:00', null, null, to_date('12-01-2019 11:21:48', 'dd-mm-yyyy hh24:mi:ss'), '审核通过', 'o ', null, to_date('18-01-2019', 'dd-mm-yyyy'));
insert into TB_VIDEO_AUDIT (id, userid, appointmenttime, applytime, auditorid, audittime, auditresult, auditremarks, appointmentmanid, appointtime)
values (89, 90, '2019-01-02 8:00-10:00', null, null, to_date('12-01-2019 09:22:33', 'dd-mm-yyyy hh24:mi:ss'), '审核通过', null, null, to_date('01-01-2019', 'dd-mm-yyyy'));
commit;
prompt 3 records loaded
prompt Enabling triggers for AREA...
alter table AREA enable all triggers;
prompt Enabling triggers for CITY...
alter table CITY enable all triggers;
prompt Enabling triggers for PROVINCE...
alter table PROVINCE enable all triggers;
prompt Enabling triggers for TB_ACCOUNT...
alter table TB_ACCOUNT enable all triggers;
prompt Enabling triggers for TB_ADVERT...
alter table TB_ADVERT enable all triggers;
prompt Enabling triggers for TB_BIDCHECK...
alter table TB_BIDCHECK enable all triggers;
prompt Enabling triggers for TB_BIDINFO...
alter table TB_BIDINFO enable all triggers;
prompt Enabling triggers for TB_BID_AUDIT...
alter table TB_BID_AUDIT enable all triggers;
prompt Enabling triggers for TB_BID_REPAY_INFO...
alter table TB_BID_REPAY_INFO enable all triggers;
prompt Enabling triggers for TB_BID_SUBMIT...
alter table TB_BID_SUBMIT enable all triggers;
prompt Enabling triggers for TB_DEPT...
alter table TB_DEPT enable all triggers;
prompt Enabling triggers for TB_EMP...
alter table TB_EMP enable all triggers;
prompt Enabling triggers for TB_FWDINFO...
alter table TB_FWDINFO enable all triggers;
prompt Enabling triggers for TB_FWDLOGIN...
alter table TB_FWDLOGIN enable all triggers;
prompt Enabling triggers for TB_LOG...
alter table TB_LOG enable all triggers;
prompt Enabling triggers for TB_PIC...
alter table TB_PIC enable all triggers;
prompt Enabling triggers for TB_POWER...
alter table TB_POWER enable all triggers;
prompt Enabling triggers for TB_ROLE...
alter table TB_ROLE enable all triggers;
prompt Enabling triggers for TB_ROLE_POWER...
alter table TB_ROLE_POWER enable all triggers;
prompt Enabling triggers for TB_SYSTEM_ACCOUNT_FLOW...
alter table TB_SYSTEM_ACCOUNT_FLOW enable all triggers;
prompt Enabling triggers for TB_USER...
alter table TB_USER enable all triggers;
prompt Enabling triggers for TB_USERREAL...
alter table TB_USERREAL enable all triggers;
prompt Enabling triggers for TB_USER_ACCOUNT_FLOW...
alter table TB_USER_ACCOUNT_FLOW enable all triggers;
prompt Enabling triggers for TB_VIDEO_AUDIT...
alter table TB_VIDEO_AUDIT enable all triggers;
set feedback on
set define on
prompt Done.
