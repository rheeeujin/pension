/**
 * 
 */




$(function (){
	/*$(".roominimg2 img").hide();*/
	
	$(".roominimg li a img").click(function(){
		var order = $(this).data("order");
		$(".roominimg2 li img").fadeOut(0);
		$(".roominimg2 li img").eq(order).fadeIn('.roominimg li a img');			
			
			
	})
	
})

	$(function() {
			    $(".roominimg").bxSlider({
			    	mode: 'horizontal',
			    	sliderWidth:150,  	
			    	moveSlides: 3,
			    	speed: 500,
			    	   auto: true,
			        controls: true,
			        pager :false,
			        touchEnabled : false
			        		
			    });

			});
