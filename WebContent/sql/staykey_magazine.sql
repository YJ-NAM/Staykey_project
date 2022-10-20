-- 매거진(게시판) 테이블
drop table staykey_magazine purge;

create table staykey_magazine(
    bbs_no number(5) primary key,
    bbs_title varchar2(100) not null,
    bbs_content varchar2(2000) not null,
    bbs_file1 varchar2(200),
    bbs_file2 varchar2(200),
    bbs_file3 varchar2(200),
    bbs_file4 varchar2(200),
    bbs_file5 varchar2(200),
    bbs_stayno varchar2(100),
    bbs_hit number(5) default 0 not null,
    bbs_writer_name varchar2(50) not null,
    bbs_writer_id varchar2(30) not null,
    bbs_writer_pw varchar2(50) not null,
    bbs_date date default sysdate not null
);

comment on column staykey_magazine.bbs_no is '번호';
comment on column staykey_magazine.bbs_title is '제목';
comment on column staykey_magazine.bbs_content is '내용';
comment on column staykey_magazine.bbs_file1 is '첨부파일1';
comment on column staykey_magazine.bbs_file2 is '첨부파일2';
comment on column staykey_magazine.bbs_file3 is '첨부파일3';
comment on column staykey_magazine.bbs_file4 is '첨부파일4';
comment on column staykey_magazine.bbs_file5 is '첨부파일5';
comment on column staykey_magazine.bbs_stayno is '숙소 번호';
comment on column staykey_magazine.bbs_hit is '조회수';
comment on column staykey_magazine.bbs_writer_name is '작성자';
comment on column staykey_magazine.bbs_writer_id is '아이디';
comment on column staykey_magazine.bbs_writer_pw is '비밀번호';
comment on column staykey_magazine.bbs_date is '작성일자';

insert into staykey_magazine values(1, '매거진 제목1', '매거진 내용1
줄바꿈', null, null, null, null, null, '/1/2/3/', 0, '관리자1', 'test', '1234', sysdate);
insert into staykey_magazine values(2, '매거진 제목2', '매거진 내용2
줄바꿈', null, null, null, null, null, '/2/', 0, '관리자1', 'test2', '1234', sysdate);
insert into staykey_magazine values(3, '매거진 제목3', '매거진 내용3
줄바꿈', null, null, null, null, null, '/1/3/', 0, '관리자1', 'test', '1234', sysdate);

commit;