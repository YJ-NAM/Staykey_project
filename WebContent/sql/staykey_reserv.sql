-- 예약 목록 테이블

drop table staykey_reserv purge;

create table staykey_reserv(
    type_no number(5) primary key,
    type_rank number(2) default 0,
    type_name varchar2(50) not null
);
comment on column staykey_reserv.type_no is '유형 번호';


insert into staykey_reserv values(1, 0, '게스트하우스');

commit;

