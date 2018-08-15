
app.controller('attrCompetences', function ($http, $scope,$routeParams) {
    $scope.chargercomp=function() {
	    $http({
	        method : "GET",
	        url : "http://localhost/projetCandidat/database/competencesNonAttr.php",
	        headers: {
	            'Accept': '*.*',
	            'Content-Type': 'application/json'
	        },
	        params:{"idcandid":$routeParams.idcandid},
	    }).then(function onSuccess(response ) {
	        $scope.competencesAattribuer = response.data.mydb;
	        console.log(response)

	    }).catch(function onError(response) {
	        console.warn("error getting data");
	        console.log(response)
	    });
	};

	$scope.attriberComp=function() {
		console.log($scope.lacompAttr);
	/*
		$http({
			method:"POST"
	        url : "http://localhost/projetCandidat/database/attrCompetences.php",
	        headers:{
	        	'Accept':'*.*',
	            'Content-Type': 'application/json'	
	        },
	        datas:{"idcandid":$routeParams.idcandid,"idcompetence":}
		})
		.then(function(argument) {
		})
		.catch(function () {
			
		});*/
	};

})