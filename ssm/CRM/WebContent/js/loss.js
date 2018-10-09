layui.use('form', function() {
			var form = layui.form;

			form.verify({
				lossCustName : function(value) {
					if (value.length == 0) {
						return '客户不能为空！';
					}
				},
				lossUserName : function(value) {
					if (value.length == 0) {
						return '用户不能为空！';
					}
				},
			
			lossOrderDate :[/^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/,"请选择最后订单的日期！"]	
			});
		});