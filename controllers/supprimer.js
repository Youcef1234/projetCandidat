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
            url : "http://localhost/ProjetCandidat/projetCandidat/backend/supprimercomp.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },

            data:{"competence":$scope.competence},
        }).then(function onSuccess(response ) {
            console.log(response)
            if(!response.data.includes("error")){
                var index= $scope.lescompetences.indexOf($scope.competence);
                $scope.lescompetences.splice(index,1);
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
            url : "http://localhost/ProjetCandidat/projetCandidat/backend/supprimerDip.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },

            data:{"diplome":$scope.diplome},

        }).then(function onSuccess(response ) {
            console.log(response)
            if(!response.data.includes("error")){
                var index= $scope.lesdiplomes.indexOf($scope.diplome);
                $scope.lesdiplomes.splice(index,1);
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
            url : "http://localhost/ProjetCandidat/projetCandidat/backend/supprimerExpr.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },

            data:{"experience":$scope.experience},

        }).then(function onSuccess(response ) {
            console.log(response)
            if(!response.data.includes("error")){

                var index=$scope.lesexperiences.indexOf($scope.experience);
                $scope.lesexperiences.splice(index,1);
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
            url : "http://localhost/ProjetCandidat/projetCandidat/backend/supprimerLang.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            data:{"langue":$scope.langue},

        }).then(function onSuccess(response ) {
            console.log(response)
            if(!response.data.includes("error")){
                var index=$scope.leslangues.indexOf($scope.langue);
                $scope.leslangues.splice(index,1);
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
            url : "http://localhost/ProjetCandidat/projetCandidat/backend/supprimerInt.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            data:{"interet":$scope.interet},

        }).then(function onSuccess(response ) {
            console.log(response)
            if(!response.data.includes("error")){
                var index=$scope.lesinterets.indexOf($scope.interet);
                $scope.lesinterets.splice(index,1);
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
    $scope.supprimerCandidat=function(){    
        $http({
            method : "POST",
            url : "http://localhost/ProjetCandidat/projetCandidat/backend/supprimerCandid.php",
            headers: {
                'Accept': '*.*',
                'Content-Type': 'application/x-www-form-urlencoded'
            },
            data:{"candidat":$scope.Candidat},

        }).then(function onSuccess(response ) {
            console.log(response)
            if(!response.data.includes("error")){
                var index=$scope.lescandidats.indexOf($scope.Candidat);
                $scope.lescandidats.splice(index,1);
                $scope.showmeCandid=true;
                $scope.hidemeCandid=false;
                $timeout(timer, 1000);       
            }
            else{
                $scope.hidemeCandid=true;
                $scope.showmeCandid=false;
            }
        }).catch(function onError(response) {
            console.warn("error etting data");
            console.log(response)
        });
    };
});