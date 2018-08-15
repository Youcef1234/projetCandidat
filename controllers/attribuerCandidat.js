
app.controller('attrCompetences', function ($http, $scope,$routeParams) {

    $scope.attribuerNvComp=function() {
	    $http({
	        method : "POST",
	        url : "http://localhost/projetCandidat/database/attrCompetences.php",
	        headers: {
	            'Accept': '*.*',
	            'Content-Type': 'application/x-www-form-urlencoded'
	        },
	        data:{"competence":$scope.nvcompetence,"idcandid":$routeParams.idcandid},
	    }).then(function onSuccess(response ){

	    	console.log($scope.nvcompetence);
	    	if (!response.data.includes("error")) {
		        $scope.competencesAattribuer = response.data.mydb;
		        $scope.showmeAttrib=true;
		        $scope.hidemeAttrib=false;	   
		        $scope.lescompetences.push($scope.nvcompetence); 		
	    	}
	    	else{
				$scope.hidemeAttrib=true;
	        	$scope.showmeAttrib=false;
	    	}

	        console.log(response)

	    }).catch(function onError(response) {
	        console.warn("error getting data");
	       	$scope.hidemeAttrib=true;
	        $scope.showmeAttrib=false;

	        console.log(response)
	    });
	};

})
.controller('attrDiplome', function ($http, $scope,$routeParams) {

    $scope.attribuerNvDip=function() {
	    $http({
	        method : "POST",
	        url : "http://localhost/projetCandidat/database/attrDiplomes.php",
	        headers: {
	            'Accept': '*.*',
	            'Content-Type': 'application/x-www-form-urlencoded'
	        },
	        data:{"diplome":$scope.nvdiplome,"idcandid":$routeParams.idcandid},
	    }).then(function onSuccess(response ){

	    	if (!response.data.includes("error")) {
		        $scope.competencesAattribuer = response.data.mydb;
		        $scope.showmeAttribDiplome=true;
		        $scope.hidemeAttribDiplome=false;	   
		        $scope.lesdiplomes.push($scope.nvdiplome); 
		        $scope.nvdiplome="";		
	    	}
	    	else{
				$scope.hidemeAttribDiplome=true;
	        	$scope.showmeAttribDiplome=false;
	    	}

	        console.log(response)

	    }).catch(function onError(response) {
	        console.warn("error getting data");
			$scope.hidemeAttribDiplome=true;
        	$scope.showmeAttribDiplome=false;
	        console.log(response)
	    });
	};

})
.controller('attrLangue', function ($http, $scope,$routeParams) {

    $scope.attribuerNvLang=function() {
	    $http({
	        method : "POST",
	        url : "http://localhost/projetCandidat/database/attrLangues.php",
	        headers: {
	            'Accept': '*.*',
	            'Content-Type': 'application/x-www-form-urlencoded'
	        },
	        data:{"langue":$scope.nvlangue,"idcandid":$routeParams.idcandid},
	    }).then(function onSuccess(response ){

	    	if (!response.data.includes("error")) {
		        $scope.showmeAttribLangue=true;
		        $scope.hidemeAttribLangue=false;	   
		        $scope.leslangues.push($scope.nvlangue); 
		        $scope.nvlangue="";		
	    	}
	    	else{
				$scope.hidemeAttribLangue=true;
	        	$scope.showmeAttribLangue=false;
	    	}

	        console.log(response)

	    }).catch(function onError(response) {
	        console.warn("error getting data");
			$scope.hidemeAttribLangue=true;
        	$scope.showmeAttribLangue=false;
	        console.log(response)
	    });
	};

})
.controller('attrExperience', function ($http, $scope,$routeParams) {

    $scope.attribuerNvExper=function() {
	    $http({
	        method : "POST",
	        url : "http://localhost/projetCandidat/database/attrExperiences.php",
	        headers: {
	            'Accept': '*.*',
	            'Content-Type': 'application/x-www-form-urlencoded'
	        },
	        data:{"experience":$scope.nvexperience,"idcandid":$routeParams.idcandid},
	    }).then(function onSuccess(response ){

	    	if (!response.data.includes("error")) {
		        $scope.showmeAttribExper=true;
		        $scope.hidemeAttribExper=false;	   
		        $scope.lesexperiences.push($scope.nvexperience); 
		        $scope.nvexperience="";		
	    	}
	    	else{
				$scope.hidemeAttribExper=true;
	        	$scope.showmeAttribExper=false;
	    	}

	        console.log(response)

	    }).catch(function onError(response) {
	        console.warn("error getting data");
			$scope.hidemeAttribExper=true;
        	$scope.showmeAttribExper=false;
	        console.log(response)
	    });
	};

})
.controller('attrInteret', function ($http, $scope,$routeParams) {

    $scope.attribuerNvInter=function() {
	    $http({
	        method : "POST",
	        url : "http://localhost/projetCandidat/database/attrInteret.php",
	        headers: {
	            'Accept': '*.*',
	            'Content-Type': 'application/x-www-form-urlencoded'
	        },
	        data:{"interet":$scope.nvinteret,"idcandid":$routeParams.idcandid},
	    }).then(function onSuccess(response ){

	    	if (!response.data.includes("error")) {
		        $scope.showmeAttribInt=true;
		        $scope.hidemeAttribInt=false;	   
		        $scope.lesinterets.push($scope.nvinteret); 
		        $scope.nvinteret="";		
	    	}
	    	else{
				$scope.hidemeAttribInt=true;
	        	$scope.showmeAttribInt=false;
	    	}

	        console.log(response)

	    }).catch(function onError(response) {
	        console.warn("error getting data");
			$scope.hidemeAttribInt=true;
        	$scope.showmeAttribInt=false;
	        console.log(response)
	    });
	};

});
