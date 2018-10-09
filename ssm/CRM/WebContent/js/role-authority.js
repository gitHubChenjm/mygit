layui.use('form', function() {
			var form = layui.form;

			form.verify({
				authoMark : function(value) {
					if (value.length == 0) {
						return '权限不能为空！';
					}
				},
			roleName : function(value) {
				if (value.length == 0) {
					return '角色不能为空！';
				}
			}
			});
		});