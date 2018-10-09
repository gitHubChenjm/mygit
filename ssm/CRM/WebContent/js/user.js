layui.use('form', function() {
			var form = layui.form;

			form.verify({
				userAccount : function(value) {
					if (value.length == 0) {
						return '请输入用户的名字！';
					}
				},
				userPassword : function(value) {
					if (value.length == 0) {
						return '请输入用户的密码！';
					}
				}
			});
		});