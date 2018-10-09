layui.use('form', function() {
			var form = layui.form;

			form.verify({
				ordersId : function(value) {
					if (value.length == 0) {
						return '订单的编号不能为空！';
					}
				},
				orderitProductId : function(value) {
					if (value.length == 0) {
						return '产号编号不能为空!';
					}
				},
			
				orderitemCount :[/^1\d{10}$/,"请输入产品的数量"]
				/*：^[0-9]*$ */
				
			});
		});