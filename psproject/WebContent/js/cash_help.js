	var x = 0;
	var y = 0;
	var snow = 0;
	var sw = 0;
	var cnt = 0;
	var dir = 1;
	var offsetx = 90;
	var offsety = -50;
	var width = 290;
	var height = 50;

	document.onmousemove = mouseMove;

	function nd() {
		if ( cnt >= 1 ) { sw = 0 };
		if ( sw == 0 ) { snow = 0; hideObject(over); }
		else { cnt++; }
	}

	function disp(obj) {
		parm = eval(obj);
		over = parm.style;
		if (snow == 0) {
			if (dir == 2) { moveTo(over,x+offsetx-(width/2),y+offsety); } // Center
			if (dir == 1) { moveTo(over,x+offsetx,y+offsety); } // Right
			if (dir == 0) { moveTo(over,x-offsetx-width,y+offsety); } // Left
			showObject(over);
			snow = 1;
		}
	}

	function mouseMove(e) {
		x=event.x + document.documentElement.scrollLeft+10
		y=event.y + document.documentElement.scrollTop
		if (x+width-document.documentElement.scrollLeft > document.documentElement.clientWidth) x=x-width-25;
		if (y+height-document.documentElement.scrollTop > document.documentElement.clientHeight) y=y-height;

		if (snow) {
			if (dir == 2) { moveTo(over,x+offsetx-(width/2),y+offsety); } // Center
			if (dir == 1) { moveTo(over,x+offsetx,y+offsety); } // Right
			if (dir == 0) { moveTo(over,x-offsetx-width,y+offsety); } // Left
		}
	}

	function cClick() { hideObject(over); sw=0; }
	function layerWrite(txt) { document.all["resisttext"].innerHTML = txt }
	function showObject(obj) { obj.visibility = "visible" }
	function hideObject(obj) { obj.visibility = "hidden" }
	function moveTo(obj,xL,yL) { obj.left = xL; obj.top = yL; }