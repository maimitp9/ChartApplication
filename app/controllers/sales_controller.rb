class SalesController < ApplicationController
  def index
  end
  
  def search
  	@abc = [1,2,3,4,5,6,4,5,8,7,9,4,56,1]
  	sale_by_month = Sale.where('tenpo = ?', params[:tenpo_code].to_i).group(:sale_month).sum(:uriage).sort
    profit_by_month = ProfitLoss.where('tenpo = ?', params[:tenpo_code].to_i).group(:pl_month).sum(:rieki).sort
    @month = Array.new
    sale_by_month.each_with_index do |s, index|
       @month[index] = s[0]
       # use key, value and index as desired
    end
    @month_profit = Array.new
    profit_by_month.each_with_index do |p, i|
    	@month_profit[i] = p[1].to_i
    end
     
    @sale_per = Array.new
    res = { }
    sale_by_month.zip(profit_by_month).each do |s,p,index|
    	if(s[1] != 0)
        res[s[0]] = (p[1]/s[1]*100).to_f.round(2)
      else
        res[s[0]] = 0
      end
    end
    res.each_with_index do |r,index|
    	   @sale_per[index] = r[1]
    end 

    @year_profit = Array.new
    sale_by_year = Sale.group(:sale_month).sum(:uriage).sort
    profit_by_year = ProfitLoss.group(:pl_month).sum(:rieki).sort
    res_by_year = { }
    sale_by_year.zip(profit_by_year).each do |s,p|
      if(s[1] != 0)
        res_by_year[s[0]] = (p[1]/s[1]*100).to_f.round(2)
      else
        res_by_year[s[0]] = 0
      end
    end
    res_by_year.each_with_index do |r,index|
      @year_profit[index] = r[1]
    end
  end
end
