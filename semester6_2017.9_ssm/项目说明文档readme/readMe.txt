
#####访问入口 http://localhost:[端口号]/NewEducationalSystem/

#####使用说明：
##执行数据库文件：sql/new_education_db-finnal.sql
##修改数据库连接参数（jdbc.user及jdbc.password）：src/res/mybatis127.xml
	<properties>
		<property name="jdbc.url.new_education_db" value="jdbc:mysql://127.0.0.1:3306/new_education_db?characterEncoding=utf8&amp;zeroDateTimeBehavior=convertToNull"/>
		<property name="jdbc.user" value="root"/>
		<property name="jdbc.password" value="root"/>
	</properties>


##使用IDE MyEclipse/Eclipse 运行Web项目 
Runtime Environment：Tomacat	
