layui.use('form', function() {
			var form = layui.form;

			form.verify({
				roleName : function(value) {
					if (value.length == 0) {
						return '角色不能为空！';
					}
				}
			});
		});