layui.use('form', function() {
			var form = layui.form;

			form.verify({
				commName : function(value) {
					if (value.length == 0) {
						return '客户不能为空！';
					}
				},
				commDate :[/^[1-9]\d{3}-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])\s+(20|21|22|23|[0-1]\d):[0-5]\d:[0-5]\d$/,"请选择交往的时间"],
				
				commAddress : function(value) {
					if (value.length == 0) {
						return '交往的地点在哪里？';
					}
				},
				commGeneral : function(value) {
					if (value.length == 0) {
						return '大概说说交往要点！';
					}
				}
			});
		});