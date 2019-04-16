<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


	<div id="map" style="width: 100%; height: 500px;"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b4c8099f570bef35fef193829962aa99">
			</script>
				<script>
				//지도 생성
				var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
				var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new daum.maps.LatLng(${dao.latitude} , ${dao.longitude}), //지도의 중심좌표.
				level: 3 }; //지도의 레벨(확대, 축소 정도)
				var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new daum.maps.LatLng(${dao.latitude} , ${dao.longitude}), // 지도의 중심좌표
			        level: 4 // 지도의 확대 레벨
			    };

				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 마커 생성
				var markerPosition  = new daum.maps.LatLng(${dao.latitude},${dao.longitude}); 
				var marker = new daum.maps.Marker({
			    position: markerPosition
				});
				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);
				// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
				// marker.setMap(null);  
				
				// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
				var mapTypeControl = new daum.maps.MapTypeControl();
				
				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
				
				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new daum.maps.ZoomControl();
				map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			</script>
