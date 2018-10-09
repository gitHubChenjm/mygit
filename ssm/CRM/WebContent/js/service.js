layui.use('form', function() {
			var form = layui.form;

			form.verify({
				serviceCategory : function(value) {
					if (value.length == 0) {
						return '请选择服务类型！';
					}
				},
				serviceStyle: function(value) {
					if (value.length == 0) {
						return '请选择服务方式！';
					}
				},
				serviceSummary : function(value) {
					if (value.length == 0) {
						return '服务概要不能为空！';
					}
				},
				
				
				customerName : function(value) {
					if (value.length == 0) {
						return '客户不能为空！';
					}
				},
				
				createName : function(value) {
					if (value.length == 0) {
						return '服务创建人不能为空！';
					}
				},
				createDate :[/^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/,"请选择创建服务的时间！"]
				
			});
		});