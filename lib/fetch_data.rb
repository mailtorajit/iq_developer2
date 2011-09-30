class FetchData < Struct.new(:qid) 
  def perform
      FetchDataController.new.get_data(qid)      
  end
end
