var currentPlanet = {};
var showForm = false;

$(document).ready( function() {
$('#toggle').on('click', function() {
  showForm = !showForm;
  $('#planet-form').remove()
  $('#planets-list').toggle()

  if (showForm) {
    $.ajax({
      url: '/planet_form',
      method: 'GET',
      }).done( function(html) {
        $('#toggle').after(html);
      });
  }
});

  $('.planet-item').on('click', function() {
    currentPlanet.id = this.dataset.id
    currentPlanet.name = this.dataset.name
    $.ajax({
      url: '/planets/' + currentPlanet.id + '/characters',
      method: 'GET',
      dataType: 'JSON'
    }).done( function(characters) {
      $('#planet').text('Characters on ' + currentPlanet.name)
      var list = $('#characters');
      list.empty();
      characters.forEach( function(char) {
          var li = '<li data-character-id="' + char.id + '">' 
          + "Character - " + char.name + ',' + " Favorite ride - "  + char.vehicle + '</li>'
          list.append(li)
        });
      });
    });
  });