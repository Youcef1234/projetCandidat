
app.controller('loginController', function($scope,$http,$location,$cookies) {
  $scope.login=function() {
    if (!angular.isUndefined($scope.mdp) && !angular.isUndefined($scope.pseudo)) {
      datas={"login" :$scope.pseudo,"mdp":$scope.mdp};
      $http({
        method : "POST",
        url : "http://localhost/projetCandidat/ProjetCandidat/backend/login.php",
        headers: {
          'Accept': 'application/json, application/xml, text/plain, text/html, *.*',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        data:datas,
      }).then(function mySuccess(response) {
            console.log(response.data.jwt)
            //console.log(response.data.idusers)
            //console.log(response.data.login)

        if(angular.isDefined(response.data['status']) ){

          	$cookies.put("iduser",response.data.idusers);
          	$cookies.put("pseudo",response.data.login);
          	$cookies.put("letoken",response.data.jwt);

			$location.path('/candidats');
        }
        else {
         //$scope.res1 = response.data['error'];

        }
      });
    }
    else{
      $scope.res="inserer qq chose";
    }
  };
})
.controller('logOutController',function($scope,$http,$location,$cookies,$route) {
  $scope.username=$cookies.get("pseudo");
  $scope.logout=function() {
    $cookies.remove('pseudo');
    $cookies.remove('iduser');
    $cookies.remove('letoken');

    //console.log("sors");
    $location.path('/login');
  };  
})

.controller('usernameController',function($scope,$http,$location,$cookies,$route) {
  $scope.username=$cookies.get("pseudo"); 
});
