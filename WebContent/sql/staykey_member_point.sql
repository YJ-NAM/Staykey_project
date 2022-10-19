-- 회원 적립금 내역 테이블
drop table staykey_member_point purge;

create table staykey_member_point(
    point_no number(5) primary key,
    point_id varchar2(30) not null,
    point_type varchar2(10) default 'plus',
    point_value number(10) default 0,
    point_content varchar2(100),
    point_date date default sysdate
);

comment on column staykey_member_point.point_no is '적립금 번호';
comment on column staykey_member_point.point_id is '적립 아이디';
comment on column staykey_member_point.point_type is '유형 (plus/minus)';
comment on column staykey_member_point.point_value is '적립 금액';
comment on column staykey_member_point.point_content is '적립 내용';
comment on column staykey_member_point.point_date is '적립일자';

insert into staykey_member_point values(1, 'test', 'plus', 500, '회원가입', sysdate);
insert into staykey_member_point values(2, 'test2', 'plus', 1000, '이벤트 지급', sysdate);
insert into staykey_member_point values(3, 'test2', 'minus', 500, '숙소 예약시 사용', sysdate);

commit;