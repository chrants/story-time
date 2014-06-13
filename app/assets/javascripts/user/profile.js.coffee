$(document).ready () ->
	$('.tab').click (evt) ->
		makeTabActive($(this).data("tab"))

	makeTabActive = ($tab) ->
		unless $(".tab[data-tab=#{$tab}]").hasClass("active")
			$('.tab').removeClass 'active'
			$(".tab[data-tab=#{$tab}]").addClass("active")
			$('#tabContents > li').each () ->
				if $(this).data('tab') is $tab
					$(this).show()
				else
					$(this).hide()

	$tabContents = $('#tabContents > li')
	$tab = window.location.hash.replace /#/, ''
	if $tab is ''
		makeTabActive 'profile'
	else
		makeTabActive $tab

	$(window).on('hashchange', (evt) ->
		$tabContents = $('#tabContents > li')
		$tab = window.location.hash.replace /#/, ''
		if $tab is ''
			makeTabActive 'profile'
		else
			makeTabActive $tab	
	)

