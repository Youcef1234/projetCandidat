app.controller('operationinsereUtilisateur', function($http, $scope,$location,$timeout){
    
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
            $scope.showmeCandid=false;
            $scope.hidemeCandid=false;
        }
    }

    $scope.insererComp=function(){
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/inserercomp.php",
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

    $scope.insererDip=function(){	
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/insererDip.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },

            data:{"diplome":$scope.nvdiplome},

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

    $scope.insererExpr=function(){	
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/insererExp.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },

            data:{"experience":$scope.nvexperience},

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

    $scope.insererLang=function(){	
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/insererLang.php",
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
            // Handle error
            console.warn("error etting data");
            console.log(response)
        });
    };

        $scope.insererInt=function(){  
        $http({
            method : "POST",
            url : "http://localhost/projetCandidat/database/insererInt.php",
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