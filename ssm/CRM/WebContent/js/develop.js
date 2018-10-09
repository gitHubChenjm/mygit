layui.use('form', function() {
			var form = layui.form;

			form.verify({
				saleId : function(value) {
					if (value.length == 0) {
						return '销售机会编号不能为空！';
					}
				},
			saleDate :[/^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/,"请选择销售的日期！"]
			});
		});