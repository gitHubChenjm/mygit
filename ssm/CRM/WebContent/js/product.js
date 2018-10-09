layui.use('form', function() {
			var form = layui.form;

			form.verify({
				produName : function(value) {
					if (value.length == 0) {
						return '产品名称不能为空！';
					}
				},
				produType : function(value) {
					if (value.length == 0) {
						return '产品类型不能为空！';
					}
				},
				produGrade : function(value) {
					if (value.length == 0) {
						return '货物是什么等级/批次！';
					}
				},
				productUnit : function(value) {
					if (value.length == 0) {
						return '货物的单位';
					}
				},
				produPrice : [/^[+][0-9]+\.[0-9]+$/,"请产品单价！"]
			});
		});