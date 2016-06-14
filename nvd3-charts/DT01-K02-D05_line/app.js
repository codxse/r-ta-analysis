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
        axisLabel: 'Pertumbuhan (%)',
        tickFormat: function(d) {
          return d3.format(',.2f')(d);
        },
        axisLabelDistance: -15,
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
        { x: 1325376000000, y: 0.48 },
        { x: 1328054400000, y: 0.17 },
        { x: 1330560000000, y: 0.18 },
        { x: 1333238400000, y: 0.13 },
        { x: 1335830400000, y: 0 },
        { x: 1338508800000, y: 0.38 }
      ],
      key: "Umum"
    },
    {
      values: [
        { x: 1325376000000, y: 1.6 },
        { x: 1328054400000, y: -0.62 },
        { x: 1330560000000, y: 0.1 },
        { x: 1333238400000, y: 0.35 },
        { x: 1335830400000, y: 0 },
        { x: 1338508800000, y: 0.93 }
      ],
      key: "Bukan Makanan"
    },
    {
      values: [
        { x: 1325376000000, y: 0.74 },
        { x: 1328054400000, y: 0.18 },
        { x: 1330560000000, y: 0.4 },
        { x: 1333238400000, y: 0.7 },
        { x: 1335830400000, y: 0 },
        { x: 1338508800000, y: 0.15 }
      ],
      key: "Makanan jadi, Rokok, & Tembakau"
    },
    {
      values: [
        { x: 1325376000000, y: 0.11 },
        { x: 1328054400000, y: 0.2 },
        { x: 1330560000000, y: 0.1 },
        { x: 1333238400000, y: 0.06 },
        { x: 1335830400000, y: 0 },
        { x: 1338508800000, y: 0.5 }
      ],
      key: "Perumahan, Air, Listrik, Gas, dan Bahan bakar"
    },
    {
      values: [
        { x: 1325376000000, y: 0.31 },
        { x: 1328054400000, y: 1.74 },
        { x: 1330560000000, y: 0.28 },
        { x: 1333238400000, y: -0.89 },
        { x: 1335830400000, y: 0 },
        { x: 1338508800000, y: 0.55 }
      ],
      key: "Sandang"
    },
    {
      values: [
        { x: 1325376000000, y: 0.59 },
        { x: 1328054400000, y: -0.03 },
        { x: 1330560000000, y: 0.04 },
        { x: 1333238400000, y: 0.04 },
        { x: 1335830400000, y: 0 },
        { x: 1338508800000, y: 0.08 }
      ],
      key: "Kesehatan"
    },
    {
      values: [
        { x: 1325376000000, y: 0.01 },
        { x: 1328054400000, y: 0 },
        { x: 1330560000000, y: 0.02 },
        { x: 1333238400000, y: 0 },
        { x: 1335830400000, y: 0 },
        { x: 1338508800000, y: 0.03 }
      ],
      key: "Pendidikan, Rekreasi dan Olah Raga"
    },
    {
      values: [
        { x: 1325376000000, y: -0.04 },
        { x: 1328054400000, y: 0.13 },
        { x: 1330560000000, y: 0.2 },
        { x: 1333238400000, y: 0.17 },
        { x: 1335830400000, y: 0 },
        { x: 1338508800000, y: 0.03 }
      ],
      key: "Transportasi, Komunikasi dan Jasa Keuangan"
    }
  ];

  $scope.data = data;
  // console.log($scope.data);
  // d3.select(".nvd3")
  //   .attr("transform", "translate(40,10)");
  // d3.select(".nv-legendWrap")
  //   .attr("transform", "translate(-55,320)");
});
