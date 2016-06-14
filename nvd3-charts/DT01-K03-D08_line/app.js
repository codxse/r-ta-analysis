var app = angular.module('ion-line', ['nvd3']);

app.controller('line-chart', function($scope) {
  $scope.options = {
    chart: {
      type: 'lineChart',
      height: 700,
      margin : {
        top: 30,
        right: 50,
        bottom: 300,
        left: 55
      },
      legendPosition: "bottom",
      // forceX: [1104537600000, 1356998400000],
      x: function(d) {
        return new Date(d.x);
      },
      xScale: d3.time.scale(),
      y: function(d){ return d.y; },
      useInteractiveGuideline: true,
      dispatch: {
        stateChange: function(e){ console.log("stateChange"); },
        changeState: function(e){ console.log("changeState"); },
        tooltipShow: function(e){ console.log("tooltipShow"); },
        tooltipHide: function(e){ console.log("tooltipHide"); }
      },
      xAxis: {
        axisLabel: 'Bulan',
        tickFormat: function(d) {
          return d3.time.format('%b-%Y')(new Date(d));
        },
        axisLabelDistance: 5,
        showMaxMin: false
      },
      yAxis: {
        axisLabel: 'USD',
        tickFormat: function(d) {
          var prefix = d3.formatPrefix(d);
          return prefix.scale(d) + prefix.symbol;
        },
        axisLabelDistance: -8,
        showMaxMin: false
      },
      callback: function(chart){
        console.log("!!! lineChart callback !!!");
      }
    }
    // title: {
    //   enable: true,
    //   text: 'Title for Line Chart'
    // },
    // subtitle: {
    //   enable: true,
    //   text: 'Subtitle for simple line chart. Lorem ipsum dolor sit amet, at eam blandit sadipscing, vim adhuc sanctus disputando ex, cu usu affert alienum urbanitas.',
    //   css: {
    //     'text-align': 'center',
    //     'margin': '10px 13px 0px 7px'
    //   }
    // },
    // caption: {
    //   enable: true,
    //   html: '<b>Figure 1.</b> Lorem ipsum dolor sit amet, at eam blandit sadipscing, <span style="text-decoration: underline;">vim adhuc sanctus disputando ex</span>, cu usu affert alienum urbanitas. <i>Cum in purto erat, mea ne nominavi persecuti reformidans.</i> Docendi blandit abhorreant ea has, minim tantas alterum pro eu. <span style="color: darkred;">Exerci graeci ad vix, elit tacimates ea duo</span>. Id mel eruditi fuisset. Stet vidit patrioque in pro, eum ex veri verterem abhorreant, id unum oportere intellegam nec<sup>[1, <a href="https://github.com/krispo/angular-nvd3" target="_blank">2</a>, 3]</sup>.',
    //   css: {
    //     'text-align': 'justify',
    //     'margin': '10px 13px 0px 7px'
    //   }
    // }
  };

  var data = [
    {
      values: [
        { x: 1367366400000, y: 1514.55 },
        { x: 1372636800000, y: 1717.33 },
        { x: 1377993600000, y: 1534.66 },
        { x: 1396310400000, y: 1565.09 },
        { x: 1398902400000, y: 1284.62 },
        { x: 1401580800000, y: 1532.48 },
        { x: 1404172800000, y: 1215.7 },
        { x: 1406851200000, y: 1414.59 },
        { x: 1409529600000, y: 1419.65 }
      ],
      key: "Mesin-mesin / Pesawat Mekanik"
    },
    {
      values: [
        { x: 1367366400000, y: 1215.4 },
        { x: 1372636800000, y: 1387.28 },
        { x: 1377993600000, y: 1158.85 },
        { x: 1396310400000, y: 1269.08 },
        { x: 1398902400000, y: 1048.21 },
        { x: 1401580800000, y: 1047.34 },
        { x: 1404172800000, y: 835.18 },
        { x: 1406851200000, y: 1041.56 },
        { x: 1409529600000, y: 990.33 }
      ],
      key: "Mesin / Peralatan Listrik"
    },
    {
      values: [
        { x: 1367366400000, y: 672.79 },
        { x: 1372636800000, y: 638.3 },
        { x: 1377993600000, y: 569.06 },
        { x: 1396310400000, y: 620.04 },
        { x: 1398902400000, y: 498.57 },
        { x: 1401580800000, y: 434.79 },
        { x: 1404172800000, y: 519.77 },
        { x: 1406851200000, y: 431.13 },
        { x: 1409529600000, y: 474.05 }
      ],
      key: "Kendaraan dan Bagiannya"
    },
    {
      values: [
        { x: 1367366400000, y: 483.38 },
        { x: 1372636800000, y: 532.81 },
        { x: 1377993600000, y: 463.76 },
        { x: 1396310400000, y: 458.77 },
        { x: 1398902400000, y: 484.84 },
        { x: 1401580800000, y: 422.46 },
        { x: 1404172800000, y: 456.65 },
        { x: 1406851200000, y: 363.18 },
        { x: 1409529600000, y: 435.96 }
      ],
      key: "Palastik dan Barang dari Plastik"
    },
    {
      values: [
        { x: 1367366400000, y: 524.02 },
        { x: 1372636800000, y: 516.63 },
        { x: 1377993600000, y: 449.55 },
        { x: 1396310400000, y: 418.83 },
        { x: 1398902400000, y: 399.69 },
        { x: 1401580800000, y: 347.78 },
        { x: 1404172800000, y: 447.07 },
        { x: 1406851200000, y: 288.13 },
        { x: 1409529600000, y: 297.69 }
      ],
      key: "Besi dan Baja"
    },
    {
      values: [
        { x: 1367366400000, y: 377.73 },
        { x: 1372636800000, y: 391.56 },
        { x: 1377993600000, y: 384.13 },
        { x: 1396310400000, y: 320.13 },
        { x: 1398902400000, y: 322.6 },
        { x: 1401580800000, y: 292.65 },
        { x: 1404172800000, y: 257.10 },
        { x: 1406851200000, y: 318.93 },
        { x: 1409529600000, y: 277.57 }
      ],
      key: "Bahan Bakar Mineral"
    },
    {
      values: [
        { x: 1367366400000, y: 262.69 },
        { x: 1372636800000, y: 241.45 },
        { x: 1377993600000, y: 192.92 },
        { x: 1396310400000, y: 206.51 },
        { x: 1398902400000, y: 227.98 },
        { x: 1401580800000, y: 189.41 },
        { x: 1404172800000, y: 206.96 },
        { x: 1406851200000, y: 171.54 },
        { x: 1409529600000, y: 202.09 }
      ],
      key: "Bahan Kimia Organik"
    },
    {
      values: [
        { x: 1367366400000, y: 169.1 },
        { x: 1372636800000, y: 175.31 },
        { x: 1377993600000, y: 175.91 },
        { x: 1396310400000, y: 205.55 },
        { x: 1398902400000, y: 168.09 },
        { x: 1401580800000, y: 127.98 },
        { x: 1404172800000, y: 143.26 },
        { x: 1406851200000, y: 143.26 },
        { x: 1409529600000, y: 179.29 }
      ],
      key: "Kapas"
    },
    {
      values: [
        { x: 1367366400000, y: 169.1 },
        { x: 1372636800000, y: 175.31 },
        { x: 1377993600000, y: 175.91 },
        { x: 1396310400000, y: 205.55 },
        { x: 1398902400000, y: 168.09 },
        { x: 1401580800000, y: 127.98 },
        { x: 1404172800000, y: 143.26 },
        { x: 1406851200000, y: 143.26 },
        { x: 1409529600000, y: 179.29 }
      ],
      key: "Gandum-Gandum"
    }
  ];

  $scope.data = data;
  // console.log($scope.data);
  // d3.select(".nvd3")
  //   .attr("transform", "translate(40,10)");
  // d3.select(".nv-legendWrap")
  //   .attr("transform", "translate(-55,320)");
});
