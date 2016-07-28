class ChartsController < ApplicationController
  
  #Display sporters by age
  def sporters_by_age
  	result = Sporter.group(:age).count
    render json: [{name: 'Count', data: result}]
  end

  #display how many sporters each country has
  def sporters_by_country
  	result = { }
  	Country.all.map do |c|
  		result[c.name] = c.sporters.count
  	end
  	render json: [{name: 'Count', data: result}]
  end

  #display how many times each country took a certain place
  def results_by_country
  	result = Country.all.map do |c|
  		places = { }
  		(1..6).each do |place|
  			places[place] = c.sporters.joins(:competition_results).where("competition_results.place = #{place}").count
  		end
  		{
  			name: c.name,
  			data: places
  		}
  	end
  	render json: result
  end

  #display how many competitions were held each year.
  def competition_by_year
  	result = CompetitionResult.group_by_year(:created_at, format: '%Y').count
  	render json: [{ name: 'Count', data: result}]
  end

  def chart_by_tenpo_code
    sale_by_month = Sale.where('tenpo = ?', params[:tenpo_code].to_i).group(:sale_month).sum(:uriage)
    profit_by_month = ProfitLoss.where('tenpo = ?', params[:tenpo_code].to_i).group(:pl_month).sum(:rieki)
    res_by_month = { }
    sale_by_month.zip(profit_by_month).each do |s,p|
      if(s[1] != 0)
       res_by_month[s[0]] = (p[1]/s[1]*100).to_f.round(2)
      else
        res_by_month[s[0]] = 0
      end
    end
     sale_by_year = Sale.group(:sale_month).sum(:uriage)
     profit_by_year = ProfitLoss.group(:pl_month).sum(:rieki)
     res_by_year = { }
     sale_by_year.zip(profit_by_year).each do |s,p|
      if(s[1] != 0)
       res_by_year[s[0]] = (p[1]/s[1]*100).to_f.round(2)
      else
        res_by_year[s[0]] = 0
      end
    end
    #results = {}
    #res.each { |k,v| results[k] = v }

    default = [{ name: '店舗', data: res_by_month},{name: '全社', data: res_by_year}]
    render json: default  
=begin
[{
       name: "validation line",
       data:[ 
          ["2015-09-30",166,nil,nil], # no annotations
          ["2015-10-15",242,"Test Starts","point { ...}"] # with annotatiosn and style
       ], 
       types:[ "annotation", "style" ] # new: optional define additionals column roles
    }]
=end

  end
end
