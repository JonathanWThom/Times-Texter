module News
  class Nyt::Parser
    attr_reader :results

    def initialize(results)
      @results = results
    end

    def run
      attributes
    end


    private

    def attributes
      {
        title: top_result["title"],
        abstract: top_result["abstract"],
        url: top_result["url"]
      }
    end

    def top_result
      results["results"].first
    end
  end
end

## error conditions?
