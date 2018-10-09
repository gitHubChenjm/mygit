//jQuery time
var current_fs, next_fs, previous_fs; //fieldsets
var left, opacity, scale; //fieldset properties which we will animate
var animating; //flag to prevent quick multi-click glitches
//输入account后的下一步
$(".next1").click(function(){
	var hs,tel;
	var account = $("#account").val();
	$.ajax({
		url:'repeat.action',
		type:'post',
		async : false,
        data:{'account':account},
        success:function(result){
        	var data = eval('('+ result +')')
            if (data.code == 1) {//没有该用户
              alert("输入的用户不存在");
              hs = false;
            }else{
            	hs=true;
            	tel = data.tel;
            }     	
        }
	});
	
	if(hs){
    	/**
    	 * 跳转之前做ajax寻找account
    	 */
		
		$('#tel').val(tel);
    	if(animating) return false;
    	animating = true;
    	
    	current_fs = $(this).parent();
    	next_fs = $(this).parent().next();
    	
    	//activate next step on progressbar using the index of next_fs
    	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
    	
    	//show the next fieldset
    	next_fs.show(); 
    	//hide the current fieldset with style
    	current_fs.animate({opacity: 0}, {
    		step: function(now, mx) {
    			//as the opacity of current_fs reduces to 0 - stored in "now"
    			//1. scale current_fs down to 80%
    			scale = 1 - (1 - now) * 0.2;
    			//2. bring next_fs from the right(50%)
    			left = (now * 50)+"%";
    			//3. increase opacity of next_fs to 1 as it moves in
    			opacity = 1 - now;
    			current_fs.css({'transform': 'scale('+scale+')'});
    			next_fs.css({'left': left, 'opacity': opacity});
    		}, 
    		duration: 800, 
    		complete: function(){
    			current_fs.hide();
    			animating = false;
    		}, 
    		//this comes from the custom easing plugin
    		easing: 'easeInOutBack'
    	});
	}
});

//输入验证码后的下一步
$(".next2").click(function(){
	var hs,tel;
	var code = $("#code").val();
	$.ajax({
		url:'codeCheck.action',
		type:'post',
		async : false,
        data:{
        	'code':code
        	},
        success:function(result){
        	var data = eval('('+ result +')')
            if (data.code == 1) {//验证码正确
               
              hs = true;
            }else{
            	alert("输入的验证码不正确!");
            	hs=false;
            }     	
        }
	});
	
	if(hs){
    	/**
    	 * 跳转之前做ajax寻找account
    	 */
		
    	if(animating) return false;
    	animating = true;
    	
    	current_fs = $(this).parent().parent();
    	next_fs = $(this).parent().parent().next();
    	
    	//activate next step on progressbar using the index of next_fs
    	$("#progressbar li").eq($("fieldset").index(next_fs)).addClass("active");
    	
    	//show the next fieldset
    	next_fs.show(); 
    	//hide the current fieldset with style
    	current_fs.animate({opacity: 0}, {
    		step: function(now, mx) {
    			//as the opacity of current_fs reduces to 0 - stored in "now"
    			//1. scale current_fs down to 80%
    			scale = 1 - (1 - now) * 0.2;
    			//2. bring next_fs from the right(50%)
    			left = (now * 50)+"%";
    			//3. increase opacity of next_fs to 1 as it moves in
    			opacity = 1 - now;
    			current_fs.css({'transform': 'scale('+scale+')'});
    			next_fs.css({'left': left, 'opacity': opacity});
    		}, 
    		duration: 800, 
    		complete: function(){
    			current_fs.hide();
    			animating = false;
    		}, 
    		//this comes from the custom easing plugin
    		easing: 'easeInOutBack'
    	});
	}
});

$(".previous").click(function(){
	if(animating) return false;
	animating = true;
	
	current_fs = $(this).parent();
	previous_fs = $(this).parent().prev();
	
	//de-activate current step on progressbar
	$("#progressbar li").eq($("fieldset").index(current_fs)).removeClass("active");
	
	//show the previous fieldset
	previous_fs.show(); 
	//hide the current fieldset with style
	current_fs.animate({opacity: 0}, {
		step: function(now, mx) {
			//as the opacity of current_fs reduces to 0 - stored in "now"
			//1. scale previous_fs from 80% to 100%
			scale = 0.8 + (1 - now) * 0.2;
			//2. take current_fs to the right(50%) - from 0%
			left = ((1-now) * 50)+"%";
			//3. increase opacity of previous_fs to 1 as it moves in
			opacity = 1 - now;
			current_fs.css({'left': left});
			previous_fs.css({'transform': 'scale('+scale+')', 'opacity': opacity});
		}, 
		duration: 800, 
		complete: function(){
			current_fs.hide();
			animating = false;
		}, 
		//this comes from the custom easing plugin
		easing: 'easeInOutBack'
	});
});

$(".submit").click(function(){
	var pw = $("#password").val();
	var repw = $("#repassword").val();
	if(pw != repw || pw == "" || repw == ""){
		alert("密码不相同，或者密码为空，重新输入");
	}else{
		$.ajax({
			url:'changePW.action',
			type:'post',
			data:{
				'password':pw,
				'account':$('#account').val()
			},
			success:function(data){
				var result = eval('('+ data +')');
				if(result.code == 1){
					alert('修改成功');
					$('#login').click();
				}else{
					alert("修改失败，重新修改");
				}
			}
		});
	}
})