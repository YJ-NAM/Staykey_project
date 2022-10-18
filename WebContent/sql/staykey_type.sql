-- 숙소 유형 테이블

drop table staykey_type purge;

create table staykey_type(
    type_no number(5) primary key,
    type_rank number(2) default 0,
    type_name varchar2(50) not null
);
comment on column staykey_type.type_no is '유형 번호';
comment on column staykey_type.type_rank is '유형 표시 순서';
comment on column staykey_type.type_name is '유형 문구';


insert into staykey_type values(1, 0, '게스트하우스');
insert into staykey_type values(2, 1, '렌탈하우스');
insert into staykey_type values(3, 2, '펜션');
insert into staykey_type values(4, 3, '한옥');
insert into staykey_type values(5, 4, '캠핑아웃도어');
insert into staykey_type values(6, 5, '호스텔');
insert into staykey_type values(7, 6, '리조트');
insert into staykey_type values(8, 7, '민박');
insert into staykey_type values(9, 8, '호텔');

commit;

