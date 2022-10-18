-- 숙소 테마 테이블

drop table staykey_theme purge;

create table staykey_theme(
    theme_no number(5) primary key,
    theme_rank number(2) default 0,
    theme_name varchar2(50) not null
);
comment on column staykey_theme.theme_no is '테마 번호';
comment on column staykey_theme.theme_rank is '테마 표시 순서';
comment on column staykey_theme.theme_name is '테마 문구';


insert into staykey_theme values(1, 0, '디자인투어');
insert into staykey_theme values(2, 1, '사색');
insert into staykey_theme values(3, 2, '가족여행');
insert into staykey_theme values(4, 3, '도심속휴식');
insert into staykey_theme values(5, 4, '정적인휴식');
insert into staykey_theme values(6, 5, '풀빌라');
insert into staykey_theme values(7, 6, '수영장');
insert into staykey_theme values(8, 7, '커플여행');
insert into staykey_theme values(9, 8, '나홀로여행');
insert into staykey_theme values(10, 9, '도보여행');
insert into staykey_theme values(11, 10, '워크숍');
insert into staykey_theme values(12, 11, '문화예술');
insert into staykey_theme values(13, 12, '건축디자인');
insert into staykey_theme values(14, 13, '오션뷰');
insert into staykey_theme values(15, 14, '시티뷰');
insert into staykey_theme values(16, 15, '액티비티');
insert into staykey_theme values(17, 16, '한옥');
insert into staykey_theme values(18, 17, '요가');


commit;

