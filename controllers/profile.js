app.controller('profileController', function($scope,$http,$location,$cookies) {

	$scope.validerModif=function() {
		datas={"user":$scope.userProfile,"confmdp":$scope.confmdp };
		$http({
			method : "POST",
			url : "http://localhost/projetCandidat/database/updateprofile.php",
			headers: {
			  'Accept': 'application/json, application/xml, text/plain, text/html, *.*',
			  'Content-Type': 'application/x-www-form-urlencoded'
			},
			data:datas,
		}).then(function mySuccess(response) {
		    if((!response.data.includes("error")) ){
     			console.log("ca marche");
     			$scope.showmeProfile=true;
     			$scope.hidemeProfile=true;
		    }
		    else{
     			console.log("ca ne marche pas");

		    }
		});
	}; 
  	$scope.charger=function() {
  		datas={"id_user":$cookies.get("iduser")} ;
		$http({
		    method : "POST",
		    url : "http://localhost/projetCandidat/database/profile.php",
		    headers: {
		      'Accept': 'application/json, application/xml, text/plain, text/html, *.*',
		      'Content-Type': 'application/x-www-form-urlencoded'
		    },
	    	data:datas,
		}).then(function mySuccess(response) {
			//console.log(response.data['mydb']['status']);
		    if( angular.isDefined(response.data['mydb']['status']) ){
     			console.log("ca marche");
		    	$scope.userProfile=response.data['mydb'];
            }
            else{
            	console.log("ca ne marche pas");
            }
  		});
  	};
});