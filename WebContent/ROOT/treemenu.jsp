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
	d.add(50,5,'운서동','');
	d.add(51,5,'운남동','');
	d.add(52,5,'중산동','');
	d.add(53,5,'운복동','');
	d.add(54,5,'덕교동','');
	/*d.add(55,5,'남북동','');
	d.add(56,5,'을왕동','');
	d.add(57,5,'무의동','');
	d.add(58,5,'연안동','');
	d.add(59,5,'신흥동','');*/	
	document.write(d);	
</script>