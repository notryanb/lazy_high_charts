module LazyHighCharts
  module ImageExporter
    HIGHCHARTS_URI = 'https://export.highcharts.com/'
    
    # Refer to Highcharts Export Docs for valid POST Parameters
    # Defaults to 'image/png'
    #
    # http://www.highcharts.com/docs/export-module/export-module-overview
    def export_chart(opts = {})
      params = post_params(opts)
      highcharts_response(params)
    end

    private

    def post_params(opts)
      opts[:options] ||= self.full_options
      opts[:type] ||= 'image/png'
      opts
    end

    def highcharts_request(params)
        Net::HTTP
          .post_form(
            URI.parse(HIGHCHARTS_URI),
            params
          )
    end

    def highcharts_response(params)
      highcharts_request(params).body
    end
  end
end
