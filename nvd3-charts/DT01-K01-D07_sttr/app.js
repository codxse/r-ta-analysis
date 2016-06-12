var app = angular.module('ion-sttr', ['nvd3']);

app.controller('sttr', function($scope, $http) {
  $scope.options = {
    chart: {
      type: 'scatterChart',
      height: 450,
      // margin: {
      //   top: 50,
      //   right: 15,
      //   bottom: 50,
      //   left: 60
      // },
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
      // forceX: [0, 1600000],
      // forceY: [0, 8000000],
      xAxis: {
        axisLabel: 'Volume (Ton)',
        tickFormat: function(d) {
          var prefix = d3.formatPrefix(d);
          return prefix.scale(d) + prefix.symbol;
        },
        showMaxMin: false
      },
      yAxis: {
        axisLabel: 'USD',
        tickFormat: function(d) {
          var prefix = d3.formatPrefix(d);
          return prefix.scale(d) + prefix.symbol;
        },
        showMaxMin: false,
        axisLabelDistance: -5
      },
      zoom: {
        //NOTE: All attributes below are optional
        enabled: true,
        scaleExtent: [1, 10],
        useFixedDomain: true,
        useNiceScale: false,
        horizontalOff: false,
        verticalOff: false,
        unzoomEventType: 'dblclick.zoom'
      }
    }
  };

  // --------- START GET JSON -----------

  var jData = (function getData($scope, $stateParams, $http) {
    var jsonData = { content: null };

    $http.get('http://finance.yahoo.com/webservice/v1/symbols/YHOO/quote?format=json&view=detail').success(function(data) {
      jsonData.content = data;
    });

    return jsonData;
  })
  console.log("Here it is");
  console.log(jData);
  // --------- END GET JSON -----------

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
        { "series": 0, "shape": "circle", "size": 1, "x": 23887.25, "y": 19948.08 },
        { "series": 0, "shape": "circle", "size": 1, "x": 66009.25, "y": 57926.67 },
        { "series": 0, "shape": "circle", "size": 1, "x": 82826.39, "y": 284759.55 },
        { "series": 0, "shape": "circle", "size": 1, "x": 386.95, "y": 861.42 },
        { "series": 0, "shape": "circle", "size": 1, "x": 60805.46, "y": 37951.08 },
        { "series": 0, "shape": "circle", "size": 1, "x": 5858.97, "y": 15165.76 },
        { "series": 0, "shape": "circle", "size": 1, "x": 11225.44, "y": 21765.33 },
        { "series": 0, "shape": "circle", "size": 1, "x": 3165.14, "y": 4422.31 },
        { "series": 0, "shape": "circle", "size": 1, "x": 20343.91, "y": 96443.84 },
        { "series": 0, "shape": "circle", "size": 1, "x": 41745.46, "y": 103017.54 },
        { "series": 0, "shape": "circle", "size": 1, "x": 105993.13, "y": 373804.59 },
        { "series": 0, "shape": "circle", "size": 1, "x": 179522.29, "y": 400901.67 },
        { "series": 0, "shape": "circle", "size": 1, "x": 115724.17, "y": 394298.11 },
        { "series": 0, "shape": "circle", "size": 1, "x": 96778.24, "y": 77937.46 },
        { "series": 0, "shape": "circle", "size": 1, "x": 234686.33, "y": 55987.68 },
        { "series": 0, "shape": "circle", "size": 1, "x": 3125.76, "y": 37305.74 },
        { "series": 0, "shape": "circle", "size": 1, "x": 357065.63, "y": 22144.55 },
        { "series": 0, "shape": "circle", "size": 1, "x": 163298.96, "y": 54037.92 },
        { "series": 0, "shape": "circle", "size": 1, "x": 84361.74, "y": 101012.14 },
        { "series": 0, "shape": "circle", "size": 1, "x": 201254.36, "y": 75103.27 },
        { "series": 0, "shape": "circle", "size": 1, "x": 162664.20, "y": 390898.64 },
        { "series": 0, "shape": "circle", "size": 1, "x": 16611.50, "y": 328898.64 },
        { "series": 0, "shape": "circle", "size": 1, "x": 28060.43, "y": 12214.05 },
        { "series": 0, "shape": "circle", "size": 1, "x": 71392.20, "y": 242294.28 },
        { "series": 0, "shape": "circle", "size": 1, "x": 88051.79, "y": 378373.65 },
        { "series": 0, "shape": "circle", "size": 1, "x": 309521.70, "y": 402714.59 },
        { "series": 0, "shape": "circle", "size": 1, "x": 32741.62, "y": 34898.51 },
        { "series": 0, "shape": "circle", "size": 1, "x": 3815.63, "y": 4961.99 },
        { "series": 0, "shape": "circle", "size": 1, "x": 171.71, "y": 719.09 },
        { "series": 0, "shape": "circle", "size": 1, "x": 395243.65, "y": 464319.19 },
        { "series": 0, "shape": "circle", "size": 1, "x": 5090.66, "y": 70190.24 },
        { "series": 0, "shape": "circle", "size": 1, "x": 14417.07, "y": 243275.45 },
        { "series": 0, "shape": "circle", "size": 1, "x": 132.18, "y": 1241.18 },
        { "series": 0, "shape": "circle", "size": 1, "x": 353351.02, "y": 401522.05 },
        { "series": 0, "shape": "circle", "size": 1, "x": 19.38, "y": 36.28 },
        { "series": 0, "shape": "circle", "size": 1, "x": 5799.76, "y": 25215.33 },
        { "series": 0, "shape": "circle", "size": 1, "x": 3849.41, "y": 1188.34 },
        { "series": 0, "shape": "circle", "size": 1, "x": 7402.30, "y": 24774.54 },
        { "series": 0, "shape": "circle", "size": 1, "x": 3.85, "y": 20.62 },
        { "series": 0, "shape": "circle", "size": 1, "x": 310.67, "y": 1074.21 },
        { "series": 0, "shape": "circle", "size": 1, "x": 108140.19, "y": 539072.83 },
        { "series": 0, "shape": "circle", "size": 1, "x": 11490.72, "y": 5282.60 },
        { "series": 0, "shape": "circle", "size": 1, "x": 8950.73, "y": 45640.47 },
        { "series": 0, "shape": "circle", "size": 1, "x": 12342.93, "y": 31644.26 },
        { "series": 0, "shape": "circle", "size": 1, "x": 4250.11, "y": 50319.34 },
        { "series": 0, "shape": "circle", "size": 1, "x": 22883.44, "y": 112521.70 },
        { "series": 0, "shape": "circle", "size": 1, "x": 12691.12, "y": 84808.05 },
        { "series": 0, "shape": "circle", "size": 1, "x": 63598.71, "y": 134623.63 },
        { "series": 0, "shape": "circle", "size": 1, "x": 1649.56, "y": 23162.17 },
        { "series": 0, "shape": "circle", "size": 1, "x": 412.68, "y": 2620.05 },
        { "series": 0, "shape": "circle", "size": 1, "x": 9624.98, "y": 221101.74 },
        { "series": 0, "shape": "circle", "size": 1, "x": 142864.12, "y": 68215.13 },
        { "series": 0, "shape": "circle", "size": 1, "x": 293059.51, "y": 302190.53 },
        { "series": 0, "shape": "circle", "size": 1, "x": 475346.67, "y": 259605.94 },
        { "series": 0, "shape": "circle", "size": 1, "x": 367575.96, "y": 338748.07 },
        { "series": 0, "shape": "circle", "size": 1, "x": 262951.15, "y": 503285.00 },
        { "series": 0, "shape": "circle", "size": 1, "x": 880.58, "y": 5724.10 },
        { "series": 0, "shape": "circle", "size": 1, "x": 601.57, "y": 1228.98 },
        { "series": 0, "shape": "circle", "size": 1, "x": 1064.87, "y": 1311.03 },
        { "series": 0, "shape": "circle", "size": 1, "x": 8046.04, "y": 8046.04 },
        { "series": 0, "shape": "circle", "size": 1, "x": 4423.00, "y": 50028.05 },
        { "series": 0, "shape": "circle", "size": 1, "x": 316.01, "y": 4973.03 },
        { "series": 0, "shape": "circle", "size": 1, "x": 4423.00, "y": 50028.05 },
        { "series": 0, "shape": "circle", "size": 1, "x": 54833.30, "y": 244680.85 },
        { "series": 0, "shape": "circle", "size": 1, "x": 2641.56, "y": 10366.69 },
        { "series": 0, "shape": "circle", "size": 1, "x": 1763.68, "y": 115703.57 },
        { "series": 0, "shape": "circle", "size": 1, "x": 36461.79, "y": 31196.38 },
        { "series": 0, "shape": "circle", "size": 1, "x": 8653.23, "y": 244035.77 },
        { "series": 0, "shape": "circle", "size": 1, "x": 119.02, "y": 2265.80 },
        { "series": 0, "shape": "circle", "size": 1, "x": 57038.96, "y": 379217.75 },
        { "series": 0, "shape": "circle", "size": 1, "x": 30.85, "y": 1114.13 },
        { "series": 0, "shape": "circle", "size": 1, "x": 189423.93, "y": 578684.03 },
        { "series": 0, "shape": "circle", "size": 1, "x": 28936.61, "y": 301562.59 },
        { "series": 0, "shape": "circle", "size": 1, "x": 35570.14, "y": 256560.00 },
        { "series": 0, "shape": "circle", "size": 1, "x": 110.25, "y": 995.75 },
        { "series": 0, "shape": "circle", "size": 1, "x": 139.32, "y": 2534.71 },
        { "series": 0, "shape": "circle", "size": 1, "x": 413.00, "y": 1792.52 },
        { "series": 0, "shape": "circle", "size": 1, "x": 22484.19, "y": 133228.44 },
        { "series": 0, "shape": "circle", "size": 1, "x": 5017.42, "y": 6101.36 },
        { "series": 0, "shape": "circle", "size": 1, "x": 6766.20, "y": 14043.57 },
        { "series": 0, "shape": "circle", "size": 1, "x": 33831.31, "y": 26428.11 },
        { "series": 0, "shape": "circle", "size": 1, "x": 79540.59, "y": 283768.41 },
        { "series": 0, "shape": "circle", "size": 1, "x": 596.22, "y": 923.49 },
        { "series": 0, "shape": "circle", "size": 1, "x": 69970.42, "y": 37956.12 },
        { "series": 0, "shape": "circle", "size": 1, "x": 8232.61, "y": 19143.09 },
        { "series": 0, "shape": "circle", "size": 1, "x": 12052.92, "y": 29188.41 },
        { "series": 0, "shape": "circle", "size": 1, "x": 3944.95, "y": 3696.13 },
        { "series": 0, "shape": "circle", "size": 1, "x": 17573.68, "y": 105589.84 },
        { "series": 0, "shape": "circle", "size": 1, "x": 44903.08, "y": 119575.88 },
        { "series": 0, "shape": "circle", "size": 1, "x": 105517.03, "y": 312987.44 },
        { "series": 0, "shape": "circle", "size": 1, "x": 176470.14, "y": 413665.11 },
        { "series": 0, "shape": "circle", "size": 1, "x": 7081.45, "y": 7081.45 },
        { "series": 0, "shape": "circle", "size": 1, "x": 128979.87, "y": 471206.88 },
        { "series": 0, "shape": "circle", "size": 1, "x": 35932.46, "y": 48547.63 },
        { "series": 0, "shape": "circle", "size": 1, "x": 265699.79, "y": 67775.38 },
        { "series": 0, "shape": "circle", "size": 1, "x": 4242.66, "y": 54183.65 },
        { "series": 0, "shape": "circle", "size": 1, "x": 95155.63, "y": 10240.97 },
        { "series": 0, "shape": "circle", "size": 1, "x": 230156.27, "y": 18786.36 },
        { "series": 0, "shape": "circle", "size": 1, "x": 60381.99, "y": 62283.31 },
        { "series": 0, "shape": "circle", "size": 1, "x": 175143.64, "y": 69580.02 },
        { "series": 0, "shape": "circle", "size": 1, "x": 210562.94, "y": 416560.11 },
        { "series": 0, "shape": "circle", "size": 1, "x": 16295.14, "y": 365806.78 },
        { "series": 0, "shape": "circle", "size": 1, "x": 22261.65, "y": 10549.16 },
        { "series": 0, "shape": "circle", "size": 1, "x": 82342.20, "y": 248118.33 },
        { "series": 0, "shape": "circle", "size": 1, "x": 71500.30, "y": 380530.80 },
        { "series": 0, "shape": "circle", "size": 1, "x": 432177.94, "y": 524811.62 },
        { "series": 0, "shape": "circle", "size": 1, "x": 15441.44, "y": 18075.12 },
        { "series": 0, "shape": "circle", "size": 1, "x": 3701.45, "y": 5043.25 },
        { "series": 0, "shape": "circle", "size": 1, "x": 22.79, "y": 269.76 },
        { "series": 0, "shape": "circle", "size": 1, "x": 480066.57, "y": 553237.39 },
        { "series": 0, "shape": "circle", "size": 1, "x": 3389.27, "y": 63632.21 },
        { "series": 0, "shape": "circle", "size": 1, "x": 14670.15, "y": 269397.34 },
        { "series": 0, "shape": "circle", "size": 1, "x": 136.93, "y": 1267.60 },
        { "series": 0, "shape": "circle", "size": 1, "x": 333839.47, "y": 409984.69 },
        { "series": 0, "shape": "circle", "size": 1, "x": 24.39, "y": 123.27 },
        { "series": 0, "shape": "circle", "size": 1, "x": 13150.82, "y": 50537.17 },
        { "series": 0, "shape": "circle", "size": 1, "x": 3463.62, "y": 1425.54 },
        { "series": 0, "shape": "circle", "size": 1, "x": 6543.23, "y": 22519.79 },
        { "series": 0, "shape": "circle", "size": 1, "x": 6.43, "y": 23.99 },
        { "series": 0, "shape": "circle", "size": 1, "x": 268.73, "y": 880.19 },
        { "series": 0, "shape": "circle", "size": 1, "x": 135884.65, "y": 520193.01 },
        { "series": 0, "shape": "circle", "size": 1, "x": 9700.44, "y": 4455.47 },
        { "series": 0, "shape": "circle", "size": 1, "x": 8039.68, "y": 50576.92 },
        { "series": 0, "shape": "circle", "size": 1, "x": 12128.14, "y": 35976.92 },
        { "series": 0, "shape": "circle", "size": 1, "x": 5348.46, "y": 57690.95 },
        { "series": 0, "shape": "circle", "size": 1, "x": 24065.32, "y": 114423.23 },
        { "series": 0, "shape": "circle", "size": 1, "x": 17129.63, "y": 106354.59 },
        { "series": 0, "shape": "circle", "size": 1, "x": 47190.68, "y": 135731.07 },
        { "series": 0, "shape": "circle", "size": 1, "x": 1354.26, "y": 23569.00 },
        { "series": 0, "shape": "circle", "size": 1, "x": 48.81, "y": 1155.42 },
        { "series": 0, "shape": "circle", "size": 1, "x": 10091.87, "y": 240963.10 },
        { "series": 0, "shape": "circle", "size": 1, "x": 106204.04, "y": 65767.59 },
        { "series": 0, "shape": "circle", "size": 1, "x": 239578.21, "y": 270685.33 },
        { "series": 0, "shape": "circle", "size": 1, "x": 478971.89, "y": 257877.22 },
        { "series": 0, "shape": "circle", "size": 1, "x": 217870.57, "y": 250574.87 },
        { "series": 0, "shape": "circle", "size": 1, "x": 204973.57, "y": 204973.57 },
        { "series": 0, "shape": "circle", "size": 1, "x": 680.78, "y": 7887.88 },
        { "series": 0, "shape": "circle", "size": 1, "x": 47183.11, "y": 148433.22 },
        { "series": 0, "shape": "circle", "size": 1, "x": 147.52, "y": 174.48 },
        { "series": 0, "shape": "circle", "size": 1, "x": 3107.05, "y": 2559.69 },
        { "series": 0, "shape": "circle", "size": 1, "x": 36087.04, "y": 422975.47 },
        { "series": 0, "shape": "circle", "size": 1, "x": 371.62, "y": 15268.61 },
        { "series": 0, "shape": "circle", "size": 1, "x": 3547.68, "y": 72611.04 },
        { "series": 0, "shape": "circle", "size": 1, "x": 40050.14, "y": 165013.54 },
        { "series": 0, "shape": "circle", "size": 1, "x": 1318.41, "y": 9661.81 },
        { "series": 0, "shape": "circle", "size": 1, "x": 1657.43, "y": 118353.59 },
        { "series": 0, "shape": "circle", "size": 1, "x": 8962.92, "y": 7570.32 },
        { "series": 0, "shape": "circle", "size": 1, "x": 7804.65, "y": 263714.51 },
        { "series": 0, "shape": "circle", "size": 1, "x": 58.45, "y": 2676.69 },
        { "series": 0, "shape": "circle", "size": 1, "x": 41562.05, "y": 379764.85 },
        { "series": 0, "shape": "circle", "size": 1, "x": 5.87, "y": 1562.78 },
        { "series": 0, "shape": "circle", "size": 1, "x": 185712.98, "y": 595241.32 },
        { "series": 0, "shape": "circle", "size": 1, "x": 32759.38, "y": 369275.79 },
        { "series": 0, "shape": "circle", "size": 1, "x": 43910.89, "y": 288858.69 },
        { "series": 0, "shape": "circle", "size": 1, "x": 275.24, "y": 131165.12 },
        { "series": 0, "shape": "circle", "size": 1, "x": 260.31, "y": 1753.77 }
      ]
    },
    {
      "key": "Cluster k2",
      "values": [
        { "series": 0, "shape": "circle", "size": 1, "x": 207565.56, "y": 3119664.82 },
        { "series": 0, "shape": "circle", "size": 1, "x": 162230.81, "y": 3281853.06 },
        { "series": 0, "shape": "circle", "size": 1, "x": 163516.55, "y": 2756790.40 },
        { "series": 0, "shape": "circle", "size": 1, "x": 425594.70, "y": 3491954.57 },
        { "series": 0, "shape": "circle", "size": 1, "x": 472300.30, "y": 7281766.89 },
        { "series": 0, "shape": "circle", "size": 1, "x": 316010.95, "y": 2830214.70 },
        { "series": 0, "shape": "circle", "size": 1, "x": 218775.49, "y": 3033504.08 },
        { "series": 0, "shape": "circle", "size": 1, "x": 148100.13, "y": 2913258.05 },
        { "series": 0, "shape": "circle", "size": 1, "x": 165401.10, "y": 2981827.85 },
        { "series": 0, "shape": "circle", "size": 1, "x": 454058.15, "y": 4146812.82 },
        { "series": 0, "shape": "circle", "size": 1, "x": 454658.75, "y": 7120360.60 },
        { "series": 0, "shape": "circle", "size": 1, "x": 434593.14, "y": 4247565.77 }
      ]
    },
    {
      "key": "Cluster k3",
      "values": [
        { "series": 0, "shape": "circle", "size": 1, "x": 717915.80, "y": 774358.91 },
        { "series": 0, "shape": "circle", "size": 1, "x": 989192.08, "y": 1934443.29 },
        { "series": 0, "shape": "circle", "size": 1, "x": 500288.98, "y": 2140778.92 },
        { "series": 0, "shape": "circle", "size": 1, "x": 1522428.26, "y": 1570781.53 },
        { "series": 0, "shape": "circle", "size": 1, "x": 273368.27, "y": 1233189.23 },
        { "series": 0, "shape": "circle", "size": 1, "x": 560242.52, "y": 1792726.10 },
        { "series": 0, "shape": "circle", "size": 1, "x": 4056.31, "y": 1760235.30 },
        { "series": 0, "shape": "circle", "size": 1, "x": 127801.53, "y": 1111237.23 },
        { "series": 0, "shape": "circle", "size": 1, "x": 245838.66, "y": 881896.36 },
        { "series": 0, "shape": "circle", "size": 1, "x": 794515.03, "y": 799952.58 },
        { "series": 0, "shape": "circle", "size": 1, "x": 1006880.27, "y": 1899249.47 },
        { "series": 0, "shape": "circle", "size": 1, "x": 464748.71, "y": 1999809.59 },
        { "series": 0, "shape": "circle", "size": 1, "x": 1421809.45, "y": 1455966.47 },
        { "series": 0, "shape": "circle", "size": 1, "x": 250905.10, "y": 1211986.86 },
        { "series": 0, "shape": "circle", "size": 1, "x": 580795.98, "y": 1637211.66 },
        { "series": 0, "shape": "circle", "size": 1, "x": 4137.98, "y": 1369621.70 },
        { "series": 0, "shape": "circle", "size": 1, "x": 143182.10, "y": 1158358.34 },
      ]
    }
  ];
  console.log($scope.data);
});
