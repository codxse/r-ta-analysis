var app = angular.module('ion-line', ['nvd3']);

app.controller('line-d2', function($scope) {
 $scope.options = {
  chart: {
    type: 'linePlusBarChart',
    height: 500,
    margin: {
      top: 50,
      right: 50,
      bottom: 50,
      left: 61
    },
    showLegend: true,
    bars: {
      forceY: [0]
    },
    legendLeftAxisHint: " (Kiri: Rp)",
    legendRightAxisHint: " (Kanan: %)",
    bars2: {
      forceY: [0]
    },
    x: function(d,i) { return i },
    xAxis: {
      axisLabel: 'X Axis',
      tickFormat: function(d) {
        var dx = $scope.data[0].values[d] && $scope.data[0].values[d].x || 0;
        if (dx > 0) {
          return d3.time.format('%Y')(new Date(dx))
        }
        return null;
      }
    },
    x2Axis: {
      tickFormat: function(d) {
        var dx = $scope.data[0].values[d] && $scope.data[0].values[d].x || 0;
        return d3.time.format('%Y')(new Date(dx))
      },
      showMaxMin: false
    },
    y1Axis: {
      axisLabel: '%',
      tickFormat: function(d) {
        var prefix = d3.formatPrefix(d);
        return prefix.scale(d) + prefix.symbol;
      },
      axisLabelDistance: 12
    },
    y2Axis: {
      axisLabel: 'Rp',
      tickFormat: function(d) {
        var prefix = d3.formatPrefix(d);
        return prefix.scale(d) + prefix.symbol;
      }
    }
  }
};

$scope.data = [
{
  "key" : "UMP",
  "bar" : true,
  "color": "#999999",
  "values" : 
  [
  [852076800000, 172500],
  [883612800000, 198500],
  [915148800000, 231000],
  [946684800000, 344257],
  [978307200000, 426250],
  [1009843200000, 591266],
  [1041379200000, 631554],
  [1072915200000, 671550],
  [1104537600000, 819100],
  [1136073600000, 900560],
  [1167609600000, 972605],
  [1199145600000, 972605],
  [1230768000000, 1069865],
  [1262304000000, 1188010],
  [1293840000000, 1290000],
  [1325376000000, 1529150],
  [1356998400000, 2200000],
  [1388534400000, 2441000]
  ]
},
{
  "key" : "Inflasi",
  "bar" : false,
  "color": "#FF0000",
  "values" : 
  [
  [852076800000, 11.07],
  [883612800000, 74.42],
  [915148800000, 1.77],
  [946684800000, 10.29],
  [978307200000, 11.62],
  [1009843200000, 9.08],
  [1041379200000, 5.78],
  [1072915200000, 5.87],
  [1104537600000, 16.06],
  [1136073600000, 6.03],
  [1167609600000, 6.04],
  [1199145600000, 11.11],
  [1230768000000, 2.34],
  [1262304000000, 5.95],
  [1293840000000, 3.97],
  [1325376000000, 4.52],
  [1356998400000, 5.67],
  [1388534400000, 6.15]
  ]
},
{
  "key" : "Kenaikan" ,
  "bar" : false,
  "color": "#088A29",
  "values" : 
  [
  [852076800000, 0],
  [883612800000, 15.07],
  [915148800000, 16.37],
  [946684800000, 49.03],
  [978307200000, 23.82],
  [1009843200000, 37.71],
  [1041379200000, 6.81],
  [1072915200000, 6.33],
  [1104537600000, 6],
  [1136073600000, 15.07],
  [1167609600000, 9.95],
  [1199145600000, 8],
  [1230768000000, 10],
  [1262304000000, 11.04],
  [1293840000000, 8.58],
  [1325376000000, 18.54],
  [1356998400000, 43.87],
  [1388534400000, 10.96]
  ]
}
].map(function(series) {
  series.values = series.values.map(function(d) { return {x: d[0], y: d[1] } });
  return series;
});
});
