$(document).ready(function() {
  var $tab, $tabContents, makeTabActive;
  $('.tab').click(function(evt) {
    return makeTabActive($(this).data("tab"));
  });
  makeTabActive = function($tab) {
    if (!$(".tab[data-tab=" + $tab + "]").hasClass("active")) {
      $('.tab').removeClass('active');
      $(".tab[data-tab=" + $tab + "]").addClass("active");
      return $('#tabContents > li').each(function() {
        if ($(this).data('tab') === $tab) {
          return $(this).show();
        } else {
          return $(this).hide();
        }
      });
    }
  };
  $tabContents = $('#tabContents > li');
  $tab = window.location.hash.replace(/#/, '');
  if ($tab === '') {
    makeTabActive('profile');
  } else {
    makeTabActive($tab);
  }
  return $(window).on('hashchange', function(evt) {
    $tabContents = $('#tabContents > li');
    $tab = window.location.hash.replace(/#/, '');
    if ($tab === '') {
      return makeTabActive('profile');
    } else {
      return makeTabActive($tab);
    }
  });
});