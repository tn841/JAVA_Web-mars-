

drop table GUEST;

create table GUEST(
    guest_no number(10) not null primary key,
		guest_name varchar2(40) not null,
		guest_date date not null,
		guest_email varchar2(50),
		guest_homepage varchar2(50),
		guest_title varchar2(100) not null,
		guest_content varchar2(4000) not null
    );
drop sequence guest_no_seq;

--1부터 1씩 증가한다.
create sequence guest_no_seq  increment by 1 start with 1;

insert into GUEST values(guest_no_seq.nextval , '김경호1', sysdate, 'guard1@naver.com', 'http://', '방명록 사용법1', '방명록처럼 사용하시면 됩니다1');
insert into GUEST values(guest_no_seq.nextval , '김경호2', sysdate, 'guard2@naver.com', 'http://', '방명록 사용법2', '방명록처럼 사용하시면 됩니다2');
insert into GUEST values(guest_no_seq.nextval , '김경호3', sysdate, 'guard3@naver.com', 'http://', '방명록 사용법3', '방명록처럼 사용하시면 됩니다3');
insert into GUEST values(guest_no_seq.nextval , '김경호4', sysdate, 'guard4@naver.com', 'http://', '방명록 사용법4', '방명록처럼 사용하시면 됩니다4');
insert into GUEST values(guest_no_seq.nextval , '김경호5', sysdate, 'guard5@naver.com', 'http://', '방명록 사용법5', '방명록처럼 사용하시면 됩니다5');



commit;

select * from GUEST;
desc guest;