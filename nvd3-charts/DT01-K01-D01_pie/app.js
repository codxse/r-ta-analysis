var app = angular.module('ion-pie', ['nvd3']);

app.controller('pencari-2009', function($scope) {
  $scope.options = {
    chart: {
      type: 'pieChart',
      height: 400,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: false,
      duration: 500,
      labelThreshold: 0.01,
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

  $scope.data = [
    {
      key: "Pencari kerja yang belum ditempatkan diawal tahun",
      y: 66445
    },
    {
      key: "Pencari kerja yang terdaftar",
      y: 41794
    },
    {
      key: "Pencari kerja yang ditempatkan",
      y: 12903
    },
    {
      key: "Pencari kerja yang dihapus",
      y: 0
    }
  ];
})
.controller('lowongan-2009', function($scope) {
  $scope.options = {
    chart: {
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: false,
      duration: 500,
      labelThreshold: 0.01,
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

  $scope.data = [
    {
      key: "Lowongan yang belum dipenuhi",
      y: 2875
    },
    {
      key: "Lowongan yang terdaftar",
      y: 12903
    },
    {
      key: "Lowongan yang dipenuhi",
      y: 12903
    },
    {
      key: "Lowongan yang dihapus",
      y: 0
    },
    {
      key: "Lowongan yang ada",
      y: 2875
    }
  ];
})
.controller('pencari-2010', function($scope) {
  $scope.options = {
    chart: {
      type: 'pieChart',
      height: 400,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: false,
      duration: 500,
      labelThreshold: 0.01,
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

  $scope.data = [
    {
      key: "Belum Ditempatkan",
      y: 143638
    },
    {
      key: "Terdaftar",
      y: 368726
    },
    {
      key: "Ditempatkan",
      y: 453084
    },
    {
      key: "Dihapus",
      y: 32738
    }
  ];
})
.controller('lowongan-2010', function($scope) {
  $scope.options = {
    chart: {
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: false,
      duration: 500,
      labelThreshold: 0.01,
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

  $scope.data = [
    {
      key: "Belum Dipenuhi",
      y: 706
    },
    {
      key: "Terdaftar",
      y: 454687
    },
    {
      key: "Dipenuhi",
      y: 453084
    },
    {
      key: "Dihapus",
      y: 19304
    },
    {
      key: "Gol I & Gol II",
      y: 510
    }
  ];
})
.controller('pencari-2011', function($scope) {
  $scope.options = {
    chart: {
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: false,
      duration: 500,
      labelThreshold: 0.01,
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

  $scope.data = [
    {
      key: "Belum Ditempatkan",
      y: 84962
    },
    {
      key: "Terdaftar",
      y: 358142
    },
    {
      key: "Ditempatkan",
      y: 156755
    },
    {
      key: "Dihapus",
      y: 166932
    }
  ];
})
.controller('lowongan-2011', function($scope) {
  $scope.options = {
    chart: {
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: false,
      duration: 500,
      labelThreshold: 0.01,
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

  $scope.data = [
    {
      key: "Belum Dipenuhi",
      y: 531
    },
    {
      key: "Terdaftar",
      y: 193136
    },
    {
      key: "Dipenuhi",
      y: 156755
    },
    {
      key: "Dihapus",
      y: 36156
    },
    {
      key: "Gol I & Gol II",
      y: 756
    }
  ];
})
.controller('pencari-2012', function($scope) {
  $scope.options = {
    chart: {
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: false,
      duration: 500,
      labelThreshold: 0.01,
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

  $scope.data = [
    {
      key: "Belum Ditempatkan",
      y: 93666
    },
    {
      key: "Terdaftar",
      y: 46429
    },
    {
      key: "Ditempatkan",
      y: 25341
    },
    {
      key: "Dihapus",
      y: 27114
    }
  ];
})
.controller('lowongan-2012', function($scope) {
  $scope.options = {
    chart: {
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: false,
      duration: 500,
      labelThreshold: 0.01,
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

  $scope.data = [
    {
      key: "Belum Dipenuhi",
      y: 4283
    },
    {
      key: "Terdaftar",
      y: 38204
    },
    {
      key: "Dipenuhi",
      y: 25341
    },
    {
      key: "Dihapus",
      y: 16534
    },
    {
      key: "Gol I & Gol II",
      y: 612
    }
  ];
})
.controller('pencari-2013', function($scope) {
  $scope.options = {
    chart: {
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: false,
      duration: 500,
      labelThreshold: 0.01,
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

  $scope.data = [
    {
      key: "Belum Ditempatkan",
      y: 87438
    },
    {
      key: "Terdaftar",
      y: 82728
    },
    {
      key: "Ditempatkan",
      y: 16721
    },
    {
      key: "Dihapus",
      y: 23072
    }
  ];
})
.controller('lowongan-2013', function($scope) {
  $scope.options = {
    chart: {
      title: "Lowongan",
      type: 'pieChart',
      height: 500,
      x: function(d){return d.key;},
      y: function(d){return d.y;},
      showLabels: true,
      donut: true,
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

  $scope.data = [
    {
      key: "Belum Dipenuhi",
      y: 612
    },
    {
      key: "Terdaftar",
      y: 43551
    },
    {
      key: "Dipenuhi",
      y: 16721
    },
    {
      key: "Dihapus",
      y: 24868
    },
    {
      key: "Gol I & Gol II",
      y: 0
    }
  ];
})
;
