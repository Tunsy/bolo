API_URL = 'http://localhost:5000';

angular.module('bolo.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $rootScope, $timeout, $ionicHistory, $ionicPlatform, $ionicPopup, $http, $cordovaGeolocation) {

  // With the new view caching in Ionic, Controllers are only called
  // when they are recreated or on app start, instead of every page change.
  // To listen for when this page is active (for example, to refresh data),
  // listen for the $ionicView.enter event:
  //$scope.$on('$ionicView.enter', function(e) {
  //});

  var loadReservations = function() {
    $http.get(API_URL + '/api/getReservations?uid=' + window.localStorage.getItem('uid')).then(function(response) {
      $scope.reservations = response.data;
      $scope.reservations.forEach(function(r) {
        var start = new Date(r.start_datetime);
        var end = new Date(r.end_datetime);
        r.date = start.toDateString() + ' ' + start.toLocaleTimeString()
      })
    })
  }

  if (window.localStorage.getItem('uid') !== null && window.localStorage.getItem('uid') !== '') {
    loadReservations();
  }

  // Form data for the login modal
  $scope.loginData = {};

  $ionicModal.fromTemplateUrl('templates/login.html', {
    scope: $scope,
    animation: 'slide-in-up'
  }).then(function(modal) {
    $scope.loginModal = modal;
  });

  $scope.closeLogin = function() {
    $scope.loginModal.hide();
    if ($ionicHistory.currentView().title === 'Reservations')
      $ionicHistory.backView().go();
  };

  $scope.showLogin = function() {
    $scope.loginModal.show();
  };

  // Reserve Modal
  $ionicModal.fromTemplateUrl('templates/reserve.html', {
    scope: $scope,
    animation: 'slide-in-up'
  }).then(function(modal) {
    $scope.reserveModal = modal;
  });

  $scope.closeReserve = function() {
    $scope.reserveModal.hide();
  };

  $scope.showReserve = function() {
    if (window.localStorage.getItem('uid') === null || window.localStorage.getItem('uid') === '') {
      $scope.loginModal.show();
    } else
    $scope.reserveModal.show();
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
        loadReservations();
        $scope.loginModal.hide();
        if ($ionicHistory.currentView().title === 'Listing')
          $scope.showReserve();
      }
    }, function errorCallback(response) {
      console.log(JSON.stringify(response));
    });
  };

  $scope.reserve = function() {
    
  };

  $ionicPlatform.ready(function() {
    $cordovaGeolocation.getCurrentPosition().then(function(position) {
      var lat = position.coords.latitude;
      var lng = position.coords.longitude;

      $http.get('https://maps.googleapis.com/maps/api/geocode/json?latlng=' + lat + ',' + lng + '&key=AIzaSyBqvzDwbqKXjOPIztIAE7pg2U_q3sjSWGY').then(function(response) {
        $scope.currentLocation = response.data.results[1].formatted_address;
      })
    }, function(err) {
      console.err(err);
    })
  });
})

.controller('ReservationsCtrl', function($scope) {
  if (window.localStorage.getItem('uid') === null || window.localStorage.getItem('uid') === '') {
    $scope.showLogin();
  }
})

.controller('ListingCtrl', function($scope, $stateParams, $rootScope, $http, $ionicModal) {
  $http.get(API_URL + '/api/getListing?listing_id=' + $stateParams.listingId).then(function(response){
    $scope.listingData = response.data;
    $rootScope.listingData = response.data;
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
});