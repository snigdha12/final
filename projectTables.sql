create table userrole(username varchar2(20) primary key, 
						pwd varchar2(12), 
						rolecode varchar(10), 
						agentid varchar2(20));
 
insert into userrole values('admin', 'admin123', 'adm', null);

insert into userrole values('U1ashu', 'Ashu@98', 'usr', 'A2aksh');

insert into userrole values('A1reshma', 'Reshma@123', 'agnt', null);

insert into userrole values('admin1', 'admin1', 'adm', null);

insert into userrole values('U2Snigdha', 'S@123', 'usr', 'A2aksh');

insert into userrole values('A2aksh', 'aksh@123', 'agnt', null);

insert into userrole values('U4Teju', 'Teju123', 'usr', null);

insert into userrole values('U3smitha', 'smitha123', 'usr', null);

insert into userrole values('admin2', 'admin2', 'adm', null);

insert into userrole values('admin3', 'admin3', 'adm', null);

insert into userrole values('U5mubeena', 'mubeena@123', 'usr', null);

insert into userrole values('A3sruthi', 'sruthi@123', 'agnt', null);

insert into userrole values('admin4', 'admin4', 'adm', null);

create table policy(policyno number(10) primary key, 
			policyprem number(10), 
			accountno number(10), 
			policy_name varchar2(20));

alter table policy add constraint pn_unique UNIQUE(policy_name);

insert into policy values(1001, 30000, 12345, 'life');

insert into policy values(2001, 20000, 98675, 'medical');

insert into policy values(3001, 5000, 12345, 'vehicle');

insert into policy values(4001, 50000, 78965, 'house');

create table claim(claimno number(10) primary key, 
					claimreason varchar2(30), 
					acdlocst varchar2(40), 
					acdcity varchar2(15), 
					acdst varchar2(15), 
					acdzip number(6), 
					claimtype varchar2(30), 
					policyno number(10), 
					constraint fk_policy FOREIGN KEY(policyno) references policy(policyno));
					

insert into claim values(10000, 'accident', 'hinjewadi', 'Pune', 'Maharashtra', 411057, 'vehicle', 3001);

insert into claim values(10001, 'fracture', 'fc road', 'Pune', 'Maharashtra', 411057, 'medical', 2001);

insert into claim values(10002, 'health issue', 'hinjewadi', 'Pune', 'Maharashtra', 411057, 'life', 1001);

insert into claim values(10052, 'accident', 'hinjewadi', 'Pune', 'Maharashtra', 411057, 'house', 4001);

create table policy_user(username varchar(20), 
							policyno number(10), 
							constraint fk_userrole FOREIGN KEY(username) references userrole(username));

insert into policy_user values('U2Snigdha', 1001);

insert into policy_user values('U2Snigdha', 3001);

insert into policy_user values('U1ashu', 2001);

insert into policy_user values('U1ashu', 4001);

create table question(QID varchar2(15) primary key,questions varchar2(70),policy_name varchar2(20));

insert into question values('h1', 'Was the accident caused by natural disaster?', 'house');
 
insert into question values('h2', 'Was the house in proper condition?', 'house');
  
create table policy_details(policyno number(10), 
							qid varchar2(15), 	
							answer varchar2(30), 
							constraint fk_pn FOREIGN KEY(policyno) references policy(policyno), 
							constraint fk_question FOREIGN KEY(qid) references question(qid));
				
 create table check_status(claimno number(10) references claim(claimno), status varchar(20));
 

 