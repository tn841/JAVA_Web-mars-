
 
 
CREATE SEQUENCE board_sequence;
--���۾���
INSERT INTO board(b_no, b_title, b_writer, b_content,b_groupno, b_step) VALUES(board_sequence.nextval,'�Խ���Ÿ��Ʋ1','��','content1',board_sequence.currval,1);
INSERT INTO board(b_no, b_title, b_writer, b_content,b_groupno, b_step) VALUES(board_sequence.nextval,'�Խ���Ÿ��Ʋ2','��','content2',board_sequence.currval,1);
INSERT INTO board(b_no, b_title, b_writer, b_content,b_groupno, b_step) VALUES(board_sequence.nextval,'�Խ���Ÿ��Ʋ3','��','content3',board_sequence.currval,1);
INSERT INTO board(b_no, b_title, b_writer, b_content,b_groupno, b_step) VALUES(board_sequence.nextval,'�Խ���Ÿ��Ʋ4','��','content4',board_sequence.currval,1);
INSERT INTO board(b_no, b_title, b_writer, b_content,b_groupno, b_step) VALUES(board_sequence.nextval,'�Խ���Ÿ��Ʋ5','��','content5',board_sequence.currval,1);
INSERT INTO board(b_no, b_title, b_writer, b_content,b_groupno, b_step) VALUES(board_sequence.nextval,'�Խ���Ÿ��Ʋ6','��','content6',board_sequence.currval,1);

COMMIT

SELECT * FROM BOARD;
