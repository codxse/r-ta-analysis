var app = angular.module('ion-bar', ['nvd3']);

app.controller('bar-chart', function($scope) {
  $scope.options = {
    chart: {
      type: 'discreteBarChart',
      height: 450,
      margin : {
        top: 20,
        right: 20,
        bottom: 70,
        left: 55
      },
      // color:function(){
      //   return '#ff0000';
      // },
      rotateLabels: -45,
      x: function(d){return d.label;},
      y: function(d){return d.value + (1e-10);},
      showValues: true,
      valueFormat: function(d){
        return d3.format(',.2f')(d);
      },
      duration: 500,
      xAxis: {
        axisLabel: '',
        tickPadding: 5
      },
      yAxis: {
        axisLabel: 'Inflasi',
        axisLabelDistance: -10,
        showMaxMin: false,
        tickPadding: 5
      }
    }
  };

  $scope.data = [
    {
      key: "Cumulative Return",
      values: [
        {
          "label" : "Umum" ,
          "value" : 13.27
        } ,
        {
          "label" : "Bukan Makanan" ,
          "value" : 23.67
        } ,
        {
          "label" : "Makanan jadi" ,
          "value" : 21.49
        } ,
        {
          "label" : "Perumahan" ,
          "value" : 9.6
        } ,
        {
          "label" : "Sandang" ,
          "value" : 19.97
        } ,
        {
          "label" : "Kesehatan" ,
          "value" : 7.13
        } ,
        {
          "label" : "Pendidikan" ,
          "value" : 0.59
        } ,
        {
          "label" : "Transportasi" ,
          "value" : 4.85
        }
      ]
    }
  ]
});
