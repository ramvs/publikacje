# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "change" , "#type_select" , () ->
	send_params_request()

$(document).ready () ->
	send_params_request()

send_params_request = () ->
	$.get '/attributes/'+$("#type_select").val()+'/'+$("#pub_id").val() ,
		(data)->