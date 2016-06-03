$(function () {
var cityId = $('#cityId').val();
var teamId = $('#teamId').val();

$.ajax({
  method: 'GET',
  url: '/api/cities/' + cityId + '/teams/' + teamId + '/memories',
  success: onSuccess,
  error: onError
});

function onSuccess(json){
  console.log(" 1. here is the json: ", json)
  var dataArrays = [];
  json.forEach(function plotPoints(j){
    var newDate = Date.parse(j.date);
    dataArrays.push({
                    x: newDate,
                    y: j.age,
                    name: j.name,
                    description: j.description
                  });
  });
        $('#scatter-plot').highcharts({
            chart: {
                type: 'scatter',
                zoomType: 'xy'
            },
            title: {
                text: 'Memory Chart'
            },
            xAxis: {
                title: {
                    enabled: true,
                    text: 'Date (year)'
                },
                type: 'datetime',
                dateTimeLabelFormats: {
                  millisecond: '%H:%M:%S.%L',
                	second: '%H:%M:%S',
                	minute: '%H:%M',
                	hour: '%H:%M',
                	day: '%e. %b',
                	week: '%e. %b',
                	month: '%b \'%y',
                	year: '%Y'
                },
                startOnTick: true,
                endOnTick: true,
                showLastLabel: false
            },
            yAxis: {
                title: {
                    text: 'Age (When Memory Occured)'
                },
                max: 100
            },
            legend: {
                layout: 'vertical',
                align: 'left',
                verticalAlign: 'top',
                x: 100,
                y: 70,
                floating: true,
                backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
                borderWidth: 1
            },
            plotOptions: {
              scatter: {
                  marker: {
                      radius: 5,
                      states: {
                          hover: {
                              enabled: true,
                              lineColor: 'rgb(100,100,100)'
                          }
                      }
                  },
                  cursor: 'pointer',
                  point: {
                    events: {
                      click: function () {
                        alert("Name:" + ' ' + this.name + '\n' +
                              "Date:" + ' ' + (this.x) + '\n' +
                              "Age:" + ' ' + this.y + '\n' +
                              "Memory:" + ' ' + this.description);
                      }
                    }
                  }
                }
            },
            series: [{
                name: 'Memory',
                color: 'rgba(0, 92, 230, .5)',
                data: dataArrays
            }]
        });
  };
});

function onError(eror){
  console.log(error);
}
