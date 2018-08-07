//Selectionner data dans la BDD


var app = angular.module("myapp", ['ngRoute']);

app.controller('listeCandidats', function ($http, $scope) {
    $http({
        method : "GET",
        url : "http://localhost/projetCandidat/database/lesCandidats.php",
        headers: {
            'Accept': '*.*',
            'Content-Type': 'application/json'
        }
    }).then(function onSuccess(response ) {
        $scope.lescandidats = response.data.mydb;
        console.log(response)

    }).catch(function onError(response) {
        // Handle error
        console.warn("error getting data");
        console.log(response)
    });

})
.controller('unCandidat', function ($http, $scope,$routeParams) {
    $http({
        method : "GET",
        url : "http://localhost/projetCandidat/database/select.php",
        headers: {
            'Accept': '*.*',
            'Content-Type': 'application/json'
        },
        params:{"idcandid":$routeParams.idcandid},
    }).then(function onSuccess(response ) {
        $scope.Candidat = response.data.mydb;
        console.log(response)

    }).catch(function onError(response) {
        // Handle error
        console.warn("error getting data");
        console.log(response)
    });
})
.controller('competences', function ($http, $scope,$routeParams) {
    $http({
        method : "GET",
        url : "http://localhost/projetCandidat/database/selectCompetences.php",
        headers: {
            'Accept': '*.*',
            'Content-Type': 'application/json'
        },
        params:{"idcandid":$routeParams.idcandid},
    }).then(function onSuccess(response) {
        $scope.lescompetences = response.data.mydb;
        console.log(response)

    }).catch(function onError(response) {
        // Handle error
        console.warn("error getting data");
        console.log(response)
    });
})
.controller('operationUtilisateur', function($http, $scope,$location){
    $scope.consulterCandidat=function($parameter){
      console.log($parameter);
        $location.url('/unCandidat/'+$parameter);
    };
    $scope.modifier=function(){
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/update.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/json'
            },
            data:{"candidat":$scope.Candidat},

        }).then(function onSuccess(response ) {
            $scope.lescandidats = response.data.mydb;

            console.log(response)

        }).catch(function onError(response) {
            // Handle error
            console.warn("error getting data");
            console.log(response)
        });
    };
});



app.config(['$routeProvider', '$locationProvider',
function($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'templates/lescandidats.html',
    })
    .when('/candidats', {
        templateUrl: 'templates/lescandidats.html',
      })
    .when('/unCandidat/:idcandid', {
        templateUrl: 'templates/unCandidat.html',
    });

}]);
