var app = angular.module('ion-pie', ['nvd3']);

app.controller('nilai2011', function($scope) {
  $scope.options = {
    chart: {
      title: "Nilai",
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: true,
      donut: true,
      duration: 500,
      labelThreshold: 0.01,
      labelType: "percent",
      labelSunbeamLayout: true,
      legend: {
        margin: {
          top: 5,
          right: 35,
          bottom: 5,
          left: 0
        }
      }
    }
  };

  $scope.data = [
    { key: "cluster k1", y: 11396878 },
    { key: "cluster k2", y: 22762244 },
    { key: "cluster k3", y: 12317751 }
  ];
})

.controller('nilai2012', function($scope) {
  $scope.options = {
    chart: {
      title: "Nilai",
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: true,
      donut: true,
      duration: 500,
      labelThreshold: 0.01,
      labelType: "percent",
      labelSunbeamLayout: true,
      legend: {
        margin: {
          top: 5,
          right: 35,
          bottom: 5,
          left: 0
        }
      }
    }
  };

  $scope.data = [
    { key: "cluster k1", y: 11395477 },
    { key: "cluster k2", y: 24443329 },
    { key: "cluster k3", y: 12414053 }
  ];
})

.controller('volume2011', function($scope) {
  $scope.options = {
    chart: {
      title: "Volume",
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: true,
      donut: true,
      duration: 500,
      labelThreshold: 0.01,
      labelType: "percent",
      labelSunbeamLayout: true,
      legend: {
        margin: {
          top: 5,
          right: 35,
          bottom: 5,
          left: 0
        }
      }
    }
  };

  $scope.data = [
    { key: "cluster k1", y: 5888850 },
    { key: "cluster k2", y: 1747219 },
    { key: "cluster k3", y: 4695294 }
  ];
})

.controller('volume2012', function($scope) {
  $scope.options = {
    chart: {
      title: "Volume",
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: true,
      donut: true,
      duration: 500,
      labelThreshold: 0.01,
      labelType: "percent",
      labelSunbeamLayout: true,
      legend: {
        margin: {
          top: 5,
          right: 35,
          bottom: 5,
          left: 0
        }
      }
    }
  };

  $scope.data = [
    { key: "cluster k1", y: 5340791 },
    { key: "cluster k2", y: 1875587 },
    { key: "cluster k3", y: 4912813 }
  ];
});
