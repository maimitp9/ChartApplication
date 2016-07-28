module StatisticsHelper
  def sporters_by_age
    bar_chart sporters_by_age_charts_path, height: '500px', library: {
      title: {text: 'Sporters by age', x: -20},
      yAxis: {
         allowDecimals: false,
         title: {
             text: 'Ages count'
         }
      },
      xAxis: {
         title: {
             text: 'Age'
         }
      }
    }
  end

  def sporters_by_country
  	column_chart sporters_by_country_charts_path, height: '500px', library: {
  		title: { text: 'Sporters By Country'},
  		yAxis: {
  			allowDecimals: false,
  			title: {
  				text: 'Sporters Count'
  			}
  		},
  		xAxis: {
  			title: {
  				text: 'Country'
  			}
  		}
  	}
  end

  def results_by_country
  	column_chart results_by_country_charts_path, stacked: true, height: '500px', library: {
  		title: { text: 'Results By Countries' },
  		yAxis: {
  			allowDecimals: false,
  			title: {
  				text: 'Count'
  			}
  		},
  		xAxis:{
  			title: {
  				text: 'Countries By Place'
  			}
  		}
  	}
  end

  def competition_by_year
  	line_chart competition_by_year_charts_path, height: '500px', library: {
  		title: { text: 'Competition by year'},
  		yAxis: {
  			allowDecimals: false,
  			title: {
  				text: 'Competitions Count'
  			}
  		},
  		xAxis: {
  			title: {
  				text: 'Year'
  			}
  		}
  	}
  end
end
