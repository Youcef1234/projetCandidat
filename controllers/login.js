<<<<<<< HEAD
app.controller('loginController', function($scope,$http,$location,$cookies) {
  $scope.login=function() {
    if (!angular.isUndefined($scope.mdp) && !angular.isUndefined($scope.pseudo)) {
      datas={"login" :$scope.pseudo,"mdp":$scope.mdp};
      $http({
        method : "POST",
        url : "http://localhost/projetCandidat/database/login.php",
        headers: {
          'Accept': 'application/json, application/xml, text/plain, text/html, *.*',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        data:datas,
      }).then(function mySuccess(response) {

        if(angular.isDefined(response.data['mydb']['status']) ){

          $cookies.put("iduser",response.data['mydb']['idusers']);
          $cookies.put("pseudo",response.data['mydb']['login']);
          
          console.log($cookies.get("iduser"));
          console.log($cookies.get("pseudo"));
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
    //console.log("sors");
    $location.path('/login');
  };  
})
.controller('usernameController',function($scope,$http,$location,$cookies,$route) {
  $scope.username=$cookies.get("pseudo"); 
});
=======
app.controller('loginController', function($scope,$http,$location,$cookies) {
  $scope.login=function() {
    if (!angular.isUndefined($scope.mdp) && !angular.isUndefined($scope.pseudo)) {
      datas={"login" :$scope.pseudo,"mdp":$scope.mdp};
      $http({
        method : "POST",
        url : "http://localhost/ProjetCandidat/projetCandidat/backend/login.php",
        headers: {
          'Accept': 'application/json, application/xml, text/plain, text/html, *.*',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        data:datas,
      }).then(function mySuccess(response) {
            console.log(response.data.jwt)
        /*if(angular.isDefined(response.data['mydb']['status']) ){

          $cookies.put("iduser",response.data['mydb']['idusers']);
          $cookies.put("pseudo",response.data['mydb']['login']);
            $cookies.remove("pseudo");

         // console.log( $cookies.get("iduser"));
        //  console.log( $cookies.get("pseudo"));
          $location.path('/candidats');
        }
        else {
         //$scope.res1 = response.data['error'];

        }*/
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
    //console.log("sors");
    $location.path('/login');
  };  
})

.controller('usernameController',function($scope,$http,$location,$cookies,$route) {
  $scope.username=$cookies.get("pseudo"); 
});
>>>>>>> 8b99b031fa149ff017d8c9fd6639163a0322a1de
