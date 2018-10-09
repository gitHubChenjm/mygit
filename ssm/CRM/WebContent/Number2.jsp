<%@ page contentType="image/jpeg"
	import="java.awt.*,java.awt.image.*,java.util.*,javax.imageio.*,java.io.*"
	pageEncoding="utf-8"%>

<%!String getRandomChineseChar(){
		String str = null;
	    int hs, ls; 
	    Random random = new Random();
	    hs = (176 + Math.abs(random.nextInt(39))); 
	    ls = (161 + Math.abs(random.nextInt(93)));
	    byte[] b = new byte[2];
	    b[0] = (new Integer(hs).byteValue());
	    b[1] = (new Integer(ls).byteValue());
	    try
	      {
	    	  str = new String(b, "GBk"); //转成中文
	      }
	      catch (UnsupportedEncodingException ex)
	      {
	    	  ex.printStackTrace();
	      }
	    return str;
	}

	
%>
<%
	Random random = new Random();      
	int height = 70;  //图片高
	int width = 260;  //图片宽
	BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
	Graphics2D g =  (Graphics2D) image.getGraphics();
//	String picPath= "D:/1.png";  //读取本地图片，做背景图片
	//获取服务器路径里的资源文件
	String picPath= request.getSession().getServletContext().getRealPath("pictures/"+random.nextInt(3)+".png");
	System.out.println(picPath);
	g.drawImage(ImageIO.read(new File(picPath)), 0, 25, width, height, null); //将背景图片从高度25开始
	 
	g.setColor(Color.white);  //设置颜色
	g.drawRect(0, 0, width-1, height-1); //画边框
	
	g.setFont(new Font("宋体",Font.BOLD,25)); //设置字体
	Integer x=null,y=null;  //用于记录坐标
	String target=null; 	// 用于记录文字
	int loc[][] = new int[4][2];
	String word[] = new String[4];
	for(int i=0;i<4;i++){  //随机产生4个文字，坐标，颜色都不同
	    g.setColor(new Color(random.nextInt(50)+100, random.nextInt(50)+100, random.nextInt(50)+100));
	    String str = getRandomChineseChar();
	    int a=random.nextInt(width-40);
	    //如果x坐标与已有的x坐标相近,就重新取过随机值,保证不同的两个文字不重叠
	    for(int j=0;j<loc.length;j++){
	    	if(a>(loc[j][0]-20) && a<(loc[j][0]+20)){
	    		a = random.nextInt(width-40);
	    		j = -1;
	    	}
	    }
	    int b=random.nextInt(height-55)+50;
	   	loc[i][0] = a;	//存放x坐标
	   	loc[i][1] = b;	//存放y坐标
	    word[i] = str;
	    g.drawString(str, a, b);
	}
	
	//设置提示文字背景
	g.setColor(new Color(255,255,204));  
	g.fillRect(0, 0, width, 25);
	g.setColor(Color.black);  
	g.setFont(new Font("宋体",Font.PLAIN,15)); //设置字体
	g.drawString("请依次点击"+word[0]+word[1]+word[2]+word[3],0,20);//写入验证码第一行文字  “点击..”
	request.getSession().setAttribute("location",loc);//将坐标放入session
	request.getSession().setAttribute("word",word);//将文字放入session
	int i = 0;
	while(i<4){
		System.out.println(word[i]+":"+loc[i][0]+","+loc[i][1]);
		i++;
	}
	//5.释放资源
	g.dispose();
	//6.利用ImageIO进行输出
	ImageIO.write(image, "jpg", response.getOutputStream()); //将图片输出
	
	out.clear();  
	out = pageContext.pushBody();   
%>
