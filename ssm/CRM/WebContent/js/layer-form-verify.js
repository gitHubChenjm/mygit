layui.use('form', function() {
			var form = layui.form;

			form.verify({
				name : function(value) {
					if (value.length == 0) {
						return '客户名称不能为空！';
					}
				},
				contacts : function(value) {
					if (value.length == 0) {
						return '首要联系人不能为空！';
					}
				},
				tel :[/^1\d{10}$/,"请输入正确的手机号"],
				postal : function(value) {
					if (value.length == 0) {
						return '邮编不能为空！';
					}
				},
				fax : function(value) {
					if (value.length == 0) {
						return '传真不能为空！';
					}
				},
				creditId : function(value) {
					if (value.length == 0) {
						return '选择一个信用度呗！';
					}
				},
				satisfiedId : function(value) {
					if (value.length == 0) {
						return '选择一个满意度呗！';
					}
				},
				custfromId : function(value) {
					if (value.length == 0) {
						return '客户来自哪里呢？';
					}
				},
				user : function(value) {
					if (value.length == 0) {
						return '哪个客户经理负责的？！';
					}
				},
				custcategoryId : function(value) {
					if (value.length == 0) {
						return '合作伙伴？战略伙伴？';
					}
				},
				urlname : [/(^#)|(^http(s*):\/\/[^\s]+\.[^\s]+)/,"告诉我客户的链接呗？"],
				address : function(value) {
					if (value.length == 0) {
						return '客户的联系地址呢？';
					}
				},
				legalPerson : [/[\S]+/,"请输入法人哦"],
				fund : [/^[+][0-9]+\.[0-9]+$/,"请输入注册基金"]
			});
		});