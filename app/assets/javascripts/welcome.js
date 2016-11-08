var ready = function () {
  $('[data-toggle="tooltip"]').tooltip({
    placement: 'right',
  })
}

$(document).ready(ready);
$(document).on('page:load', ready);
