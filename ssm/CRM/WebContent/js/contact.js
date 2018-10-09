layui.use('form', function() {
			var form = layui.form;

			form.verify({
				contCustName : function(value) {
					if (value.length == 0) {
						return '客户不能为空！';
					}
				},
				contGender : function(value) {
					if (value.length == 0) {
						return '性别不能为空！';
					}
				},
				contJob : function(value) {
					if (value.length == 0) {
						return '职位不能为空！';
					}
				},
				contJobTel :[/^0\d{2,3}-?\d{7,8}$/,"请正确的输入您的办公电话"],
				
				contTel :[/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/,"请输入正确的手机号"],
				
				contName : function(value) {
					if (value.length == 0) {
						return '联系人不能为空！';
					}
				}
			});
		});