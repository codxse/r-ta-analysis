var app = angular.module('ion-pie', ['nvd3']);

app.controller('pie-chart', function($scope) {
  $scope.options = {
    chart: {
      title: "Nilai",
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: true,
      donut: false,
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
    { key: "Umum", y: 134 },
    { key: "Bukan Makanan", y: 236 },
    { key: "Makanan jadi, Minuman, Rokok dan tembakau", y: 217 },
    { key: "Perumahan, Air, Listrik, Gas, dan Bahan bakar", y: 97 },
    { key: "Sandang", y: 199 },
    { key: "Kesehatan", y: 72 },
    { key: "Pendidikan, Rekreasi dan Olah Raga", y: 6 },
    { key: "Transportasi, Komunikasi dan Jasa Keuangan", y: 49 }
  ];
});
