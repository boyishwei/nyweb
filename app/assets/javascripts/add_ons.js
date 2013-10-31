$('#nx_focus').unslider({
          fluid: true,
          keys: true,
          dots: true  
});

$('#registerModal').on('hidden', function () {
	$("#error_explanation").html();
	$("#error_explanation").hide();
	$("#user_username").val('');
	$("#user_password").val('');
	$("#user_password_confirmation").val('');
	$("#user_email").val('');
	$("#user_phone").val('');
	$("#auth_authCode").val('');
});


$('#loginModal').on('hidden', function () {
	$("#login_user_name").val('');
	$("#login_user_password").val('');
	$('#login_error_explanation').html();
	$('#login_error_explanation').hide();	
});
