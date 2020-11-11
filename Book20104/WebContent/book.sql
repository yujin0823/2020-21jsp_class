drop table book_tbl;

create table book_tbl(
	bcode number(5) primary key, -- 도서코드
	btitle varchar2(30), -- 책이름
	bwriter varchar2(30), -- 저자
	bpub number(4), -- 출판사 코드
	bprice number(10) not null, -- 가격
	bdate date -- 출간 날짜
);

select * from book_tbl;
select * from book_tbl order by bcode asc;

insert into book_tbl values(10100, '자바킹', '강길동', 1001, 12000, TO_DATE('2020-11-02', 'YYYY-MM-DD'));
insert into book_tbl values(10101, '알고리듬', '남길동', 1002, 18000, TO_DATE('2020-05-05', 'YYYY-MM-DD'));
insert into book_tbl values(10102, '스프링두', '서길동', 1003, 23000, TO_DATE('2019-08-03', 'YYYY-MM-DD'));
insert into book_tbl values(10103, '파이썬', '홍길동', 1004, 9000, TO_DATE('2019-10-11', 'YYYY-MM-DD'));

select max(bcode) from BOOK_TBL;

delete from BOOK_TBL where bcode = 10108;

update book_tbl set btitle = '파이썬의 정석', bwriter = '홍귤동', bpub = 1001, 
			bprice = 14900, bdate = TO_DATE('2019-10-11', 'YYYY-MM-DD') where bcode = 10103;