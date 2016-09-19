module LazyHighCharts
  module ImageExporter
    HIGHCHARTS_URI = 'https://export.highcharts.com/'

    def export_chart(format)
      highcharts_response(format)
    end

    private

    def highcharts_request(format)
        Net::HTTP
          .post_form(
            URI.parse(HIGHCHARTS_URI),
            { type: "image/#{format}", options: self.full_options }
          )
    end

    def highcharts_response(format)
      highcharts_request(format).body
    end
  end
end
