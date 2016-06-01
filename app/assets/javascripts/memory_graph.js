$(function () {
var cityId = $('#cityId').val();
var teamId = $('#teamId').val();

console.log("11", cityId);
console.log("11", teamId);

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
    console.log("2. here is each piece of json: ", j);
    console.log("3", j.name);
    console.log("4", j.age);
    console.log("5", j.date);
    dataArrays.push([j.date, j.age]);

    console.log("6", dataArrays);

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

// var memoriesRow = $('memories-row');
// console.log(memoriesRow);
//
// for (var i=0; i<memoriesRow.length; i++){
//   console.log(i);
// }




// $(function () {
//     $('#scatter-plot').highcharts({
//         chart: {
//             type: 'scatter',
//             zoomType: 'xy'
//         },
//         title: {
//             text: 'Memory Chart'
//         },
//         xAxis: {
//             title: {
//                 enabled: true,
//                 text: 'Date (year)'
//             },
//             startOnTick: true,
//             endOnTick: true,
//             showLastLabel: false
//         },
//         yAxis: {
//             title: {
//                 text: 'Age (When Memory Occured)'
//             }
//         },
//         legend: {
//             layout: 'vertical',
//             align: 'left',
//             verticalAlign: 'top',
//             x: 100,
//             y: 70,
//             floating: true,
//             backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF',
//             borderWidth: 1
//         },
//         plotOptions: {
//             scatter: {
//                 marker: {
//                     radius: 5,
//                     states: {
//                         hover: {
//                             enabled: true,
//                             lineColor: 'rgb(100,100,100)'
//                         }
//                     }
//                 },
//                 states: {
//                     hover: {
//                         marker: {
//                             enabled: true
//                         }
//                     }
//                 },
//                 tooltip: {
//                     headerFormat: '<b>{series.name}</b><br>',
//                     pointFormat: '{point.x} cm, {point.y} kg'
//                 }
//             }
//         },
//         series: [{
//             name: 'Female',
//             color: 'rgba(223, 83, 83, .5)',
//             data: [[161.2, 51.6], [167.5, 59.0], [159.5, 49.2], [157.0, 63.0], [155.8, 53.6],
//                 [170.0, 59.0], [159.1, 47.6], [166.0, 69.8], [176.2, 66.8]]
//
//         }]
//     });
// });
