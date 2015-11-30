<p>
	<a href="javascript: d.openAll();">open all</a> | <a href="javascript: d.closeAll();">close all</a>
</p>

<script type="text/javascript">
	d = new dTree('d');

	d.add(0,-1,'대한민국');
	d.add(1,0,'서울','');	
	d.add(2,0,'인천','');
	d.add(3,1,'강북','');
	d.add(4,1,'강남','');
	d.add(5,1,'강서','');
	d.add(6,1,'강동','');
	d.add(7,2,'연수','');
	d.add(8,2,'부평','');
	d.add(9,2,'동구','');
	d.add(10,2,'서구','');
	d.add(11,3,'미아동','');
	d.add(12,4,'역삼동','');
	d.add(13,5,'염창동','');
	d.add(14,6,'명일동','');
	d.add(15,7,'청학동','');
	d.add(16,8,'산곡동','');
	d.add(18,9,'만석동','');
	d.add(19,10,'백석동','');
	document.write(d);
</script>