require 'iqengines'
require 'googleajax'
class FetchDataController < ApplicationController
  def get_data(id)
    api = IQEngines.Api('1a8fe10be00241768ebbf9dc2f850879', 'bcfd4973210d473d926798a621609229')
    imag = Image.find(id)
    @qid, response = api.send_query(imag.path)
    obj = JSON.parse(response)
    imag.update_attributes(:qid=> "#{@qid}", :response => obj['data']['error'])
    response = api.wait_results()
    obj = JSON.parse(response)
    imag.result = obj['data']['results'][0]['qid_data']
    imag.save
    label = obj['data']['results'][0]['qid_data']['labels']
    GoogleAjax.referrer = "your_domain_name_here"
    search_result = GoogleAjax::Search.web(label)
    results = search_result[:results]    
    imag.google_result_1 = results[0][:unescaped_url]
    imag.google_result_2 = results[1][:unescaped_url]
    imag.google_result_3 = results[2][:unescaped_url]
    imag.save   
  end
end
