layui.use('form', function() {
			var form = layui.form;

			form.verify({
				ordersCustomer : function(value) {
					if (value.length == 0) {
						return '订单客户不能为空！';
					}
				},
				ordersAddress : function(value) {
					if (value.length == 0) {
						return '送货的地址呢？';
					}
				},
			
				ordersState : function(value) {
					if (value.length == 0) {
						return '回款？未回款？';
					}
				}
				
			});
		});