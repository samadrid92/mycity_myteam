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
  var dataNames = [];
  json.forEach(function plotPoints(j){

    dataArrays.push([j.date, j.age]);
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
                startOnTick: true,
                endOnTick: true,
                showLastLabel: false
            },
            yAxis: {
                title: {
                    text: 'Age (When Memory Occured)'
                }
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
                    states: {
                        hover: {
                            marker: {
                                enabled: true
                            }
                        }
                    },
                    tooltip: {
                        headerFormat: '<b>{series.name}</b><br>',
                        pointFormat: '{point.x} (year), {point.y} years old'
                    }
                }
            },
            series: [{
                name: 'hiname',
                color: 'rgba(223, 83, 83, .5)',
                data: dataArrays
            }]
        });
  };
});

function onError(eror){
  console.log(error);
}
