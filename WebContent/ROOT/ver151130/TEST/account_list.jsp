<link rel="stylesheet" href="./frl.css" type="text/css"><!--스타일링크-->
<style type="text/css">
	/* layout */
	body { text-align:center; }

	#logo{ margin-top: 50px; height: 100px; overflow: hidden; }
	.frltxt{ display: none; }
	#menu1, #menu2{ position:absolute; top: 210px; width: 160px; }
	#menu1{ left: 15px; }
	#menu2{ right: 15px; }

	#breadcrumb{ margin: 0px 15px 10px 15px; text-align: left; text-indent: 15px; }

	#contenuto { margin: 0px 185px; min-height: 340px; height: auto !important;height: 340px; }
	#contenuto a{ padding-left: 2px; padding-right: 2px; }

	#sezioni{ margin: 5px auto 5px 11px; padding: 0px; text-align:center; }
	#piedipagina{ margin-top: 10px; }
	#sezioni li, #piedipagina li{ display: inline; }
	#sezioni a{ padding: 1px 12px; text-decoration:none; }
	#piedipagina a{ padding: 1px 6px; text-decoration:none; }
	#sezioni a{ margin-right: 8px; }

	#sezioni a, #piedipagina a, #piedipagina span, #menu1 h2, #menu2 h2, #menu1 h2 a, #menu1 h2 a:hover,, #menu2 h2 a, #menu2 h2 a:hover, .box_title, .mbox .box_title a, .mbox .box_title a:hover, .mbox .box_title a:visited{ background: #000000; color: #ffffff; }
	#sezioni a:hover{ color: #000000; background: #ffffff;; }

	/* bordi */
	#sezioni a, #piedipagina span, #contenuto, #breadcrumb, .mbox textarea{ border: 1px solid #000000; }

	/* MENU */
	#submenus{ 
		position: absolute;
		margin: 0px auto;
		left:35%;
		width: 50%;
		text-align:left;
		font-family: 굴림,,굴림체,돋음,돋음체;
	}
	.trasparenza {
		filter:alpha(opacity=90);
		-moz-opacity:0.90;
		opacity: 0.90;
	}
	.menu .options {
		margin-right:1px;
		margin-bottom:1px;
		border:1px solid #330000;
		background: #ffffff url("./bg-carta.jpg");;
		text-align:left;
	}
	.menu a:link, .menu a:visited{
		color:#330000;
		display:block;
		padding:2px 11px;
		text-decoration:none;
		background-color:transparent;
		border-bottom: 1px solid #000000;
		font-family: 굴림,,굴림체,돋음,돋음체;
		font-size:11px;
	}
	.menu a:hover {
		background: #000000; 
		color:#FFFFFF; 
		border-bottom: 1px solid #000000; 
		font-size:11px;
	}
</style>

