$('.tooltip-onhover').hover ()->
	$(this).popover
		trigger: 'manual',
		placement: 'left',
		delay: { show: 500, hide: 100 }