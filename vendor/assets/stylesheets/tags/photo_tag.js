$(document).ready(function() {



$("#imageMap").click(function(e){


var image_left = $(this).offset().left;
var click_left = e.pageX;
var left_distance = click_left - image_left;

var image_top = $(this).offset().top;
var click_top = e.pageY;
var top_distance = click_top - image_top;

var mapper_width = $('#mapper').width();
var imagemap_width = $('#imageMap').width();

var mapper_height = $('#mapper').height();
var imagemap_height = $('#imageMap').height();






if((top_distance + mapper_height > imagemap_height) && (left_distance + mapper_width > imagemap_width)){
$('#mapper').css("left", (click_left - mapper_width - image_left  ))
.css("top",(click_top - mapper_height - image_top  ))
.css("width","100px")
.css("height","100px")
.show();
}
else if(left_distance + mapper_width > imagemap_width){


$('#mapper').css("left", (click_left - mapper_width - image_left  ))
.css("top",top_distance)
.css("width","100px")
.css("height","100px")
.show();

}
else if(top_distance + mapper_height > imagemap_height){
$('#mapper').css("left", left_distance)
.css("top",(click_top - mapper_height - image_top  ))
.css("width","100px")
.css("height","100px")
.show();
}
else{


$('#mapper').css("left",left_distance)
.css("top",top_distance)
.css("width","100px")
.css("height","100px")
.show();
}


$("#mapper").resizable({ containment: "parent" });
$("#mapper").draggable({ containment: "parent" });

});


});




$(".tagged").live("mouseover",function(){
if($(this).find(".openDialog").length == 0){
$(this).find(".tagged_box").css("display","block");
$(this).css("border","5px solid #EEE");

$(this).find(".tagged_title").css("display","block");
}


});

$(".tagged").live("mouseout",function(){
if($(this).find(".openDialog").length == 0){
$(this).find(".tagged_box").css("display","none");
$(this).css("border","none");
$(this).find(".tagged_title").css("display","none");
}


});