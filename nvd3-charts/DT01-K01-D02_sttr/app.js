var app = angular.module('ion-sttr', ['nvd3']);

app.controller('sttr', function($scope) {
  $scope.options = {
    chart: {
      type: 'scatterChart',
      height: 450,
      margin: {
        top: 50,
        right: 15,
        bottom: 90,
        left: 90
      },
      showLegend: false,
      forceY: [-10, 50],
      forceX: [0, 12],
      color: d3.scale.category10().range(),
      scatter: {
        onlyCircles: false
      },
      showDistX: true,
      showDistY: true,
      duration: 350,
      xAxis: {
        axisLabel: 'Inflasi (%)',
        tickFormat: function(d){
          return d3.format('.02f')(d);
        }
      },
      yAxis: {
        axisLabel: 'Kenaikan UMP (%)',
        axisLabelDistance: -50,
        tickFormat: function(d){
          return d3.format('.02f')(d);
        },
        axisLabelDistance: 30
      },
      zoom: {
        //NOTE: All attributes below are optional
        enabled: false,
        scaleExtent: [1, 10],
        useFixedDomain: true,
        useNiceScale: true,
        horizontalOff: true,
        verticalOff: false,
        unzoomEventType: 'dblclick.zoom'
      }
    }
  };

  // $scope.data = generateData(1, 10);
  $scope.data = [
    {
      "color": "#1f77b4",
      "intercept": 6.637,
      "slope": 1.835,
      "values": [
        { "series": 0, "shape": "circle", "size": 1, "x": 1.77, "y": 16.37 },
        { "series": 0, "shape": "circle", "size": 1, "x": 10.29, "y": 49.03 },
        { "series": 0, "shape": "circle", "size": 1, "x": 11.62, "y": 23.82 },
        { "series": 0, "shape": "circle", "size": 1, "x": 9.08, "y": 37.71 },
        { "series": 0, "shape": "circle", "size": 1, "x": 5.78, "y": 6.81 },
        { "series": 0, "shape": "circle", "size": 1, "x": 5.87, "y": 6.33 },
        { "series": 0, "shape": "circle", "size": 1, "x": 6.03, "y": 15.07 },
        { "series": 0, "shape": "circle", "size": 1, "x": 6.04, "y": 9.95 },
        { "series": 0, "shape": "circle", "size": 1, "x": 11.11, "y": 8 },
        { "series": 0, "shape": "circle", "size": 1, "x": 2.34, "y": 10 },
        { "series": 0, "shape": "circle", "size": 1, "x": 5.95, "y": 11.04 },
        { "series": 0, "shape": "circle", "size": 1, "x": 3.97, "y": 8.58 },
        { "series": 0, "shape": "circle", "size": 1, "x": 4.52, "y": 18.54 },
        { "series": 0, "shape": "circle", "size": 1, "x": 5.67, "y": 43.87 },
        { "series": 0, "shape": "circle", "size": 1, "x": 6.15, "y": 10.96 },
      ]
    }
  ];

  //generateData(4,40);

  /* Random Data Generator (took from nvd3.org) */
  function generateData(groups, points) { //# groups,# points per group
    var data = [],
    shapes = ['circle'],
    random = d3.random.normal();

    for (var i = 0; i < groups; i++) {
      data.push({
        key: 'Group ' + i,
        values: [],
        slope: Math.random() - .01,
        intercept: Math.random() - .5
      });

      for (var j = 0; j < points; j++) {
        data[i].values.push({
          x: random(),
          y: random(),
          size: Math.random(),
          shape: shapes[j % 6]
        });
      }
    }
    return data;
  }
  console.log($scope.data);
});
