//Selectionner data dans la BDD


var app = angular.module("myapp", []);

app.controller('listeCandidats', function ($http, $scope) {
   /* $http.get("http://localhost/Projet31juillet/database/Select.php")

        .then(function (response) {
            $scope.lescandidats = "je vous aime";
        })
        .then(function (error) {
            console.log('');
        });
*/
    $http({
        method : "GET",
        url : "http://localhost/Projet31juillet1/database/Select.php",
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

});

app.config(['$qProvider', function ($qProvider) {
    $qProvider.errorOnUnhandledRejections(false);
}]);

