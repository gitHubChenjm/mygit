layui.use('form', function() {
			var form = layui.form;

			form.verify({
				authoName : function(value) {
					if (value.length == 0) {
						return '权限不能为空！';
					}
				}
			});
		});