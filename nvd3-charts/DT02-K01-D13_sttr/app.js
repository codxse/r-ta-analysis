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
      showLegend: false,
      forceY: [10, 40],
      forceX: [50, 120],
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

  // $scope.data = generateData(1, 10);
  $scope.data = [
    {
      "intercept": -3.1573,
      "slope": 0.3322,
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
