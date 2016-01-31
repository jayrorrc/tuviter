var ready = function() {
    $(".button-collapse").sideNav();
    $(".dropdown-button").dropdown();
};

$(document).ready(ready);
$(document).on('page:load', ready);