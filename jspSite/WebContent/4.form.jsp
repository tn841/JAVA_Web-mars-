<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ�� ����</title>

<link rel="stylesheet" type="text/css" href="css/co.css">
<link rel="stylesheet" type="text/css" href="css/member.css">
<!-- 
<link rel="stylesheet" type="text/css" href="http://s.pm.naver.net/css/main_v20150325.css">
 -->
<style type="text/css">
	/*
	tag selector
	*/
	/*
	body{
		background-color: aqua;
	}
	form {
		color: purple;
	}
	*/
	/*
	class selector
	*/
	/*
	.TXTFLD{
		border-width: 1px;
		border-color: blue;
		border-style: solid;
		color: blue;
	}
	.TXTFLD1{
		border-width: 1px;
		border-color: red;
		border-style: dotted;
		color: red;
	}
	*/
	/*
	id selector
	*/
	/*
	#jointbl{
		background-color: orange;
		border: 2px solid red; 
	}
	*/
</style>
<script type="text/javascript" src="js/co.js"></script>
<script type="text/javascript" src="js/member.js"></script>
</head>
<body>
	<h3 align="center">�ߡߡ� ȸ������ �ߡߡ�</h3>
	<form name="join" method="post" action="join.do" onsubmit="return checkForm(document.join);">
		<table id="jointbl" bgcolor="black" cellspacing="1" cellpadding="5" align="center">
			<tr id="first-tr">
				<th bgcolor="44ff44"><font size="2">���̵�</font></th>
				<td bgcolor="white" width="300"><input type="text" size="10"
					name="id" class="TXTFLD"></td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">��й�ȣ</font></th>
				<td bgcolor="white" width="300"><input type="password"
					size="10" name="pass" class="TXTFLD1"></td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">��й�ȣȮ��</font></th>
				<td bgcolor="white" width="300"><input type="password"
					size="10" name="repass" class="TXTFLD"></td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">�̸�</font></th>
				<td bgcolor="white" width="300"><input type="text" size="10"
					name="name" class="TXTFLD"></td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">�ּ�</font></th>
				<td bgcolor="white" width="300"><input type="text" size="30"
					name="addr" class="TXTFLD"></td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">����</font></th>
				<td bgcolor="white" width="300"><input type="radio"
					name="gender" value="����"><font size="2">����</font> <input
					type="radio" name="gender" value="����" checked="checked"><font
					size="2">����</font></td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">����</font></th>
				<td bgcolor="white" width="300">
					<select name="job" size="1">
						<option value="�����������ϼ���"><font size="2">�����������ϼ���</font></option>
						<option value="�л�"><font size="2">�л�</font></option>
						<option value="�ֺ�"><font size="2">�ֺ�</font></option>
						<option value="ȸ���"><font size="2">ȸ���</font></option>
						<option value="��Ÿ"><font size="2">��Ÿ</font></option>
					</select>
				</td>
			</tr>
			<tr>
				<th bgcolor="44ff44"><font size="2">���</font></th>
				<td bgcolor="white" width="300"><input type="checkbox"
					name="hobby" value="��ǻ��" checked><font size="2">��ǻ��</font>
					<input type="checkbox" name="hobby" value="����"><font
					size="2">����</font> <input type="checkbox" name="hobby" value="����"><font
					size="2">����</font> <input type="checkbox" name="hobby" value="�"><font
					size="2">�</font> <input type="checkbox" name="hobby" value="��Ÿ"><font
					size="2">��Ÿ</font></td>
			</tr>
			<th colspan="2" bgcolor="ff8888"><input type="submit" value="����">
				<input type="reset" value="���"></th>
			</tr>
		</table>
	</form>
</body>
</html>
