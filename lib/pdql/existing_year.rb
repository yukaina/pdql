module Pdql
  # for 国土交通省　水文水質データベース任意期間 ダム諸量登録状況 (ダム諸量が登録されている年をexist_yearsに取得)
  # (http://国土交通省　水文水質データベースURL/cgi/SiteInfo.exe?ID=[観測所コード13桁,15桁]&KAWABOU=YES)
  class ExistingYear
    EXCLUDE_TEXT = '年代'.freeze
    EXISTS_MARK = '/img/ari.gif'.freeze
    REGEX_PREFIX_YEAR = /20\d\*/

    attr_reader :exist_years

    def initialize(page_doc)
      @exist_years = []
      page_doc.xpath('//table[3]/tr[position()>2]').each do |tr|
        tds_from_(tr).each_with_index do |td, idx|
          img = td.search('font/img')
          @exist_years << quantity_year(prefix_year(tr), idx) if img && img.first[:src] == EXISTS_MARK
        end
      end
    end

    private

    def tds_from_(tr)
      tr.xpath('td').reject { |td| td.text == EXCLUDE_TEXT || REGEX_PREFIX_YEAR.match(td.text) }
    end

    def prefix_year(tr)
      # 200*年代, 201*年代のみだが念のため。
      tr.xpath('td').detect { |td| REGEX_PREFIX_YEAR.match(td.text) }.text
    end

    def quantity_year(prefix_years, idx)
      prefix_years.gsub(/\*/, idx.to_s).to_i
    end
  end
end
