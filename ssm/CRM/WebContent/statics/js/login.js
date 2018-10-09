
layui.config({
    base: "js/"
}).use(['form', 'layer'], function () {
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : parent.layer,
        $ = layui.jquery;
    //登录按钮事件
    form.on("submit(login)", function (data) {
        //parent.location.href = '/index.html';
    	
//         var datas = "account=" + data.field.account + "&password=" + data.field.password + "&captcha=" + data.field.captcha;
         $.ajax({
             type: "POST",
             url: "./login.action",
             data: {
            	 "account" : data.field.account,
            	 "password": data.field.password,
            	 "loc" : clickLoc
             },
             dataType: "text",
             traditional: true,//这里设置为true
             success: function (data) {
            	 
            	 var result = eval("("+data+")")
            	 
                 if (result.code == 0) {//登录成功
                     parent.location.href = 'pages/index.jsp';
                 } else {
                     layer.msg(result.msg, {icon: 5});
                     //refreshCode($("#image"));
                     setTimeout(function(){
                    	 window.location.reload();
                     }, 1500 )                    
                 }
             },
             error:function(result){
            	 alert("error");
             }
         });
        return false;
    })
    
    var num = 0;
    var clickLoc = new Array();
    	$("#image").click(function(event){
    	    var obj=this;
    	    var x=event.offsetX;//获取点击时鼠标相对图片坐标
    	    var y=event.offsetY;          
    	    if(num < 4){
    	    	console.log("x:"+x+",y:"+y);
    			clickLoc.push(x);
    			clickLoc.push(y);
    	        $('div[class^=lablebox]').eq(num).css({"left":x-5,"top":y-8,'display':"block"});
    		      num++;
    	    }   
    	});
});

function refreshCode(){
    var captcha = document.getElementById("image");
    image.src = "Number2.jsp";
}
