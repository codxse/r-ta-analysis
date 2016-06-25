var app = angular.module('ion-line', ['nvd3']);

app.controller('line-two', function($scope) {
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
      legendPosition: "bottom",
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
        }
      },
      yAxis: {
        axisLabel: 'Jiwa',
        axisLabelDistance: -5,
        tickFormat: function(d) {
          var prefix = d3.formatPrefix(d);
          return prefix.scale(d) + prefix.symbol;
        }
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
            { x: 1230768000000, y: 66445 },
            { x: 1262304000000, y: 143638 },
            { x: 1293840000000, y: 84962 },
            { x: 1325376000000, y: 93666 },
            { x: 1356998400000, y: 87438 }
          ],
          key: "Pencari kerja yang belum ditempatkan"
      },
      {
          values: [
            { x: 1230768000000, y: 41794 },
            { x: 1262304000000, y: 368726 }, 
            { x: 1293840000000, y: 358142 },
            { x: 1325376000000, y: 46429 },
            { x: 1356998400000, y: 82728 }
          ],
          key: "Pencari kerja yang terdaftar"
      },
      {
          values: [
            { x: 1230768000000, y: 12903 },
            { x: 1262304000000, y: 453084 },
            { x: 1293840000000, y: 156755 },
            { x: 1325376000000, y: 25341 },
            { x: 1356998400000, y: 16721 }
          ],
          key: "Pencari kerja yang ditempatkan"
      },
      {
          values: [
            { x: 1230768000000, y: 0 },
            { x: 1262304000000, y: 32738 },
            { x: 1293840000000, y: 166932 },
            { x: 1325376000000, y: 27114 },
            { x: 1356998400000, y: 23072 }
          ],
          key: "Pencari kerja yang dihapus"
      },
      {
          values: [
            { x: 1230768000000, y: 2875 },
            { x: 1262304000000, y: 706 },
            { x: 1293840000000, y: 531 },
            { x: 1325376000000, y: 4283 },
            { x: 1356998400000, y: 612 }
          ],
          key: "Lowongan yang belum dipenuhi"
      },
      {
          values: [
            { x: 1230768000000, y: 12903 },
            { x: 1262304000000, y: 454687 },
            { x: 1293840000000, y: 193136 },
            { x: 1325376000000, y: 38204 },
            { x: 1356998400000, y: 43551 }
          ],
          key: "Lowongan yang terdaftar"
      },
      {
          values: [
            { x: 1230768000000, y: 12903 },
            { x: 1262304000000, y: 453084 },
            { x: 1293840000000, y: 156755 },
            { x: 1325376000000, y: 25341 },
            { x: 1356998400000, y: 16721}
          ],
          key: "Lowongan yang dipenuhi"
      },
      {
          values: [
            { x: 1230768000000, y: 0 },
            { x: 1262304000000, y: 19304 },
            { x: 1293840000000, y: 36156 },
            { x: 1325376000000, y: 16534 },
            { x: 1356998400000, y: 24868 }
          ],
          key: "Lowongan yang dihapus"
      },
      {
          values: [
            { x: 1230768000000, y: 2875 },
            { x: 1262304000000, y: 510 },
            { x: 1293840000000, y: 756 },
            { x: 1325376000000, y: 612 },
            { x: 1356998400000, y: 0 }
          ],
          key: "Lowongan Gol I dan Gol II"
      }
  ];

  $scope.data = data;
  // console.log($scope.data);
  // d3.select(".nvd3")
  //   .attr("transform", "translate(40,10)");
  // d3.select(".nv-legendWrap")
  //   .attr("transform", "translate(-55,320)");
});
