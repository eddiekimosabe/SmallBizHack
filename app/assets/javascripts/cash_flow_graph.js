$(function () {
    $('#container').highcharts({
        chart: {
            zoomType: 'xy'
        },
        plotOptions: {
                column: {
                    stacking: 'normal'
                }
            },
        title: {
            text: businessName
        },
        subtitle: {
            text: 'Cash Flow Graph'
        },
        yAxis:
        { // Primary yAxis
            labels: {
                format: '{value}',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            },
            title: {
                text: 'Amount ($)',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            }
        },
        tooltip: {
            shared: true
        },
        legend: {
            layout: 'vertical',
            align: 'left',
            x: 120,
            verticalAlign: 'top',
            y: 100,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
        },
        xAxis: [{
            categories: xAxis,
            labels: {
                rotation: -45
              },
            title: {
                text: 'Date',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            }
        }],
        series: [{
            name: 'Receivable Invoices',
            type: 'column',
            data: receivableVars,
            tooltip: {
                valuePrefix: '$'
            },
            stack : '0'

        },{
            name: 'Payable Invoices',
            type: 'column',
            data: payableVars,
            tooltip: {
                valuePrefix: '$'
            },
            stack : '0'

        }, {
            name: 'Net Cash Flow',
            type: 'spline',
            data: netVars,
            tooltip: {
                valuePrefix: '$'
            }
        }]
    });
});
