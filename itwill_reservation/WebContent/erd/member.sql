
drop table member;
create table member(m_no NUMBER(10) primary key, m_id VARCHAR2(20), m_password VARCHAR2(20), m_name VARCHAR2(20), m_phone VARCHAR2(20), m_email VARCHAR2(30),  m_birth DATE, m_address varchar2(100), m_class VARCHAR2(10), m_point NUMBER(20));
--insert
insert into member(m_no, m_id, m_password, m_name, m_email, m_phone, m_birth, m_address, m_class, m_point) values(1, 'waesgaws', '34122', '¶Ë°³', '¶Ë°³@korea.com', '155-4155', sysdate, '°æ±âµµ¹Î', '1¹Ý', 100);
insert into member(m_no, m_id, m_password, m_name, m_email, m_phone, m_birth, m_address, m_class, m_point) 
values(2, 'dfhaaa', '34612', 'ÀºÇý', 'ÀºÇý@korea.com', '55452-4784', sysdate, '°æ±âµµ¹Î', '9¹Ý', 0);
 
insert into member(m_no, m_id, m_password, m_name, m_email, m_phone, m_birth, m_address, m_class, m_point) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);

--select
select * from member where m_id = 'dfhaaa';
select * from member where m_id = ?;

--selectAll
select * from member;
commit;

--update
update member set m_password = '4457', m_name='¿Õ¹Ùº¸', m_email='qkqh@korea.com' where m_id='dfhaaa';
update member set m_phone = '010-9666-3866' where m_id = 'dfhaaa';
update member set m_point = '50' where m_id = 'dfhaaa';

update member set m_password = ?, m_name = ?, m_email = ? m_phone = ? m_address = ? m_point = ? where m_id = ?;

--delete
delete from member where m_id = 'dfhaaa';
delete from member where m_id = ?;

