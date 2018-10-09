layui.use('form', function() {
			var form = layui.form;

			form.verify({
				customerName : function(value) {
					if (value.length == 0) {
						return '客户名称不能为空！';
					}
				},
				saleSummery : function(value) {
					if (value.length == 0) {
						return '销售的机会概要不能为空！';
					}
				},
				saleSource : function(value) {
					if (value.length == 0) {
						return '机会来自于哪里？';
					}
				},
				
				
				contacts : function(value) {
					if (value.length == 0) {
						return '请输入销售的联系人！';
					}
				},
				
				tel :[/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/,"请输入正确的手机号"],
				
				//salecreateDate :[/^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/,"请选择创建销售的日期！"],
				
				
				saleStatus : function(value) {
					if (value.length == 0) {
						return '服务状态1!/0！';
					}
				},
				saleState : function(value) {
					if (value.length == 0) {
						return '开发成功！/开发失败！';
					}
				}
			});
		});