// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require bootstrap
//= require jquery-fileupload 

var sendSMSUrl = "http://api.sms7.com.cn/mt/?uid=ruby&pwd=f2bd8f3d021082f7bc13b1d566c00f67&encode=utf8";
var validating_phone_number = "";

$(function(){
		$("#sendSMS").click(function(){
			
			//if($("#user_old_phone").length>0 && ($("#user_old_phone").val() == $("#user_phone").val()))
			//{alert("新手机号码与当前手机号码完全相同，无需办理更改"); return;}		

			var mobile = $("#user_phone").val();

			if(mobile == null || mobile =="")
			{alert("手机号码不能为空");return;}
			if(!/^\d{11}$/.test(mobile))
			{alert("请输入正确的手机号码");return;}

			var content = getAuthCode();
			alert(content);
			var url = sendSMSUrl + "&mobile=" + mobile + "&content=验证码:" + content + "【宁优网】";
			$("#auth_hiddenAuthCode").val(CryptoJS.MD5(content.toString()));
			//$.post(url, function(){alert(11);});
			//jQuery.getScript(url,function(){alert("短信已发送，请查收!")});
			disableSMSBtnAndCountDown();
			});

		$("#shipping_addr_child").click(function(){
			//alert($("#shipping_addr_child + label").html());
			$(".ship_addr").val($("#shipping_addr_child + label").html());
			});
		$('#redirect_anchor').click(function(){
			clearInterval(rd2RootItvl);
	                location.href="/";
		});
		
		$('.close-btn').click(function(){
                        $(this).parent().hide();
                });
		
		
		$(".modal-body").on('mouseover mouseout click','.carousel-control3', function(event){
			 if (event.type == 'mouseover') {
  				$('.caption').fadeIn(200);
 			 } else if (event.type == 'mouseout') {
  				$('.caption').fadeOut(500);
			 } else if (event.type == 'click') {
				var next_image_anchor_clicked = $(this).hasClass("right");
				var indicator ="";
				
				if ( next_image_anchor_clicked )
					{ next_item = $(".item-detector").find(".active").next(); indicator = "first-child"; }
				else
					{ next_item = $(".item-detector").find(".active").prev(); indicator = "last-child"; }

				var next_image_id;
				
				if ($(next_item).length == 0)
					next_image_id = $(".item-detector div:" + indicator).find(".image_id").val();
				else
					next_image_id = $(next_item).find(".image_id").val();
				
				$("#hidden_switch").attr("href","comments/" + next_image_id );
				$("#hidden_switch").click();
			 }
		});
		//$(".pics").hover(
		//	function(){$(this).find(".caption").fadeOut(500)},
		//	function(){$(this).find(".caption").fadeIn(200)});
		
		$("#comment_submit").click(function(){
			$("#comment_image_id").val($(".carousel-inner").find(".active").find(".image_id").val());
		});
		
		$(".carousel-control3").on('click',function(){
			alert(123);
			alert($("#hidden_switch").attr("href"));
		});
		
		$("#message-anchor").tooltip();

		$("#subpage-pane").on("click", ".non-mutiple", function(event){
			$("#modal_body").find('i').removeAttr("class");
			$(this).parent().find('i').addClass("icon-ok icon-white selected");
		});
	
		$("#subpage-pane").on("click", ".mutiple", function(event){
                        $(this).parent().find('i').toggleClass("icon-ok icon-white selected");
                });

		$("#subpage-pane").on("click", "#btn111_confirm", function(event){
			var imgsrc = $("i.selected+a>img").attr("src");
			var image_id = $("i.selected").data("image-id");
			//alert(imgsrc);
			$("#cover_image").html("<img src='" + imgsrc + "' width='100'>");
			$("#cover_image").parent().find("input").val(image_id);
			$("#select_img_modal").modal('hide');
		});
		
		$("#subpage-pane").on("click", "#ig_form_rtn", function(event){
                	$("#ig-pills>.active>a").click();
		});

		$("#user_phone").change(function(){
			
		});
});

function disableSMSBtnAndCountDown()
{
	validating_phone_number = $("#user_phone").val();
	$("#user_phone").attr("readonly", "true");
	$("#user_phone").bind('change', validatingPhoneMonitor);
	$("#sendSMS").attr("disabled","true");
	cdItvID = setInterval("countDown()", 1000);
}

function validatingPhoneMonitor()
{
	alert("已向当前号码发送验证码，不能更改，如果你需要以其他手机注册，请重新打开注册菜单进行注册!");
	$("#user_phone").val(validating_phone_number);
}

var cd =  60;
var cd4rd = 0;
var cdItvID = null;
var rd2RootItvl = null;
function countDown()
{
	if(cd >=0)
	{
		$("#sendSMS").html("发送验证短信(" + cd + ")");
		cd--;
	}
	else
	{
		$("#sendSMS").removeAttr("disabled");
		$("#sendSMS").html("发送验证短信");
		cd = 60;
		clearInterval(cdItvID);
	}
}

//return a auth code from 100000 to 999999
function getAuthCode()
{
	return parseInt(Math.random() * (999999 - 100000 + 1) + 100000);
}

//redirect to root in seconds
function redirect2root()
{
	rd2RootItvl = setInterval('countDown4redirect(5)', 100);
}

function countDown4redirect()
{
        if(cd4rd<=5900)
	{	
		countDownSec = cd4rd/1000;
		if(parseInt(countDownSec)==countDownSec)
	                $('#countDown').html(5-countDownSec);
		$('#redirect-bar').css('width',countDownSec/5 * 100 + '%');
                cd4rd += 100;
        }
        else
        {
                clearInterval(rd2RootItvl);
		location.href="/";
		cd4rd=0;
        }
}

function confirm4coverSel(){
	alert("cover");
}

function confirm4contentImageSel(){
	alert("content");
}
