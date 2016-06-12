var app = angular.module('ion-sttr', ['nvd3']);

app.controller('sttr', function($scope) {
  $scope.options = {
    chart: {
      type: 'scatterChart',
      height: 450,
      margin: {
        top: 50,
        right: 15,
        bottom: 50,
        left: 60
      },
      showLegend: true,
      // forceY: [10, 40],
      // forceX: [50, 120],
      color: d3.scale.category10().range(),
      scatter: {
        onlyCircles: false
      },
      showDistX: true,
      showDistY: true,
      duration: 350,
      xAxis: {
        axisLabel: 'Inflasi Jakarta (%)',
        tickFormat: function(d){
          return d3.format('.0f')(d);
        },
        axisLabelDistance: 10
      },
      yAxis: {
        axisLabel: 'Inflasi Nasional (%)',
        tickFormat: function(d){
          return d3.format('.02f')(d);
        },
        axisLabelDistance: 0
      },
      zoom: {
        //NOTE: All attributes below are optional
        enabled: true,
        scaleExtent: [1, 10],
        useFixedDomain: true,
        useNiceScale: true,
        horizontalOff: true,
        verticalOff: false,
        unzoomEventType: 'dblclick.zoom'
      }
    }
  };

  $scope.data = [
    {
      "key": "Cluster k1",
      "values": [
        { "series": 0, "shape": "circle", "size": 1, "x": 96.69, "y": 2017.79 },
        { "series": 0, "shape": "circle", "size": 1, "x": 541.72, "y": 2240.81 },
        { "series": 0, "shape": "circle", "size": 1, "x": 215824.4, "y": 634642.96 },
        { "series": 0, "shape": "circle", "size": 1, "x": 22641.07, "y": 173889.71 },
        { "series": 0, "shape": "circle", "size": 1, "x": 4831.93, "y": 5980.08 },
        { "series": 0, "shape": "circle", "size": 1, "x": 7551.11, "y": 12105.66 },
        { "series": 0, "shape": "circle", "size": 1, "x": 23887.25, "y": 18848.08 }
      ]
    },
    {
      "key": "Cluster k2",
      "values": [
        { "series": 0, "shape": "circle", "size": 1, "x": 55.98, "y": 15.33 },
        { "series": 0, "shape": "circle", "size": 1, "x": 62.49, "y": 17.5 },
        { "series": 0, "shape": "circle", "size": 1, "x": 74.16, "y": 21.7 },
        { "series": 0, "shape": "circle", "size": 1, "x": 82.15, "y": 23.9 },
        { "series": 0, "shape": "circle", "size": 1, "x": 89.72, "y": 27.1 },
        { "series": 0, "shape": "circle", "size": 1, "x": 100.98, "y": 30.4 },
        { "series": 0, "shape": "circle", "size": 1, "x": 110.46, "y": 33.3 }
      ]
    },
    {
      "key": "Cluster k3",
      "values": [
        { "series": 0, "shape": "circle", "size": 1, "x": 55.98, "y": 15.33 },
        { "series": 0, "shape": "circle", "size": 1, "x": 62.49, "y": 17.5 },
        { "series": 0, "shape": "circle", "size": 1, "x": 74.16, "y": 21.7 },
        { "series": 0, "shape": "circle", "size": 1, "x": 82.15, "y": 23.9 },
        { "series": 0, "shape": "circle", "size": 1, "x": 89.72, "y": 27.1 },
        { "series": 0, "shape": "circle", "size": 1, "x": 100.98, "y": 30.4 },
        { "series": 0, "shape": "circle", "size": 1, "x": 110.46, "y": 33.3 }
      ]
    }
  ];
  console.log($scope.data);
});
