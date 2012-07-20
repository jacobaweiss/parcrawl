$(document).ready ->
  $(".new-player").click ->
    $(".new-player-form").slideToggle "fast"

  $(".new-penalty").click ->
    $(".new-penalty-form").slideToggle "fast"

  $(".new-hole").click ->
    $(".new-hole-form").slideToggle "fast"

  $(".new-score").click ->
    $(this).next(".new-score-form").slideToggle "fast"