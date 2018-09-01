
app.controller('HTMLtoPDF', function ($http, $scope) {

  $scope.convert=function(){
    var pdf = new jsPDF('p', 'pt', 'letter');
    source = $('#contenu').html();
    specialElementHandlers = {
      '#bypassme': function(element, renderer){
        return true
      }
    };
    margins = {
      top: 50,
      left: 60,
      width: 545
    };
    pdf.fromHTML(
      source // HTML string or DOM elem ref.
      , margins.left // x coord
      , margins.top // y coord
      , {
      'width': margins.width // max width of content on PDF
      , 'elementHandlers': specialElementHandlers
      },
      function (dispose) {
        pdf.save($scope.Candidat.nom+"_"+$scope.Candidat.prenom+'.pdf');
      }
    )   
  };

});