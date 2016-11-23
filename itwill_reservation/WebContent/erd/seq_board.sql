
 
 
CREATE SEQUENCE board_sequence;
--새글쓰기
INSERT INTO board(b_no, b_title, b_writer, b_content,b_groupno, b_step) VALUES(board_sequence.nextval,'게시판타이틀1','일','content1',board_sequence.currval,1);
INSERT INTO board(b_no, b_title, b_writer, b_content,b_groupno, b_step) VALUES(board_sequence.nextval,'게시판타이틀2','이','content2',board_sequence.currval,1);
INSERT INTO board(b_no, b_title, b_writer, b_content,b_groupno, b_step) VALUES(board_sequence.nextval,'게시판타이틀3','삼','content3',board_sequence.currval,1);
INSERT INTO board(b_no, b_title, b_writer, b_content,b_groupno, b_step) VALUES(board_sequence.nextval,'게시판타이틀4','사','content4',board_sequence.currval,1);
INSERT INTO board(b_no, b_title, b_writer, b_content,b_groupno, b_step) VALUES(board_sequence.nextval,'게시판타이틀5','오','content5',board_sequence.currval,1);
INSERT INTO board(b_no, b_title, b_writer, b_content,b_groupno, b_step) VALUES(board_sequence.nextval,'게시판타이틀6','육','content6',board_sequence.currval,1);

COMMIT

SELECT * FROM BOARD;
