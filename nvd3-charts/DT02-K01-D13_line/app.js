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
      forceY: [0,120],
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
        axisLabelDistance: 10
      },
      yAxis: {
        axisLabel: 'Pertumbuhan (%)',
        tickFormat: function(d) {
          var prefix = d3.formatPrefix(d);
          return prefix.scale(d) + prefix.symbol;
        },
        axisLabelDistance: -15
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
        { x: 1136073600000, y: 55.98 },
        { x: 1167609600000, y: 62.49 },
        { x: 1199145600000, y: 74.16 },
        { x: 1230768000000, y: 82.15 },
        { x: 1262304000000, y: 89.72 },
        { x: 1293840000000, y: 100.98 },
        { x: 1325376000000, y: 110.46 }
      ],
      key: "Jakarta"
    },
    {
      values: [
        { x: 1136073600000, y: 15.33 },
        { x: 1167609600000, y: 17.5 },
        { x: 1199145600000, y: 21.7 },
        { x: 1230768000000, y: 23.9 },
        { x: 1262304000000, y: 27.1},
        { x: 1293840000000, y: 30.4 },
        { x: 1325376000000, y: 33.3 }
      ],
      key: "Nasional"
    }
  ];

  $scope.data = data;
  // console.log($scope.data);
  // d3.select(".nvd3")
  //   .attr("transform", "translate(40,10)");
  // d3.select(".nv-legendWrap")
  //   .attr("transform", "translate(-55,320)");
});
