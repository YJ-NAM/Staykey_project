-- 이벤트(게시판) 테이블

drop table staykey_event purge;

create table staykey_event(
    bbs_no number(5) primary key,
    type_rank number(2) default 0,
    type_name varchar2(50) not null
);
comment on column staykey_event.bbs_no is '게시물 번호';


insert into staykey_event values(1, 0, '게스트하우스');

commit;

