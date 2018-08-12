app.controller('operationsupprimerUtilisateur', function($http, $scope,$location,$timeout){
    
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
            $scope.hidemeDip=false;
            $scope.hidemeLang=false;
            $scope.showmeDip=false;
            $scope.showmeLang=false;
            $scope.hidemeLang=false;
            $scope.showmeCandid=false;
            $scope.hidemeCandid=false;
            $scope.showmeInt=false;
            $scope.hidemeInt=false;
            $scope.showmeExpr=false;
            $scope.hidemeExpr=false;
        }
    }

    $scope.supprimerComp=function(){
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/supprimercomp.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },

            data:{"competence":$scope.competence},
        }).then(function onSuccess(response ) {
            console.log(response)
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
            console.warn("error etting data");
            console.log(response)
        });
    };

    $scope.supprimerDip=function(){	
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/supprimerDip.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },

            data:{"diplome":$scope.diplome},

        }).then(function onSuccess(response ) {
            console.log(response)
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
            console.warn("error etting data");
            console.log(response)
        });
    };

    $scope.supprimerExpr=function(){	
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/supprimerExpr.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },

            data:{"experience":$scope.experience},

        }).then(function onSuccess(response ) {
            console.log(response)
            if(!response.data.includes("error")){
                $scope.showmeExpr=true;
                $scope.hidemeExpr=false;
                $timeout(timer, 1000);       
            }
            else{
                $scope.hidemeExpr=true;
                $scope.showmeExpr=false;
            }
        }).catch(function onError(response) {
            // Handle error
            console.warn("error etting data");
            console.log(response)
        });
    };

    $scope.supprimerLang=function(){    
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/supprimerLang.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            data:{"langue":$scope.langue},

        }).then(function onSuccess(response ) {
            console.log(response)
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
            console.warn("error etting data");
            console.log(response)
        });
    };
    $scope.supprimerInt=function(){    
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/supprimerInt.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            data:{"interet":$scope.interet},

        }).then(function onSuccess(response ) {
            console.log(response)
            if(!response.data.includes("error")){
                $scope.showmeInt=true;
                $scope.hidemeInt=false;
                $timeout(timer, 1000);       
            }
            else{
                $scope.hidemeInt=true;
                $scope.showmeInt=false;
            }
        }).catch(function onError(response) {
            console.warn("error etting data");
            console.log(response)
        });
    };
});