<style type="text/css">
	<!--
	font{ font-family:"굴림"; font-size: 9pt; line-height:17px; }
	td{ font-family:"굴림"; font-size: 9pt; line-height:17px; }
	a:visited {color:#000000; text-decoration: none }
	a:link { color:#000000; text-decoration: none; }
	a:active { color:#00ff00; text-decoration: none; }
	a:hover { color:#FFA217; text-decoration: underline; }
	.cont{line-height:140%}

	BODY 
	{scrollbar-face-color: #ffffff; 
	scrollbar-shadow-color: #c0c0c0; 
	scrollbar-highlight-color: #c0c0c0; 
	scrollbar-3dlight-color: #ffffff; 
	scrollbar-darkshadow-color:#ffffff; 
	scrollbar-track-color: #ffffff; 
	scrollbar-arrow-color: #ffffff} 
	-->
</style>

<script language="javascript">

	ypSlideOutMenu.Registry = []
	ypSlideOutMenu.aniLen = 300
	ypSlideOutMenu.hideDelay = 300
	ypSlideOutMenu.minCPUResolution = 10

	// constructor
	function ypSlideOutMenu(id, dir, left, top, width, height)
	{
		this.ie = document.all ? 1 : 0
		this.ns4 = document.layers ? 1 : 0
		this.dom = document.getElementById ? 1 : 0

		if (this.ie || this.ns4 || this.dom) {
			this.id = id
			this.dir = dir
			this.orientation = dir == "left" || dir == "right" ? "h" : "v"
			this.dirType = dir == "right" || dir == "down" ? "-" : "+"
			this.dim = this.orientation == "h" ? width : height
			this.hideTimer = false
			this.aniTimer = false
			this.open = false
			this.over = false
			this.startTime = 0
			this.gRef = "ypSlideOutMenu_"+id
			eval(this.gRef+"=this")
			ypSlideOutMenu.Registry[id] = this
			var d = document
			var strCSS = '<style type="text/css">';
			strCSS += '#' + this.id + 'Container { visibility:hidden; '
			strCSS += 'left:' + left + 'px; '
			strCSS += 'top:' + top + 'px; '
			strCSS += 'overflow:hidden; z-index:10000; }'
			strCSS += '#' + this.id + 'Container, #' + this.id + 'Content { position:absolute; '
			strCSS += 'width:' + width + 'px; '
			strCSS += 'height:' + height + 'px; '
			strCSS += 'clip:rect(0 ' + width + ' ' + height + ' 0); '
			strCSS += '}'
			strCSS += '</style>'
			d.write(strCSS)
			this.load()
		}
	}

	ypSlideOutMenu.prototype.load = function() {
		var d = document
		var lyrId1 = this.id + "Container"
		var lyrId2 = this.id + "Content"
		var obj1 = this.dom ? d.getElementById(lyrId1) : this.ie ? d.all[lyrId1] : d.layers[lyrId1]

		if (obj1) var obj2 = this.ns4 ? obj1.layers[lyrId2] : this.ie ? d.all[lyrId2] : d.getElementById(lyrId2)

		var temp
		if (!obj1 || !obj2) window.setTimeout(this.gRef + ".load()", 100)
		else {
			this.container = obj1
			this.menu = obj2
			this.style = this.ns4 ? this.menu : this.menu.style
			this.homePos = eval("0" + this.dirType + this.dim)
			this.outPos = 0
			this.accelConst = (this.outPos - this.homePos) / ypSlideOutMenu.aniLen / ypSlideOutMenu.aniLen 

			// set event handlers.
			if (this.ns4) this.menu.captureEvents(Event.MOUSEOVER | Event.MOUSEOUT);
			this.menu.onmouseover = new Function("ypSlideOutMenu.showMenu('" + this.id + "')")
			this.menu.onmouseout = new Function("ypSlideOutMenu.hideMenu('" + this.id + "')")

			//set initial state
			this.endSlide()
		}
	}

	ypSlideOutMenu.showMenu = function(id)
	{
		var reg = ypSlideOutMenu.Registry
		var obj = ypSlideOutMenu.Registry[id]

		if (obj.container) {
			obj.over = true
			for (menu in reg) if (id != menu) ypSlideOutMenu.hide(menu)
			if (obj.hideTimer) { reg[id].hideTimer = window.clearTimeout(reg[id].hideTimer) }
			if (!obj.open && !obj.aniTimer) reg[id].startSlide(true)
		}
	}

	ypSlideOutMenu.hideMenu = function(id)
	{
		var obj = ypSlideOutMenu.Registry[id]

		if (obj.container) {
			if (obj.hideTimer) window.clearTimeout(obj.hideTimer)
			obj.hideTimer = window.setTimeout("ypSlideOutMenu.hide('" + id + "')", ypSlideOutMenu.hideDelay);
		}
	}

	ypSlideOutMenu.hideAll = function()
	{
		var reg = ypSlideOutMenu.Registry

		for (menu in reg) {
			ypSlideOutMenu.hide(menu);
			if (menu.hideTimer) window.clearTimeout(menu.hideTimer);
		}
	}

	ypSlideOutMenu.hide = function(id)
	{
		var obj = ypSlideOutMenu.Registry[id]
		obj.over = false
		if (obj.hideTimer) window.clearTimeout(obj.hideTimer)
		obj.hideTimer = 0
		if (obj.open && !obj.aniTimer) obj.startSlide(false)
	}

	ypSlideOutMenu.prototype.startSlide = function(open) {
		this[open ? "onactivate" : "ondeactivate"]()
		this.open = open
		if (open) this.setVisibility(true)
		this.startTime = (new Date()).getTime() 
		this.aniTimer = window.setInterval(this.gRef + ".slide()", ypSlideOutMenu.minCPUResolution)
	}

	ypSlideOutMenu.prototype.slide = function() {
		var elapsed = (new Date()).getTime() - this.startTime

		if (elapsed > ypSlideOutMenu.aniLen) this.endSlide()
		else {
			var d = Math.round(Math.pow(ypSlideOutMenu.aniLen-elapsed, 2) * this.accelConst)
			if (this.open && this.dirType == "-") d = -d
			else if (this.open && this.dirType == "+") d = -d
			else if (!this.open && this.dirType == "-") d = -this.dim + d
			else d = this.dim + d
			this.moveTo(d)
		}
	}

	ypSlideOutMenu.prototype.endSlide = function() {
		this.aniTimer = window.clearTimeout(this.aniTimer)
		this.moveTo(this.open ? this.outPos : this.homePos)
		if (!this.open) this.setVisibility(false)
		if ((this.open && !this.over) || (!this.open && this.over)) {
			this.startSlide(this.over)
		}
	}

	ypSlideOutMenu.prototype.setVisibility = function(bShow) { 
		var s = this.ns4 ? this.container : this.container.style
		s.visibility = bShow ? "visible" : "hidden"
	}

	ypSlideOutMenu.prototype.moveTo = function(p) { 
		this.style[this.orientation == "h" ? "left" : "top"] = this.ns4 ? p : p + "px"
	}

	ypSlideOutMenu.prototype.getPos = function(c) {
		return parseInt(this.style[c])
	}

	ypSlideOutMenu.prototype.onactivate = function() { }
	ypSlideOutMenu.prototype.ondeactivate = function() { }

	// Menu configuration Options
	//var myOffset = -310;

	// the number you pass to initLeft doesn't matter since it will get
	// changed onactivate
	// left, from top, width, height
	var myMenu = new ypSlideOutMenu("menu", "down", 0, 0, 160, 300);

	// for each menu, we set up the onactivate event to call repositionMenu with the amount offset from center, in pixels
	myMenu.onactivate = function() { repositionMenu(myMenu, 525); }


	// this function repositions a menu to the speicified offset from center
	function repositionMenu(menu, offset)
	{
		// the new left position should be the center of the window + the offset
		// var newLeft = getWindowWidth() / 2 + offset;

		var newLeft = offset;

		// setting the left position in netscape is a little different than IE
		menu.container.style ? menu.container.style.left = newLeft + "px" : menu.container.left = newLeft;
	} 

	// this function calculates the window's width - different for IE and netscape
	function getWindowWidth()
	{
		return window.innerWidth ? window.innerWidth : document.body.offsetWidth;
	}
</script>

<table border="0" cellpadding="0" cellspacing="0">
	<tr> <td> <ul id="sezioni">
		<li><a class="m1" onmouseover="ypSlideOutMenu.showMenu('menu');" onmouseout="ypSlideOutMenu.hideMenu('menu')" title="" href="#">asdfasdf</a></li>
	</ul></td> </tr>

	<tr> <td> <div id="submenus"> 
		<div class="trasparenza" id="menuContainer"> 
		<div class="menu" id="menuContent"> 
		<div class="options"> 
			<a href="#">0001</a> 
			<a href="#">0002</a> 
			<a href="#">0003</a> 
			<a href="#">0004</a> 
			<a href="#">0005</a>
		</div>
		</div>
		</div>
	</div> </td> </tr>
</table>