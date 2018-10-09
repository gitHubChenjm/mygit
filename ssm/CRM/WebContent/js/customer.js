layui.use('form', function() {
			var form = layui.form;

			form.verify({
				custName : function(value) {
					if (value.length == 0) {
						return '客户不能为空！';
					}
				},
				custContacts : function(value) {
					if (value.length == 0) {
						return '首要联系人不能为空！';
					}
				},
				custTel :[/^(13[0-9]|14[579]|15[0-3,5-9]|16[6]|17[0135678]|18[0-9]|19[89])\d{8}$/,"请输入正确的手机号"],
				
				custPostal : [/^[1-9][0-9]{5}$/,"请输入正确的邮政编号"],
				
				custFax :[/^0\d{3,4}-?\d{7,8}$/,"请正确的输入传真号码"],
				
				/*fax : function(value) {
					if (value.length == 0) {
						return '传真不能为空！';
					}
				},*/
				custUrlName : [/(^#)|(^http(s*):\/\/[^\s]+\.[^\s]+)/,"告诉我客户的链接呗？"],
				
				legalPerson : [/[\S]+/,"请输入法人哦"],
				
				custFund : [/^[+][0-9]+\.[0-9]+$/,"请输入注册基金"],
				/*/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/*/				
				custBank : function(value) {
					if (value.length == 0) {
						return '请输入选择的银行！';
					}
				},
				custBankNum : function(value) {
					if (value.length == 0) {
						return '请输入银行账号！';
					}
				},
				 /*formatBankNo : function(BankNo){  //银行账号正则表达式
					  if (BankNo.value == "") return;
					  var account = new String (BankNo.value);
					  account = account.substring(0,22); //帐号的总数, 包括空格在内 
					  if (account.match (".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}") == null){
					    // 对照格式 
					    if (account.match (".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" +
					    ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}") == null){
					      var accountNumeric = accountChar = "", i;
					      for (i=0;i<account.length;i++){
					        accountChar = account.substr (i,1);
					        if (!isNaN (accountChar) && (accountChar != " ")) accountNumeric = accountNumeric + accountChar;
					      }
					       account = "";
					      for (i=0;i<accountNumeric.length;i++){   //可将以下空格改为-,效果也不错 
					        if (i == 4) account = account + " ";  //帐号第四位数后加空格 
					        if (i == 8) account = account + " ";  //帐号第八位数后加空格 
					        if (i == 12) account = account + " "; //帐号第十二位后数后加空格 
					        account = account + accountNumeric.substr (i,1)
					      }
					    }
					  }
					  else
					  {
					    account = " " + account.substring (1,5) + " " + account.substring (6,10) + " " + account.substring (14,18) + "-" + account.substring(18,25);
					  }
					  if (account != BankNo.value) BankNo.value = account;
					},
*/
				custCreditId : function(value) {
					if (value.length == 0) {
						return '选择一个信用度呗！';
					}
				},
				satisfiedId : function(value) {
					if (value.length == 0) {
						return '选择一个满意度呗！';
					}
				},
				custFromId : function(value) {
					if (value.length == 0) {
						return '客户来自哪里呢？';
					}
				},
				custUser : function(value) {
					if (value.length == 0) {
						return '哪个客户经理负责的？！';
					}
				},
				custcategoryId : function(value) {
					if (value.length == 0) {
						return '合作伙伴？战略伙伴？';
					}
				},
								
				custAddress : function(value) {
					if (value.length == 0) {
						return '客户的联系地址呢？';
					}
				}
				
				
			});
		});