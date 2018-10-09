layui.use('form', function() {
			var form = layui.form;

			form.verify({
				userName : function(value) {
					if (value.length == 0) {
						return '请输入用户的名字！';
					}
				},
				roleName : function(value) {
					if (value.length == 0) {
						return '请选择用户的角色！';
					}
				}
			});
		});