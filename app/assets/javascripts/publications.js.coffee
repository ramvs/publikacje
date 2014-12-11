# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "change" , "#type_select" , () ->
	send_params_request()

$(document).on "submit" , "#main_form" , (ev) ->
	$(this).append $(".attribute_value")

$(document).ready () ->
	send_params_request()

$(document).ready () ->
	$("#author_select").chosen 
		width:"100%",
		placeholder_text_multiple: "Wybierz autorów"
	
	
	$("#type_select").chosen
		width:"100%"
	

send_params_request = () ->
	if $("#type_select").length==0
		return
	$.get '/attributes/'+$("#type_select").val()+'/'+$("#pub_id").val() ,
		(data)->




