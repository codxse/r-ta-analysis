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
      color: d3.scale.category10().range(),
      scatter: {
        onlyCircles: false
      },
      showDistX: true,
      showDistY: true,
      duration: 350,
      xAxis: {
        axisLabel: 'Pertumbuhan Jakarta (%)',
        tickFormat: function(d){
          return d3.format('.02f')(d);
        },
        axisLabelDistance: 10
      },
      yAxis: {
        axisLabel: 'Pertumbuhan Nasional (%)',
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
      "intercept": -0.9794,
      "slope": 1.1119,
      "values": [
        { "series": 0, "shape": "circle", "size": 1, "x": 5.95, "y": 5.5 },
        { "series": 0, "shape": "circle", "size": 1, "x": 6.44, "y": 6.35 },
        { "series": 0, "shape": "circle", "size": 1, "x": 6.23, "y": 6.01 },
        { "series": 0, "shape": "circle", "size": 1, "x": 5.02, "y": 4.63 },
        { "series": 0, "shape": "circle", "size": 1, "x": 6.5, "y": 6.2 },
        { "series": 0, "shape": "circle", "size": 1, "x": 6.73, "y": 6.48 },
        { "series": 0, "shape": "circle", "size": 1, "x": 6.53, "y": 6.23 }
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
