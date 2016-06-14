var app = angular.module('ion-line', ['nvd3']);

app.controller('line-jakut', function($scope) {
  $scope.options = {
    chart: {
      type: 'lineChart',
      height: 600,
      margin : {
        top: 30,
        right: 50,
        bottom: 130,
        left: 55
      },
      legendPosition: "bottom",
      useInteractiveGuideline: true,
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
        axisLabel: 'Rp.',
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
  };

  var data = [
    {
      values: [
        { x: 1425168000000, y: 11335 },
        { x: 1427846400000, y: 10692 },
        { x: 1430438400000, y: 10370 },
        { x: 1433116800000, y: 9687 },
        { x: 1435708800000, y: 9599 },
        { x: 1438387200000, y: 10710 },
        { x: 1441065600000, y: 10523 }
      ],
      key: "Beras Sedang"
    },
    {
      values: [
        { x: 1425168000000, y: 105673 },
        { x: 1427846400000, y: 105892 },
        { x: 1430438400000, y: 106467 },
        { x: 1433116800000, y: 110198 },
        { x: 1435708800000, y: 124753 },
        { x: 1438387200000, y: 131095 },
        { x: 1441065600000, y: 127834 }
      ],
      key: "Daging Sapi"
    },
    {
      values: [
        { x: 1425168000000, y: 11500 },
        { x: 1427846400000, y: 12022 },
        { x: 1430438400000, y: 12500 },
        { x: 1433116800000, y: 12455 },
        { x: 1435708800000, y: 12375 },
        { x: 1438387200000, y: 12670 },
        { x: 1441065600000, y: 12109 }
      ],
      key: "Gula"
    },
    {
      values: [
        { x: 1425168000000, y: 24481 },
        { x: 1427846400000, y: 21786 },
        { x: 1430438400000, y: 26415 },
        { x: 1433116800000, y: 30377 },
        { x: 1435708800000, y: 42777 },
        { x: 1438387200000, y: 42694 },
        { x: 1441065600000, y: 33042 }
      ],
      key: "Cabe"
    },
    {
      values: [
        { x: 1425168000000, y: 30462 },
        { x: 1427846400000, y: 31613 },
        { x: 1430438400000, y: 34083 },
        { x: 1433116800000, y: 33624 },
        { x: 1435708800000, y: 27845 },
        { x: 1438387200000, y: 20484 },
        { x: 1441065600000, y: 18975 }
      ],
      key: "Bawang Merah"
    },
    {
      values: [
        { x: 1425168000000, y: 11308 },
        { x: 1427846400000, y: 11044 },
        { x: 1430438400000, y: 11050 },
        { x: 1433116800000, y: 11250 },
        { x: 1435708800000, y: 11150 },
        { x: 1438387200000, y: 11339 },
        { x: 1441065600000, y: 11274 }
      ],
      key: "Minyak Goreng"
    },
    {
      values: [
        { x: 1425168000000, y: 28039 },
        { x: 1427846400000, y: 28834 },
        { x: 1430438400000, y: 29934 },
        { x: 1433116800000, y: 29824 },
        { x: 1435708800000, y: 32922 },
        { x: 1438387200000, y: 40823 },
        { x: 1441065600000, y: 31400 }
      ],
      key: "Daging Ayam"
    },
    {
      values: [
        { x: 1425168000000, y: 19116 },
        { x: 1427846400000, y: 18281 },
        { x: 1430438400000, y: 20551 },
        { x: 1433116800000, y: 22079 },
        { x: 1435708800000, y: 21048 },
        { x: 1438387200000, y: 22367 },
        { x: 1441065600000, y: 21317 }
      ],
      key: "Telur"
    }
  ];

  $scope.data = data;
})

.controller('line-jaksel', function($scope) {
  $scope.options = {
    chart: {
      type: 'lineChart',
      height: 600,
      margin : {
        top: 30,
        right: 50,
        bottom: 130,
        left: 55
      },
      legendPosition: "bottom",
      useInteractiveGuideline: true,
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
        axisLabel: 'Rp.',
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
  };

  var data = [
    {
      values: [
        { x: 1425168000000, y: 10450 },
        { x: 1427846400000, y: 11325 },
        { x: 1430438400000, y: 11292 },
        { x: 1433116800000, y: 11200 },
        { x: 1435708800000, y: 11224 },
        { x: 1438387200000, y: 11305 },
        { x: 1441065600000, y: 11317 }
      ],
      key: "Beras Sedang"
    },
    {
      values: [
        { x: 1425168000000, y: 105000 },
        { x: 1427846400000, y: 105000 },
        { x: 1430438400000, y: 105000 },
        { x: 1433116800000, y: 106397 },
        { x: 1435708800000, y: 126936 },
        { x: 1438387200000, y: 123750 },
        { x: 1441065600000, y: 112917 }
      ],
      key: "Daging Sapi"
    },
    {
      values: [
        { x: 1425168000000, y: 12795 },
        { x: 1427846400000, y: 13033 },
        { x: 1430438400000, y: 13000 },
        { x: 1433116800000, y: 13000 },
        { x: 1435708800000, y: 13065 },
        { x: 1438387200000, y: 13000 },
        { x: 1441065600000, y: 13000 }
      ],
      key: "Gula"
    },
    {
      values: [
        { x: 1425168000000, y: 25334 },
        { x: 1427846400000, y: 24423 },
        { x: 1430438400000, y: 25839 },
        { x: 1433116800000, y: 34801 },
        { x: 1435708800000, y: 43242 },
        { x: 1438387200000, y: 49468 },
        { x: 1441065600000, y: 43167 }
      ],
      key: "Cabe"
    },
    {
      values: [
        { x: 1425168000000, y: 31631 },
        { x: 1427846400000, y: 31552 },
        { x: 1430438400000, y: 34850 },
        { x: 1433116800000, y: 35838 },
        { x: 1435708800000, y: 28839 },
        { x: 1438387200000, y: 23113 },
        { x: 1441065600000, y: 20717 }
      ],
      key: "Bawang Merah"
    },
    {
      values: [
        { x: 1425168000000, y: 12027 },
        { x: 1427846400000, y: 12034 },
        { x: 1430438400000, y: 12250 },
        { x: 1433116800000, y: 12250 },
        { x: 1435708800000, y: 12395 },
        { x: 1438387200000, y: 12250 },
        { x: 1441065600000, y: 12167 }
      ],
      key: "Minyak Goreng"
    },
    {
      values: [
        { x: 1425168000000, y: 34965 },
        { x: 1427846400000, y: 29984 },
        { x: 1430438400000, y: 30587 },
        { x: 1433116800000, y: 32582 },
        { x: 1435708800000, y: 34298 },
        { x: 1438387200000, y: 33984 },
        { x: 1441065600000, y: 31417 }
      ],
      key: "Daging Ayam"
    },
    {
      values: [
        { x: 1425168000000, y: 19256 },
        { x: 1427846400000, y: 18440 },
        { x: 1430438400000, y: 20011 },
        { x: 1433116800000, y: 21765 },
        { x: 1435708800000, y: 20258 },
        { x: 1438387200000, y: 21662 },
        { x: 1441065600000, y: 21100 }
      ],
      key: "Telur"
    }
  ];

  $scope.data = data;
})

.controller('line-jakbar', function($scope) {
  $scope.options = {
    chart: {
      type: 'lineChart',
      height: 600,
      margin : {
        top: 30,
        right: 50,
        bottom: 130,
        left: 55
      },
      legendPosition: "bottom",
      useInteractiveGuideline: true,
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
        axisLabel: 'Rp.',
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
  };

  var data = [
    {
      values: [
        { x: 1425168000000, y: 11393 },
        { x: 1427846400000, y: 9850 },
        { x: 1430438400000, y: 10000 },
        { x: 1433116800000, y: 9558 },
        { x: 1435708800000, y: 9500 },
        { x: 1438387200000, y: 10339 },
        { x: 1441065600000, y: 10567 }
      ],
      key: "Beras Sedang"
    },
    {
      values: [
        { x: 1425168000000, y: 120000 },
        { x: 1427846400000, y: 120000 },
        { x: 1430438400000, y: 117923 },
        { x: 1433116800000, y: 120000 },
        { x: 1435708800000, y: 131855 },
        { x: 1438387200000, y: 130975 },
        { x: 1441065600000, y: 129342 }
      ],
      key: "Daging Sapi"
    },
    {
      values: [
        { x: 1425168000000, y: 11223 },
        { x: 1427846400000, y: 11734 },
        { x: 1430438400000, y: 11894 },
        { x: 1433116800000, y: 12422 },
        { x: 1435708800000, y: 12766 },
        { x: 1438387200000, y: 12637 },
        { x: 1441065600000, y: 12234 }
      ],
      key: "Gula"
    },
    {
      values: [
        { x: 1425168000000, y: 21970 },
        { x: 1427846400000, y: 19967 },
        { x: 1430438400000, y: 26984 },
        { x: 1433116800000, y: 30644 },
        { x: 1435708800000, y: 36630 },
        { x: 1438387200000, y: 38387 },
        { x: 1441065600000, y: 32800 }
      ],
      key: "Cabe"
    },
    {
      values: [
        { x: 1425168000000, y: 33261 },
        { x: 1427846400000, y: 31512 },
        { x: 1430438400000, y: 36609 },
        { x: 1433116800000, y: 33697 },
        { x: 1435708800000, y: 26791 },
        { x: 1438387200000, y: 20049 },
        { x: 1441065600000, y: 19867 }
      ],
      key: "Bawang Merah"
    },
    {
      values: [
        { x: 1425168000000, y: 11750 },
        { x: 1427846400000, y: 11634 },
        { x: 1430438400000, y: 11500 },
        { x: 1433116800000, y: 11658 },
        { x: 1435708800000, y: 12000 },
        { x: 1438387200000, y: 11024 },
        { x: 1441065600000, y: 10434 }
      ],
      key: "Minyak Goreng"
    },
    {
      values: [
        { x: 1425168000000, y: 29718 },
        { x: 1427846400000, y: 29300 },
        { x: 1430438400000, y: 30635 },
        { x: 1433116800000, y: 32022 },
        { x: 1435708800000, y: 34307 },
        { x: 1438387200000, y: 36420 },
        { x: 1441065600000, y: 29967 }
      ],
      key: "Daging Ayam"
    },
    {
      values: [
        { x: 1425168000000, y: 19457 },
        { x: 1427846400000, y: 18853 },
        { x: 1430438400000, y: 20334 },
        { x: 1433116800000, y: 22404 },
        { x: 1435708800000, y: 20758 },
        { x: 1438387200000, y: 22645 },
        { x: 1441065600000, y: 21484 }
      ],
      key: "Telur"
    }
  ];

  $scope.data = data;
})

.controller('line-jaktim', function($scope) {
  $scope.options = {
    chart: {
      type: 'lineChart',
      height: 600,
      margin : {
        top: 30,
        right: 50,
        bottom: 130,
        left: 55
      },
      legendPosition: "bottom",
      useInteractiveGuideline: true,
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
        axisLabel: 'Rp.',
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
  };

  var data = [
    {
      values: [
        { x: 1425168000000, y: 9848 },
        { x: 1427846400000, y: 9346 },
        { x: 1430438400000, y: 9623 },
        { x: 1433116800000, y: 9398 },
        { x: 1435708800000, y: 9953 },
        { x: 1438387200000, y: 9884 },
        { x: 1441065600000, y: 10140 }
      ],
      key: "Beras Sedang"
    },
    {
      values: [
        { x: 1425168000000, y: 117935 },
        { x: 1427846400000, y: 112584 },
        { x: 1430438400000, y: 115059 },
        { x: 1433116800000, y: 108261 },
        { x: 1435708800000, y: 119920 },
        { x: 1438387200000, y: 122876 },
        { x: 1441065600000, y: 122917 }
      ],
      key: "Daging Sapi"
    },
    {
      values: [
        { x: 1425168000000, y: 11018 },
        { x: 1427846400000, y: 11479 },
        { x: 1430438400000, y: 11861 },
        { x: 1433116800000, y: 12209 },
        { x: 1435708800000, y: 12444 },
        { x: 1438387200000, y: 13000 },
        { x: 1441065600000, y: 12884 }
      ],
      key: "Gula"
    },
    {
      values: [
        { x: 1425168000000, y: 23577 },
        { x: 1427846400000, y: 24367 },
        { x: 1430438400000, y: 29224 },
        { x: 1433116800000, y: 28373 },
        { x: 1435708800000, y: 39194 },
        { x: 1438387200000, y: 42533 },
        { x: 1441065600000, y: 36117 }
      ],
      key: "Cabe"
    },
    {
      values: [
        { x: 1425168000000, y: 29499 },
        { x: 1427846400000, y: 29392 },
        { x: 1430438400000, y: 32595 },
        { x: 1433116800000, y: 31754 },
        { x: 1435708800000, y: 28775 },
        { x: 1438387200000, y: 21903 },
        { x: 1441065600000, y: 20034 }
      ],
      key: "Bawang Merah"
    },
    {
      values: [
        { x: 1425168000000, y: 11215 },
        { x: 1427846400000, y: 11013 },
        { x: 1430438400000, y: 11109 },
        { x: 1433116800000, y: 11443 },
        { x: 1435708800000, y: 11729 },
        { x: 1438387200000, y: 11323 },
        { x: 1441065600000, y: 11204 }
      ],
      key: "Minyak Goreng"
    },
    {
      values: [
        { x: 1425168000000, y: 25083 },
        { x: 1427846400000, y: 25671 },
        { x: 1430438400000, y: 25340 },
        { x: 1433116800000, y: 25587 },
        { x: 1435708800000, y: 26121 },
        { x: 1438387200000, y: 30387 },
        { x: 1441065600000, y: 32517 }
      ],
      key: "Daging Ayam"
    },
    {
      values: [
        { x: 1425168000000, y: 20123 },
        { x: 1427846400000, y: 18850 },
        { x: 1430438400000, y: 20389 },
        { x: 1433116800000, y: 20913 },
        { x: 1435708800000, y: 20871 },
        { x: 1438387200000, y: 21290 },
        { x: 1441065600000, y: 21217 }
      ],
      key: "Telur"
    }
  ];

  $scope.data = data;
})

.controller('line-jakpus', function($scope) {
  $scope.options = {
    chart: {
      type: 'lineChart',
      height: 600,
      margin : {
        top: 30,
        right: 50,
        bottom: 130,
        left: 55
      },
      legendPosition: "bottom",
      useInteractiveGuideline: true,
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
        axisLabel: 'Rp.',
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
  };

  var data = [
    {
      values: [
        { x: 1425168000000, y: 12265 },
        { x: 1427846400000, y: 11650 },
        { x: 1430438400000, y: 11650 },
        { x: 1433116800000, y: 11650 },
        { x: 1435708800000, y: 11650 },
        { x: 1438387200000, y: 11650 },
        { x: 1441065600000, y: 11400 }
      ],
      key: "Beras Sedang"
    },
    {
      values: [
        { x: 1425168000000, y: 112292 },
        { x: 1427846400000, y: 110500 },
        { x: 1430438400000, y: 111875 },
        { x: 1433116800000, y: 112500 },
        { x: 1435708800000, y: 120060 },
        { x: 1438387200000, y: 118888 },
        { x: 1441065600000, y: 119000 }
      ],
      key: "Daging Sapi"
    },
    {
      values: [
        { x: 1425168000000, y: 12250 },
        { x: 1427846400000, y: 12250 },
        { x: 1430438400000, y: 12268 },
        { x: 1433116800000, y: 12750 },
        { x: 1435708800000, y: 13186 },
        { x: 1438387200000, y: 13396 },
        { x: 1441065600000, y: 12875 }
      ],
      key: "Gula"
    },
    {
      values: [
        { x: 1425168000000, y: 24491 },
        { x: 1427846400000, y: 23362 },
        { x: 1430438400000, y: 28813 },
        { x: 1433116800000, y: 32895 },
        { x: 1435708800000, y: 42154 },
        { x: 1438387200000, y: 45694 },
        { x: 1441065600000, y: 38917 }
      ],
      key: "Cabe"
    },
    {
      values: [
        { x: 1425168000000, y: 28116 },
        { x: 1427846400000, y: 31311 },
        { x: 1430438400000, y: 32232 },
        { x: 1433116800000, y: 33916 },
        { x: 1435708800000, y: 27658 },
        { x: 1438387200000, y: 27532 },
        { x: 1441065600000, y: 20750 }
      ],
      key: "Bawang Merah"
    },
    {
      values: [
        { x: 1425168000000, y: 11500 },
        { x: 1427846400000, y: 11250 },
        { x: 1430438400000, y: 11250 },
        { x: 1433116800000, y: 11421 },
        { x: 1435708800000, y: 11500 },
        { x: 1438387200000, y: 11420 },
        { x: 1441065600000, y: 10759 }
      ],
      key: "Minyak Goreng"
    },
    {
      values: [
        { x: 1425168000000, y: 28000 },
        { x: 1427846400000, y: 28000 },
        { x: 1430438400000, y: 28500 },
        { x: 1433116800000, y: 30000 },
        { x: 1435708800000, y: 32833 },
        { x: 1438387200000, y: 35000 },
        { x: 1441065600000, y: 30267 }
      ],
      key: "Daging Ayam"
    },
    {
      values: [
        { x: 1425168000000, y: 20077 },
        { x: 1427846400000, y: 18500 },
        { x: 1430438400000, y: 20009 },
        { x: 1433116800000, y: 22290 },
        { x: 1435708800000, y: 21629 },
        { x: 1438387200000, y: 22226 },
        { x: 1441065600000, y: 21400 }
      ],
      key: "Telur"
    }
  ];

  $scope.data = data;
});
