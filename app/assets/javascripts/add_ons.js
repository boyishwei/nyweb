$('#registerModal').on('hidden', function () {
	$(".control-group").removeClass("error");
	$("#user_phone").removeAttr("readonly");
	$("#user_phone").unbind("change");
	$("#error_explanation").html();
	$("#error_explanation").hide();
	$("#user_username").val('');
	$("#user_password").val('');
	$("#user_password_confirmation").val('');
	$("#user_email").val('');
	$("#user_phone").val('');
	$("#auth_authCode").val('');
	$("#auth_hiddenAuthCode").val('');
});


$('#loginModal').on('hidden', function () {
	$("#login_user_name").val('');
	$("#login_user_password").val('');
	$('#login_error_explanation').html();
	$('#login_error_explanation').hide();	
});
