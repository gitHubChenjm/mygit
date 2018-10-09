layui.use('form', function() {
			var form = layui.form;

			form.verify({
				depository : function(value) {
					if (value.length == 0) {
						return '仓库不能为空！';
					}
				},
				stockPosition : function(value) {
					if (value.length == 0) {
						return '送货的位置不能为空！';
					}
				},
			
				stockCount :[/^1\d{10}$/,"请输入货物的数量"]
				/*：^[0-9]*$ */
				
			});
		});