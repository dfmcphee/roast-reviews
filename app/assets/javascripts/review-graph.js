function createBeansTasteGraph(graphElement, data) {
  var myChart = new Chart(graphElement, {
      type: 'line',
      data: {
          labels: ['Sour', 'Sweet', 'Salty', 'Nutty', 'Bitter'],
          datasets: [{
              data: data,
              backgroundColor: 'rgba(0, 0, 0, 0.3)'
          }]
      },
      options: {
          scales: {
              yAxes: [{
                  display: false
              }]
          },
          legend: false
      }
  });
}
