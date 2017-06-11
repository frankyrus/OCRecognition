$(document).ready(function(){
	$('.btn-success').click(function(){
		$('.progress').removeClass('hidden');
	})
/*	$('.spoiler_links').click(function(){
		$(this).parent().children('div.spoiler_body').toggle('normal');
		return false;
	});
	$( window ).scroll(function() {
		$('.crew').each( function(i){
			var bottomOfObject = $(this).offset().top + $(this).outerHeight();
			var bottomOfWindow = $(window).scrollTop() + $(window).height();
			if( bottomOfWindow > bottomOfObject ){
			if ($(this).css("opacity")==0) {
				$(this).fadeTo(500,1);}
			} else {
				if ($(this).css("opacity")==1) {
					$(this).fadeTo(500,0);
				}
			}
		}); 
	});*/
	var trigger = $('.hamburger'),
      overlay = $('.overlay'),
     isClosed = false;

    trigger.click(function () {
      hamburger_cross();      
    });

    function hamburger_cross() {

      if (isClosed == true) {          
        overlay.hide();
        trigger.removeClass('is-open');
        trigger.addClass('is-closed');
        isClosed = false;
      } else {   
        overlay.show();
        trigger.removeClass('is-closed');
        trigger.addClass('is-open');
        isClosed = true;
      }
  }
  
  $('[data-toggle="offcanvas"]').click(function () {
        $('#wrapper').toggleClass('toggled');
  });  
});
angular.module('app', ['ngImgCrop'])
.controller('Ctrl', function($scope) {
  $scope.myImage='';
  $scope.myCroppedImage='';
  $scope.cropper = {
	      cropWidth: $scope.rectangleWidth,
	      cropHeight: $scope.rectangleHeight
	    };
  var handleFileSelect=function(evt) {
    var file=evt.currentTarget.files[0];
    var reader = new FileReader();
    reader.onload = function (evt) {
      $scope.$apply(function($scope){
        $scope.myImage=evt.target.result;
      });
    };
    reader.readAsDataURL(file);
  };
  angular.element(document.querySelector('#fileInput')).on('change',handleFileSelect);
});