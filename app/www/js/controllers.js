API_URL = 'http://localhost:5000';

angular.module('bolo.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout, $ionicHistory, $ionicPopup, $http) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

  // Form data for the login modal
  $scope.loginData = {};

  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope,
    animation: 'slide-in-up'
  }).then(function(modal) {
    $scope.modal = modal;
  });

  $scope.closeLogin = function() {
    $scope.modal.hide();
    $ionicHistory.backView().go();
  };

  $scope.login = function() {
    $scope.modal.show();
  };

  $scope.doLogin = function() {
    $http({
      method: 'POST',
      url: API_URL + '/api/login',
      data: {
        email: $scope.loginData.email,
        password: $scope.loginData.password
      },
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      transformRequest: function(obj) {
        var str = [];
        for(var p in obj)
        str.push(encodeURIComponent(p) + "=" + encodeURIComponent(obj[p]));
        return str.join("&");
      }
    }).then(function successCallback(response) {
      console.log(response)
      if (response.data === '') {
        $scope.showLoginFailedAlert = function() {
          var alertPopup = $ionicPopup.alert({
            title: 'Login Failed',
            template: 'Email/password is incorrect.'
          });
        };

        $scope.showLoginFailedAlert();
      } else {
        window.localStorage.setItem('uid', response.data.uid);
        window.localStorage.setItem('first_name', response.data.first_name);
        window.localStorage.setItem('last_name', response.data.last_name);
        $scope.modal.hide();
      }
    }, function errorCallback(response) {
      console.log(JSON.stringify(response));
    });
  };
})

.controller('ReservationsCtrl', function($scope) {
  if (window.localStorage.getItem('uid') === null || window.localStorage.getItem('uid') === '')
      $scope.modal.show();
})

.controller('ListingCtrl', function($scope, $stateParams, $http, $ionicModal) {
  $http.get(API_URL + '/api/getListing?listing_id=' + $stateParams.listingId).then(function(response){
    $scope.listingData = response.data;
    $scope.amenities = [];
    for (var i in response.data.amenities) {
      if (response.data.amenities[i]) {
        var icon;
        switch (i) {
          case 'reception':
            icon = 'ion-clipboard';
            break;
          case 'telephone':
            icon = 'ion-ios-telephone';
            break;
          case 'white_board':
            icon = 'ion-edit';
            break;
          case 'parking':
            icon = 'ion-model-s';
            break;
          case 'projector':
            icon = 'ion-ios-videocam';
            break;
          case 'wifi':
            icon = 'ion-wifi';
            break;
          case 'refreshment':
            icon = 'ion-coffee';
            break;
          case 'speaker':
            icon = 'ion-volume-medium';
            break;
          case 'vending_machine':
            icon = 'ion-pizza';
            break;
          case 'fax_machine':
            icon = 'ion-printer';
            break;
          case 'ethernet':
            icon = 'ion-code-working';
            break;
        }
        $scope.amenities.push({
          'name': i,
          'icon': icon
        })
      }
    }
  });

  // Reserve Modal
  $ionicModal.fromTemplateUrl('templates/reserve.html', {
    id: '1',
    scope: $scope,
    animation: 'slide-in-up'
  }).then(function(modal) {
    $scope.reserveModal = modal;
  });

  $scope.closeReserve = function() {
    $scope.modal.hide();
  };

  $scope.showReserve = function() {
    $scope.modal.show();
  };

  $scope.reserve = function() {
    if (window.localStorage.getItem('uid') === null || window.localStorage.getItem('uid') === '')
      $scope.loginModal.show();
  };
})

.controller('PlaylistsCtrl', function($scope) {
  $scope.playlists = [
    { title: 'Reggae', id: 1 },
    { title: 'Chill', id: 2 },
    { title: 'Dubstep', id: 3 },
    { title: 'Indie', id: 4 },
    { title: 'Rap', id: 5 },
    { title: 'Cowbell', id: 6 }
  ];
})

.controller('PlaylistCtrl', function($scope, $stateParams) {
});