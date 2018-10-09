layui.use('form', function() {
			var form = layui.form;

			form.verify({
				wordbookCategory : function(value) {
					if (value.length == 0) {
						return '请输入所属类别！';
					}
				},
				wordbookTitle : function(value) {
					if (value.length == 0) {
						return '请输入所属条目！';
					}
				},
				wordbookValue : function(value) {
					if (value.length == 0) {
						return '请输入所属的结果！';
					}
				},
				userPassword : function(value) {
					if (value.length == 0) {
						return '编辑/不编辑！';
					}
				}
			});
		});