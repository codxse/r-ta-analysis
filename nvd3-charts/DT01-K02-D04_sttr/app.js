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
      forceY: [0, 12],
      forceX: [0, 12],
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
          return d3.format('.02f')(d);
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
      "intercept": 0.3296,
      "slope": 0.9889,
      "values": [
        { "series": 0, "shape": "circle", "size": 1, "x": 6.03, "y": 6.6 },
        { "series": 0, "shape": "circle", "size": 1, "x": 6.04, "y": 6.59 },
        { "series": 0, "shape": "circle", "size": 1, "x": 11.11, "y": 11.06 },
        { "series": 0, "shape": "circle", "size": 1, "x": 2.34, "y": 2.78 },
        { "series": 0, "shape": "circle", "size": 1, "x": 6.21, "y": 6.96 },
        { "series": 0, "shape": "circle", "size": 1, "x": 3.97, "y": 3.79 },
        { "series": 0, "shape": "circle", "size": 1, "x": 4.52, "y": 4.3 }
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
