angular.module('bolo.controllers', [])

.controller('AppCtrl', function($scope, $ionicModal, $timeout, $ionicHistory) {

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
    console.log('Doing login', $scope.loginData);

    $timeout(function() {
      $scope.closeLogin();
    }, 1000);
  };
})

.controller('ReservationsCtrl', function($scope) {
  if (window.localStorage.getItem('uid') === null)
      $scope.modal.show();
})

.controller('ListingCtrl', function($scope, $stateParams, $http, $ionicModal) {
  $http.get("http://localhost:5000/api/getListing?listing_id=" + $stateParams.listingId).then(function(response){
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

  // $ionicModal.fromTemplateUrl('templates/book.html', {
  //   scope: $scope,
  //   animation: 'slide-in-up'
  // }).then(function(modal) {
  //   $scope.modal = modal;
  // });

  // $scope.closeLogin = function() {
  //   $scope.modal.hide();
  //   $ionicHistory.backView().go();
  // };

  // $scope.login = function() {
  //   $scope.modal.show();
  // };
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
