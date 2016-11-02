drop table address;
create table address (
		no number(4) primary key,
		id varchar2(6),
		name varchar2(20),
		phone varchar2(15),
		address varchar2(60)
);
drop sequence address_no_seq;
create sequence address_no_seq
start with 1;

DESC address;

--insert into address values(1,'xxx','김경호','010-123-4567','경기도민');
insert into address values(address_no_seq.nextval,'xxx'||address_no_seq.currval,'김경호','010-123-4567','경기도민');

update address set address='FRANCE' where no = 5;
update address set id='aaa',name='유영상',phone='888-8888',address='충남 태안' where no=0;

delete from address where no=3;


select no,id,name,phone,address from address;
select no,id,name,phone,address from address where no=1;


desc address;




