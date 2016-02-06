module Pdql
  # ダム地方選択
  # ダム諸量 へのリンク
  class Area
    attr_reader :dams, :area_cd

    def initialize(page_doc, page_url)
      @dams = []
      setting_area_cd(page_url)

      page_doc.xpath("//table[@class = 'spread2']/tr[position()>1]").each do |tr|
        @dams << Pdql::Dam.new(tr, @area_cd)
      end
    end

    private

    def setting_area_cd(page_url)
      url = URI.parse(page_url)
      return nil if url.nil?
      @area_cd ||= url.query.split('&').find { |param| param[/areaCode=\d*/] }.gsub(/areaCode=/, '')
    end
  end
end
