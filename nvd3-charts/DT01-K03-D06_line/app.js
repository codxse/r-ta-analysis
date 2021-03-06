var app = angular.module('ion-line', ['nvd3']);

app.controller('line-chart', function($scope) {
  $scope.options = {
    chart: {
      type: 'lineChart',
      height: 600,
      margin : {
        top: 30,
        right: 20,
        bottom: 300,
        left: 55
      },
      legendPosition: "top",
      forceY: [2,12],
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
        axisLabel: 'Tahun',
        tickFormat: function(d) {
          return d3.time.format('%Y')(new Date(d));
        },
        axisLabelDistance: 10,
        showMaxMin: false
      },
      yAxis: {
        axisLabel: 'Pertumbuhan (%)',
        tickFormat: function(d) {
          var prefix = d3.formatPrefix(d);
          return prefix.scale(d) + prefix.symbol;
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
        { x: 1136073600000, y: 29810 },
        { x: 1167609600000, y: 32187 },
        { x: 1199145600000, y: 36090 },
        { x: 1230768000000, y: 32536 },
        { x: 1262304000000, y: 39648 },
        { x: 1293840000000, y: 46476 },
        { x: 1325376000000, y: 48135 }
      ],
      key: "Ekspor Melalui Jakarta"
    },
    {
      values: [
        { x: 1136073600000, y: 27135 },
        { x: 1167609600000, y: 34739 },
        { x: 1199145600000, y: 63313 },
        { x: 1230768000000, y: 48099 },
        { x: 1262304000000, y: 70069},
        { x: 1293840000000, y: 88874 },
        { x: 1325376000000, y: 96926 }
      ],
      key: "Impor Melalui Jakarta"
    },
    {
      values: [
        { x: 1136073600000, y: 6989 },
        { x: 1167609600000, y: 8060 },
        { x: 1199145600000, y: 9393 },
        { x: 1230768000000, y: 7536 },
        { x: 1262304000000, y: 8465 },
        { x: 1293840000000, y: 11043 },
        { x: 1325376000000, y: 11801 }
      ],
      key: "Ekspor Produk Jakarta"
    }
  ];

  $scope.data = data;
  // console.log($scope.data);
  // d3.select(".nvd3")
  //   .attr("transform", "translate(40,10)");
  // d3.select(".nv-legendWrap")
  //   .attr("transform", "translate(-55,320)");
});
