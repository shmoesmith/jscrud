var currentPlanet = {};

$(document).ready( function() {
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
          + char.name + '-' + char.vehicle + '</li>'
          list.append(li)
        });
      });
    });
  });