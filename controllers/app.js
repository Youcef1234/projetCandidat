
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
        console.warn("error getting data");
        console.log(response)
    });
})
.controller('diplomes', function ($http, $scope,$routeParams) {
    $http({
        method : "GET",
        url : "http://localhost/projetCandidat/database/selectDiplomes.php",
        headers: {
            'Accept': '*.*',
            'Content-Type': 'application/json'
        },
        params:{"idcandid":$routeParams.idcandid},
    }).then(function onSuccess(response) {
        $scope.lesdiplomes = response.data.mydb;
        console.log(response)
    }).catch(function onError(response) {
        console.warn("error getting data");
        console.log(response)
    });
})
.controller('langues', function ($http, $scope,$routeParams) {
    $http({
        method : "GET",
        url : "http://localhost/projetCandidat/database/selectLangues.php",
        headers: {
            'Accept': '*.*',
            'Content-Type': 'application/json'
        },
        params:{"idcandid":$routeParams.idcandid},
    }).then(function onSuccess(response) {
        $scope.leslangues = response.data.mydb;
        console.log(response)
    }).catch(function onError(response) {
        console.warn("error getting data");
        console.log(response)
    });
})
.controller('operationUtilisateur', function($http, $scope,$location,$timeout){
    $timeout( function(){
        $scope.test1 = "Hello World!";
    }, 5000 );

    var time = 0;
    var timer = function() {
        if( time < 5000 ) {
            time += 1000;
            $timeout(timer, 1000);
        }
        else{
            console.log(time);
            $scope.hideme=false;
            $scope.showme=false;
        }
    }
        
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
                'Content-Type': 'application/x-www-form-urlencoded'
            },

            data:{"candidat":$scope.Candidat},

        }).then(function onSuccess(response ) {
            $scope.Candidat = response.data.Candidat;
            console.log(response)
        }).catch(function onError(response) {
            // Handle error
            console.warn("error etting data");
            console.log(response)
        });
    };
    $scope.modifierComp=function(){
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/updateComp.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },

            data:{"competence":$scope.competence},

        }).then(function onSuccess(response ) {
            console.log(response.data);
            if(!response.data.includes("error")){
                $scope.showme=true;
                $scope.hideme=false;
                $timeout(timer, 1000);       

            }
            else{
                $scope.hideme=true;
                $scope.showme=false;

            }
        }).catch(function onError(response) {
            // Handle error
            console.warn("error update");
            $scope.hideme=true;

        });
    };
    $scope.modifierDip=function(){
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/updateDip.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },

            data:{"diplome":$scope.diplome},

        }).then(function onSuccess(response ) {
            console.log(response.data);
            if(!response.data.includes("error")){
                $scope.showmeDip=true;
                $scope.hidemeDip=false;
                $timeout(timer, 1000);       

            }
            else{
                $scope.hidemeDip=true;
                $scope.showmeDip=false;

            }
        }).catch(function onError(response) {
            // Handle error
            console.warn("error update");
            $scope.hidemeDip=true;

        });
    };

    $scope.modifierLang=function(){
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/updateLang.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },

            data:{"langue":$scope.langue},

        }).then(function onSuccess(response ) {
            console.log(response.data);
            if(!response.data.includes("error")){
                $scope.showmeLang=true;
                $scope.hidemeLang=false;
                $timeout(timer, 1000);       

            }
            else{
                $scope.hidemeLang=true;
                $scope.showmeLang=false;

            }
        }).catch(function onError(response) {
            // Handle error
            console.warn("error update");
            $scope.hidemeLang=true;

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