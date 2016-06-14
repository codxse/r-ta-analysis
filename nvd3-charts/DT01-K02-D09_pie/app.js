var app = angular.module('ion-pie', ['nvd3']);

app.controller('struktur2006', function($scope) {
  $scope.options = {
    chart: {
      title: "Nilai",
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: true,
      donut: false,
      duration: 500,
      labelThreshold: 0.01,
      labelType: "percent",
      labelSunbeamLayout: true,
      legend: {
        margin: {
          top: 5,
          right: 35,
          bottom: 5,
          left: 0
        }
      }
    }
  };

  // $scope.data = [
  //   { key: "Primer", y: 0.57 },
  //   { key: "Tersier", y: 71.36 },
  //   { key: "Sekunder", y: 28.13 }
  // ];

  var jsonData = [ { "tahun" : 2006, "jenis_sektor" : "Tersier (Perdagangan/Angkutan/Keuangan/Jasa)", "persen_kontribusi" : 71.25 }, { "tahun" : 2006, "jenis_sektor" : "Primer (Pertanian/Pertambangan)", "persen_kontribusi" : 0.58 }, { "tahun" : 2006, "jenis_sektor" : "Sekunder (Industri/ Listrik/ Air/ Bangunan)", "persen_kontribusi" : 28.17 }, { "tahun" : 2007, "jenis_sektor" : "Primer (Pertanian/Pertambangan)", "persen_kontribusi" : 0.57 }, { "tahun" : 2007, "jenis_sektor" : "Sekunder (Industri/ Listrik/ Air/ Bangunan)", "persen_kontribusi" : 28.23 }, { "tahun" : 2007, "jenis_sektor" : "Tersier (Perdagangan/Angkutan/Keuangan/Jasa)", "persen_kontribusi" : 71.2 }, { "tahun" : 2008, "jenis_sektor" : "Tersier (Perdagangan/Angkutan/Keuangan/Jasa)", "persen_kontribusi" : 71.3 }, { "tahun" : 2008, "jenis_sektor" : "Sekunder (Industri/ Listrik/ Air/ Bangunan)", "persen_kontribusi" : 28.13 }, { "tahun" : 2008, "jenis_sektor" : "Primer (Pertanian/Pertambangan)", "persen_kontribusi" : 0.57 }, { "tahun" : 2009, "jenis_sektor" : "Tersier (Perdagangan/Angkutan/Keuangan/Jasa)", "persen_kontribusi" : 71.36 }, { "tahun" : 2009, "jenis_sektor" : "Sekunder (Industri/ Listrik/ Air/ Bangunan)", "persen_kontribusi" : 28.13 }, { "tahun" : 2009, "jenis_sektor" : "Primer (Pertanian/Pertambangan)", "persen_kontribusi" : 0.52 }, { "tahun" : 2010, "jenis_sektor" : "Tersier (Perdagangan/Angkutan/Keuangan/Jasa)", "persen_kontribusi" : 71.29 }, { "tahun" : 2010, "jenis_sektor" : "Sekunder (Industri/ Listrik/ Air/ Bangunan)", "persen_kontribusi" : 28.18 }, { "tahun" : 2010, "jenis_sektor" : "Primer (Pertanian/Pertambangan)", "persen_kontribusi" : 0.53 }, { "tahun" : 2011, "jenis_sektor" : "Sekunder (Industri/ Listrik/ Air/ Bangunan)", "persen_kontribusi" : 28 }, { "tahun" : 2011, "jenis_sektor" : "Tersier (Perdagangan/Angkutan/Keuangan/Jasa)", "persen_kontribusi" : 71.4 }, { "tahun" : 2011, "jenis_sektor" : "Primer (Pertanian/Pertambangan)", "persen_kontribusi" : 0.6 }, { "tahun" : 2012, "jenis_sektor" : "Sekunder (Industri/ Listrik/ Air/ Bangunan)", "persen_kontribusi" : 28 }, { "tahun" : 2012, "jenis_sektor" : "Primer (Pertanian/Pertambangan)", "persen_kontribusi" : 0.6 }, { "tahun" : 2012, "jenis_sektor" : "Tersier (Perdagangan/Angkutan/Keuangan/Jasa)", "persen_kontribusi" : 71.4 } ];

  // select distink from array of object jsonData
  function selectDist(distinct, jsonData) {
    var flags = [], dataDistinct = [], l = jsonData.length, i;
    for (i=0; i<l; i++) {
      if (flags[jsonData[i][distinct]]) continue;
      flags[jsonData[i][distinct]] = true;
      dataDistinct.push(jsonData[i][distinct]);
    }
    return dataDistinct;
  }

  function generateData(jsonData) {
    var tahun = selectDist("tahun", jsonData);
    return tahun.map(function(data) {
      return {
        tahun: data,
        values: generateValues(data)
      }
    })
  }

  function generateValues(tahun) {
    var values = [], l = jsonData.length, i;
    for (i=0; i<l; i++) {
      if (jsonData[i].tahun == tahun) {
        values.push(
          {
            key: jsonData[i].jenis_sektor,
            y: jsonData[i].persen_kontribusi
          }
        )
      }
    }
    return values;
  }

  var dataJSON = generateData(jsonData);
  console.log(dataJSON);

  var dataDrive = [];
  for (var i=0; i<dataJSON.length; i++) {
    dataDrive.push(
      dataJSON[i].values
    );
  }

  $scope.data = dataDrive;
  $scope.dataLength = dataDrive.length;

});
