﻿var entries = [
{
	"guest_no":"1",
	"guest_name":"김경호1",
	"guest_date":"2012-11-16 11:43:46",
	"guest_email":"guard@naver.com",
	"guest_title":"방명록 사용법1",
	"guest_content":"방명록처럼 사용하시면 됩니다1"
	}
	,
	{
	"guest_no":"2",
	"guest_name":"김경호2",
	"guest_date":"2012-11-16 11:43:46",
	"guest_email":"guard@naver.com",
	"guest_title":"방명록 사용법2",
	"guest_content":"방명록처럼 사용하시면 됩니다2"
	}
	,
	{
	"guest_no":"3",
	"guest_name":"김경호3",
	"guest_date":"2012-11-16 11:43:46",
	"guest_email":"guard@naver.com",
	"guest_title":"방명록 사용법3",
	"guest_content":"방명록처럼 사용하시면 됩니다3"
	}
	,
	{
	"guest_no":"4",
	"guest_name":"김경호4",
	"guest_date":"2012-11-16 11:43:46",
	"guest_email":"guard@naver.com",
	"guest_title":"방명록 사용법4",
	"guest_content":"방명록처럼 사용하시면 됩니다4"
	}
	,
	{
	"guest_no":"5",
	"guest_name":"김경호5",
	"guest_date":"2012-11-16 11:43:46",
	"guest_email":"guard@naver.com",
	"guest_title":"방명록 사용법5",
	"guest_content":"방명록처럼 사용하시면 됩니다5"
	}
	];

var html = '';
$.each(entries, function() {
  html += '<div class="guest_item">';
  html += '<h3 class="guest_title">'+this['guest_title']+'</h3>';
  html +='<div class="guest_date">'+this['guest_name']+'['+this['guest_date']+']</div>';
  html += '<div class="guest_content">'+this['guest_content']+'</div>';
  html += '</div>';
});
$('#guest_list').html(html);




