<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<script type="text/javascript">
	d = new dTree('d');
	<!--add(id, pid, name, url, title, target, icon, iconOpen, open)-->
	d.add(0,-1,'인천광역시','');
	d.add(1,0,'연수구','');
	d.add(2,0,'부평구','');
	d.add(3,0,'동구','');
	d.add(4,0,'서구','');
	d.add(5,0,'중구','');
	d.add(10,5,'운서동','');
	d.add(20,5,'운남동','');
	d.add(30,5,'중산동','');
	d.add(40,5,'운복동','');
	d.add(50,5,'덕교동','');
	d.add(60,5,'남북동','');
	d.add(70,5,'을왕동','');
	d.add(80,5,'무의동','');
	d.add(90,5,'연안동','');
	d.add(100,5,'신흥동','');
	document.write(d);
</script>