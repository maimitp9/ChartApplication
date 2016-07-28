module SalesHelper
	def get_sale_data(tenpo_code)
		@sale = Sale.where('tenpo = ?', params[:tenpo_code].to_i).group(:sale_month).sum(:uriage)
	end

	def get_profite_data(tenpo_code)
		@profit = ProfitLoss.where('tenpo = ?', params[:tenpo_code].to_i).group(:pl_month).sum(:rieki)
	end
   
	def chart_by_tenpo_code(tenpo_code)
		line_chart chart_by_tenpo_code_charts_path(tenpo_code: tenpo_code),discrete: true, height: '500px', library: {
		  		yAxis: {
		  			title: {
		  				text: 'Sale'
		  			}
		  		},
		  		xAxis: {
		  			title: {
		  				text: 'Month'
		  			}
		  		},
		  		legend: {
		            layout: 'horizontal',
		            align: 'center',
		            verticalAlign: 'top',
		            floating: true
		        }
		 }
	end
end
