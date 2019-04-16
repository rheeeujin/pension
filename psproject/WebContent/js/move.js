<!-- 

var stmnGAP1 = 100 // 其捞瘤 庆歹何盒狼 咯归 
var stmnGAP2 =20; // 胶农费矫 宏扼快历 惑窜苞 距埃 剁框. 鞘夸绝栏搁 0栏肺 技泼 
var stmnBASE =20; // 胶农费皋春 檬扁 矫累困摹 (酒公犯霸唱 秦档 惑包篮 绝瘤父 stmnGAP1苞 距埃 瞒捞甫 林绰霸 焊扁 亮澜) 
var stmnActivateSpeed = 20; // 框流烙阑 皑瘤窍绰 加档 (箭磊啊 努荐废 词霸 舅酒瞒覆) 
var stmnScrollSpeed = 3; // 胶农费登绰 加档 (努荐废 词霸 框流烙) 
var stmnTimer; 
function RefreshStaticMenu() 
{ 
	var stmnStartPoint, stmnEndPoint, stmnRefreshTimer; 
	stmnStartPoint = parseInt(STATICMENU.style.top, 10); 
	stmnEndPoint = document.body.scrollTop + stmnGAP2; 
	stmnLimit = parseInt(window.document.body.scrollHeight) - parseInt(STATICMENU.offsetHeight); 
	if (stmnEndPoint > stmnLimit) stmnEndPoint = stmnLimit; 
	if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
	stmnRefreshTimer = stmnActivateSpeed; 
	if ( stmnStartPoint != stmnEndPoint ) { 
		stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
		STATICMENU.style.top = parseInt(STATICMENU.style.top, 10) + ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ); 
		stmnRefreshTimer = stmnScrollSpeed; 
	} 
	stmnTimer = setTimeout ("RefreshStaticMenu();", stmnRefreshTimer); 
} 

function InitializeStaticMenu() { 
	STATICMENU.style.top = document.body.scrollTop + stmnBASE; 
	RefreshStaticMenu(); 
} 

//--> 